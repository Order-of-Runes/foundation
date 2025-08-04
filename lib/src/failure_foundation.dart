// Copyright (c) 2025 Order of Runes Authors. All rights reserved.

import 'dart:convert';

import 'package:equatable/equatable.dart';

class FailureFoundation extends Equatable implements Exception {
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
  final double? code;
  final String? source;

  @override
  List<Object?> get props => [
    message,
    detail,
    stackTrace,
    code,
    source,
    if (additionalProps != null) ...additionalProps!,
  ];

  @override
  String toString() {
    final map = {
      'source': source,
      'code': code,
      'message': message,
      if (detail != null) 'detail': detail,
      if (stackTrace != null) 'stack_trace': stackTrace,
      if (toStringValues != null) ...toStringValues!,
    };

    return const JsonEncoder.withIndent(' ').convert(map);
  }

  Map<String, String>? get toStringValues => null;

  List<Object?>? get additionalProps => null;
}
