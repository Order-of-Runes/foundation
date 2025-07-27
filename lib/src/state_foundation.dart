// Copyright (c) 2025 Order of Runes Authors. All rights reserved.

import 'package:equatable/equatable.dart';

abstract class StateFoundation extends Equatable {
  const StateFoundation();

  bool get hasFailed;

  bool get hasLoaded;
}
