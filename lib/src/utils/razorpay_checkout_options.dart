import '../common/image_network.dart';

Map<String, dynamic> getTestCheckoutOptions({
  required double amount,
  String? description,
  Map<String, dynamic>? prefill,
}) {
  Map<String, dynamic> options = {
    'key': 'rzp_test_v7vt4lUfa6mXMK',
    'amount': amount,
    'name': 'Fusshn',
    'description': description,
    'image': fusshnAppLogoUrl,
    'retry': {'enabled': true, 'max_count': 1},
    'send_sms_hash': true,
    'prefill': prefill,
    'theme': {
      'color': '#111111',
      'backdrop_color': '#F1F1F1',
    },
    'external': {
      'wallets': ['paytm']
    }
  };
  return options;
}
