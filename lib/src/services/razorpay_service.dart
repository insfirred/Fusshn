import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

final razorProvider = Provider<Razorpay>(
  (ref) => Razorpay(),
);
