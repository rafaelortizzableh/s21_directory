import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';

/// This provider is used to check if the layout is one of the following:
/// - mobile
/// - tablet
/// - desktop
final layoutProvider =
    StateNotifierProvider.autoDispose<LayoutController, Layout>((ref) {
  return LayoutController(
    AppConstants.navigatorKey,
  );
});

class LayoutController extends StateNotifier<Layout>
    with WidgetsBindingObserver {
  LayoutController(this._navigatorKey)
      : super(_assignInitialValue(_navigatorKey)) {
    init();
  }

  static Layout _assignInitialValue(GlobalKey<NavigatorState> navigatorKey) {
    final view = View.of(navigatorKey.currentContext!);
    final size = LayoutController._getSizeFromView(view);
    final initialLayout = size.width.layout;
    return initialLayout;
  }

  final GlobalKey<NavigatorState> _navigatorKey;

  void init() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _onMetricsChanged();
  }

  void _onMetricsChanged() {
    final size = _getSizeFromView(
      _navigatorKey.currentContext!.view,
    );
    _setLayout(size.width.layout);
  }

  void _setLayout(Layout layout) {
    if (state == layout) return;
    state = layout;
  }

  static Size _getSizeFromView(FlutterView view) {
    final size = MediaQueryData.fromView(view).size;
    return size;
  }
}

enum Layout { mobile, tablet, desktop }

extension _TypeOfLayoutExtension on double {
  Layout get layout {
    if (_isMobileLayout) return Layout.mobile;
    if (_isTabletLayout) return Layout.tablet;
    if (_isDesktopLayout) return Layout.desktop;
    return Layout.mobile;
  }

  bool get _isMobileLayout => this < 600;
  bool get _isTabletLayout => this >= 600 && this < 1200;
  bool get _isDesktopLayout => this >= 1200;
}
