import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fusshn/src/common/dimens.dart';
import 'package:fusshn/src/ui/common_widgets/fusshn_appbar.dart';

@RoutePage()
class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: homeTabHorizontalPadding),
            child: Column(
              children: [
                const FusshnAppBar(label: 'Privacy Policy'),
                Text(
                  _termsAndCOnditions,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _termsAndCOnditions =
    '''At Fusshn, we strive to offer you a smooth and fair purchasing experience that enables you to enjoy live events without any complications. To accomplish this, we have implemented a policy that ensures your satisfaction and comprehension of the buying process through our website and mobile apps. This policy pertains to all purchases made on our website from November 1, 2023, including primary ticket sales and transferring tickets to your acquaintances. Our website encompasses the domain which is known as the "Site." It's crucial to note that this purchase policy is supplementary to our terms of use that govern your use of our website and the possession, purchase, or use of any Fusshn products, services, or tickets. Please carefully review both policies before making any purchases on our website. If you have any questions or concerns regarding our purchase policy or any other issues, feel free to contact us, and our team will gladly assist you. Currency Payment Methods Who You Are Buying From Pricing and Availability Order Confirmation and Processing Service Fees, Order Processing Fees, Taxes and Shipping Charges. Number of Tickets or “Ticket Limits” Ticket Transfer Opening Acts / Festival Acts Canceled, Postponed, Rescheduled, and Moved Events Refunds, Credits, and Exchanges Account, Order, and Billing Information Verification Pricing and Other Errors Delivery Options Unlawful Resale of Tickets; Promotions You Are Subject to Search Limitation of Liability License; Ejection and Cancelation; No Redemption Value Recording, Transmission and Exhibition 1. Currency All prices for tickets and other items available for purchase on Boozlo are stated in Indian Rupees (INR). This means that any transaction you make through Boozlo will be processed in INR. It is important to note that exchange rates may apply if you are purchasing tickets from outside of India. 2. Payment Methods We want to make the purchasing process as convenient as possible for our customers. To accommodate your needs, we accept several methods of payment. These payment methods include various payment options including Digital wallets like Paytm/ Phone pe/ Mobikwik etc, VISA/ Mastercard/ Rupay Debit card or Credit card, UPI/ QR, Net Banking and Pay Later. We understand that everyone has different preferences when it comes to payment, which is why we offer a variety of payment options. This ensures that you can choose the payment method that works best for you. Please note that the availability of payment methods may vary depending on the event you wish to attend. If you have any questions regarding payment options for a specific event, please contact our customer service team at hello@boozlo.com , and we will be happy to assist you.''';
