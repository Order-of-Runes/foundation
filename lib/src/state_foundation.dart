// Copyright (c) 2025 Order of Runes Authors. All rights reserved.

import 'package:equatable/equatable.dart';
import 'package:foundation/src/failure_foundation.dart';

abstract class StateFoundation extends Equatable {
  const StateFoundation({
    this.failure,
    this.loading = Loading.inline,
    this.failureDisplay = FailureDisplay.inline,
    this.loadingTitle,
    this.loadingSubtitle,
    this.canDismissLoading = false,
  });

  final FailureFoundation? failure;
  final Loading loading;
  final FailureDisplay failureDisplay;
  final String? loadingTitle;
  final String? loadingSubtitle;

  /// Can loading be dismissed by the user
  ///
  /// Only applies to [Loading.progressDialog]
  final bool canDismissLoading;

  StateFoundation setFailure(FailureFoundation failure);

  StateFoundation setFailureDisplay(FailureDisplay display);

  StateFoundation setLoading({
    Loading loading = Loading.inline,
    String? title,
    String? subtitle,
    bool canDismissLoading = false,
  });

  bool get hasFailed => failure != null;

  bool get hasLoaded => loading == Loading.none && !hasFailed;
}

/// Dictates how loading should be shown in the UI
/// LoadingDisplay.inline
/// LoadingDisplay.top
enum Loading {
  /// Show loading in the page itself
  ///
  /// For cases when a page itself is not yet ready to display content
  inline,

  /// Show loading at the end of a list
  ///
  /// For cases when pagination is required for a list
  pagination,

  /// Use this for cases when the page is ready and is visible.
  /// If the page is not yet ready or the user needs to be shown that
  /// the page is building, go with [Loading.inline]
  dialog,

  /// No loading is to be shown
  none,
}

/// Dictates how a failure is to be displayed in the UI
/// FailureDisplay.inline
/// FailureDisplay.popup
/// FailureDisplay.snackBar
enum FailureDisplay {
  /// Show failure in a popup modal (Dialog)
  dialog,

  /// Show failure in the page itself
  inline,

  /// Show failure in a snack bar
  snackBar,
}
