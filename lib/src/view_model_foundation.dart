// Copyright (c) 2025 Order of Runes Authors. All rights reserved.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foundation/src/state_foundation.dart';

abstract class ViewModelFoundation<S extends StateFoundation> extends AutoDisposeNotifier<S> {}

abstract class StickyViewModelFoundation<S extends StateFoundation> extends Notifier<S> {}
