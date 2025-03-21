import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/dimens.dart';
import '../common_widgets/fusshn_appbar.dart';

@RoutePage()
class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  void _launchMailClient() async {
    String mailUrl = 'mailto:fusshn.business@gmail.com';
    try {
      await launchUrlString(mailUrl);
    } catch (e) {
      log(e.toString());
    }
  }

  void _launchWhatsAppClient() async {
    String mailUrl = 'https://wa.me/919310824206?text=Hii';
    try {
      await launchUrlString(mailUrl);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: homeTabHorizontalPadding),
          child: Column(
            children: [
              const FusshnAppBar(label: 'Fusshn Support'),
              const SizedBox(height: 30),
              _SupportItem(
                icon: FontAwesomeIcons.envelope,
                label: 'Email',
                description:
                    'Send us an email with your query, and we will get back to you at the earliest',
                onTap: _launchMailClient,
              ),
              const SizedBox(height: 30),
              _SupportItem(
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp',
                description:
                    'Message us on whatsapp, and we will help solving your issue right there!',
                onTap: _launchWhatsAppClient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportItem extends StatelessWidget {
  const _SupportItem({
    required this.icon,
    required this.label,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String description;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
