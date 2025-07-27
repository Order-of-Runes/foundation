// Copyright (c) 2025 Order of Runes Authors. All rights reserved.

import 'package:equatable/equatable.dart';

abstract class FailureFoundation<C, S> extends Equatable implements Exception {
  const FailureFoundation(
    this.message, {
    this.detail,
    this.stackTrace,
    this.code,
    this.source,
  });

  final String message;
  final String? detail;
  final StackTrace? stackTrace;
  final C? code;
  final S? source;
}
