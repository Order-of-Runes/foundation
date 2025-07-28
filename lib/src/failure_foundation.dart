// Copyright (c) 2025 Order of Runes Authors. All rights reserved.

import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class FailureFoundation extends Equatable implements Exception {
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
  final BaseCode? code;
  final BaseSource? source;

  @override
  List<Object?> get props => [
    message,
    detail,
    stackTrace,
    code,
    source,
    ...additionalProps,
  ];

  @override
  String toString() {
    final map = {
      'source': source?.name,
      'code': code?.value.toString(),
      'message': message,
      if (detail != null) 'detail': detail,
      if (stackTrace != null) 'stack_trace': stackTrace,
      ...toStringValues,
    };

    return const JsonEncoder.withIndent(' ').convert(map);
  }

  Map<String, String> get toStringValues;

  List<Object?> get additionalProps;
}

abstract interface class BaseCode {
  double get value;
}

abstract interface class BaseSource {
  String get name;
}
