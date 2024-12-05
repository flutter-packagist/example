import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SliverCompat {
  MultiSliverCompatScrollController? _majorScrollController;
  Key? debugKey;

  SliverCompat({this.debugKey});

  final HashMap<Key, MultiSliverCompatScrollController> _scrollPool = HashMap();

  ScrollController generateMajorController() {
    _majorScrollController ??=
        MultiSliverCompatScrollController.major(const Key("Major"), this);
    return _majorScrollController!;
  }

  ScrollController generateMinorController({required Key tag}) {
    if (_scrollPool[tag] != null) {
      return _scrollPool[tag]!;
    }
    MultiSliverCompatScrollController newController =
        MultiSliverCompatScrollController.minor(tag, this);
    _scrollPool[tag] = newController;
    return newController;
  }

  // 接收child提交的滚动量
  double submitUserOffset(
      MultiSliverCompatScrollPosition? submitter, double delta) {
    if (delta < 0) {
      return onScrollToTop(submitter, delta);
    } else {
      return onScrollToBottom(submitter, delta);
    }
  }

  double onScrollToTop(
      MultiSliverCompatScrollPosition? submitter, double delta) {
    double remaining = delta;

    /// 内部消化
    // remaining = _majorScrollPosition.applyClampedDragUpdate(remaining); // 1
    // print('($debugKey)ToTop major消耗剩余:$remaining');
    // if (remaining == 0) {
    //   return 0;
    // }
    remaining = submitter?.applyClampedDragUpdate(remaining) ?? remaining;
    print('($debugKey)ToTop minor消耗剩余:$remaining,submitter:$submitter');

    return remaining;
  }

  double onScrollToBottom(
      MultiSliverCompatScrollPosition? submitter, double delta) {
    double remaining = delta;
    remaining = submitter?.applyClampedDragUpdate(remaining) ?? remaining; // 2
    print('($debugKey)ToBottom major消耗剩余:$remaining');
    if (remaining == 0) {
      return 0;
    }
    // remaining = _majorScrollPosition.applyClampedDragUpdate(remaining);
    // print('($debugKey)ToBottom minor消耗剩余:$remaining,submitter:$submitter');

    return remaining;
  }
}

class MultiSliverCompatScrollController extends ScrollController {
  Key? debugKey;
  SliverCompat sliverCompat;
  late bool isMajorScrollController;

  MultiSliverCompatScrollController._(this.sliverCompat, {this.debugKey});

  MultiSliverCompatScrollController.major(this.debugKey, this.sliverCompat) {
    isMajorScrollController = true;
  }

  MultiSliverCompatScrollController.minor(this.debugKey, this.sliverCompat) {
    isMajorScrollController = false;
  }

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics,
      ScrollContext context, ScrollPosition? oldPosition) {
    if (isMajorScrollController) {
      return MajorScrollPosition(sliverCompat,
          physics: const ScrollPhysics(), context: context, debugKey: debugKey);
    } else {
      return MinorScrollPosition(sliverCompat,
          physics: const ScrollPhysics(), context: context, debugKey: debugKey);
    }
  }
}

class MultiSliverCompatScrollPosition extends ScrollPositionWithSingleContext {
  SliverCompat sliverCompat;
  Key? debugKey;

  MultiSliverCompatScrollPosition(this.sliverCompat,
      {required super.physics, required super.context, this.debugKey});

  /// 所有的偏移量统一交给SliverCompat去处理；
  @override
  void applyUserOffset(double delta) {
    sliverCompat.submitUserOffset(this, delta);
  }

  /// 食用滚动量，然后返回未吃完的滚动量
  double applyClampedDragUpdate(double delta) {
    // If we are going towards the maxScrollExtent (negative scroll offset),
    // then the furthest we can be in the minScrollExtent direction is negative
    // infinity. For example, if we are already overscrolled, then scrolling to
    // reduce the overscroll should not disallow the overscroll.
    //
    // If we are going towards the minScrollExtent (positive scroll offset),
    // then the furthest we can be in the minScrollExtent direction is wherever
    // we are now, if we are already overscrolled (in which case pixels is less
    // than the minScrollExtent), or the minScrollExtent if we are not.
    //
    // In other words, we cannot, via applyClampedDragUpdate, _enter_ an
    // overscroll situation.
    //
    // An overscroll situation might be nonetheless entered via several means.
    // One is if the physics allow it, via applyFullDragUpdate (see below). An
    // overscroll situation can also be forced, e.g. if the scroll position is
    // artificially set using the scroll controller.
    final double min =
        delta < 0.0 ? -double.infinity : math.min(minScrollExtent, pixels);
    // The logic for max is equivalent but on the other side.
    final double max = delta > 0.0
        ? double.infinity
        // If pixels < 0.0, then we are currently in overscroll. The max should be
        // 0.0, representing the end of the overscrolled portion.
        : pixels < 0.0
            ? 0.0
            : math.max(maxScrollExtent, pixels);
    final double oldPixels = pixels;
    final double newPixels = clampDouble(pixels - delta, min, max);
    final double clampedDelta = newPixels - pixels;
    if (clampedDelta == 0.0) {
      return delta;
    }
    final double overscroll = physics.applyBoundaryConditions(this, newPixels);
    final double actualNewPixels = newPixels - overscroll;
    final double offset = actualNewPixels - oldPixels;
    if (offset != 0.0) {
      forcePixels(actualNewPixels);
      didUpdateScrollPositionBy(offset);
    }
    return delta + offset;
  }
}

class MajorScrollPosition extends MultiSliverCompatScrollPosition {
  MajorScrollPosition(super.sliverCompat,
      {required super.physics, required super.context, super.debugKey});
}

class MinorScrollPosition extends MultiSliverCompatScrollPosition {
  MinorScrollPosition(super.sliverCompat,
      {required super.physics, required super.context, super.debugKey});
}
