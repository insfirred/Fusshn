// DATA and MODELS
class TermsAndConditionModel {
  final String mainPoint;
  final List<SubPointModel> subPoints;

  const TermsAndConditionModel({
    required this.mainPoint,
    required this.subPoints,
  });
}

class SubPointModel {
  final String? header;
  final String subPoint;

  const SubPointModel({
    this.header,
    required this.subPoint,
  });
}

List<TermsAndConditionModel> termsAndConditions = <TermsAndConditionModel>[
  const TermsAndConditionModel(
    mainPoint: 'Acceptance of Terms',
    subPoints: [
      SubPointModel(
        subPoint:
            'By downloading, installing, or using Fusshn, you confirm that you agree to these Terms and are legally capable of entering into this agreement. If you do not accept any part of these Terms, please refrain from using Fusshn.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'User Accounts',
    subPoints: [
      SubPointModel(
        header: 'Eligibility',
        subPoint:
            'You must be at least 18 years old to use Fusshn. Minors (under 18) may use Fusshn only under the supervision of a legal guardian.',
      ),
      SubPointModel(
        header: 'Registration',
        subPoint:
            'To access certain features, you will need to create an account. You agree to provide accurate and current information and to update it promptly if any changes occur.',
      ),
      SubPointModel(
        header: 'Account Responsibility',
        subPoint:
            'You are solely responsible for all activities that occur under your account, including maintaining the security of your login information. Fusshn is not liable for any unauthorized access to your account.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Ticket Purchases and Payments',
    subPoints: [
      SubPointModel(
        header: 'Ticket Sales',
        subPoint:
            'Fusshn acts as an intermediary between you and event organizers, facilitating ticket sales. Ticket prices and availability are controlled by the event organizers.',
      ),
      SubPointModel(
        header: 'Pricing',
        subPoint:
            'Ticket prices are displayed at checkout and may include service fees, booking charges, or taxes. All prices are final and may vary depending on the event, location, or demand.',
      ),
      SubPointModel(
        header: 'Payment Processors',
        subPoint:
            'Payments are securely handled by trusted third-party processors. By purchasing tickets, you agree to the terms and conditions of these processors.',
      ),
      SubPointModel(
        header: 'Order Confirmation',
        subPoint:
            'Your order is confirmed only once payment has been successfully processed. You will receive an electronic ticket, which serves as proof of purchase. Fusshn reserves the right to cancel or decline orders in case of payment issues or suspected fraud.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Ticket Use And Access',
    subPoints: [
      SubPointModel(
        header: 'Non-Transferability',
        subPoint:
            'Unless specified, tickets purchased on Fusshn are non-transferable and are strictly for personal use.',
      ),
      SubPointModel(
        header: 'Valid Identification',
        subPoint:
            'You may be required to present valid identification along with your ticket to gain entry to events.',
      ),
      SubPointModel(
        header: 'Compliance with Event Rules',
        subPoint:
            'Each event may have specific rules, including age restrictions, dress codes, or prohibited items. You agree to abide by these rules as set by the event organizer.',
      ),
      SubPointModel(
        header: 'Prohibition on Resale',
        subPoint:
            'Unauthorized resale or attempted resale of tickets is strictly prohibited. Fusshn reserves the right to cancel accounts engaging in resale activities.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Events Cancellations, Changes, Refunds',
    subPoints: [
      SubPointModel(
        header: 'Event Cancellations',
        subPoint:
            'In case of event cancellation, Fusshn will attempt to notify you promptly via email or app notifications. Refunds or exchanges are subject to the organizer\'s policy, and Fusshn facilitates these refunds on behalf of the organizer.',
      ),
      SubPointModel(
        header: 'Rescheduled Events',
        subPoint:
            'If an event is rescheduled, the original ticket may still be valid for the new date. You are encouraged to verify details with the event organizer.',
      ),
      SubPointModel(
        header: 'Refund Policy',
        subPoint:
            'Refunds are only issued per the organizer\'s refund policy. Fusshn cannot guarantee refunds beyond the policies set by the event organizer.',
      ),
      SubPointModel(
        header: 'Event Modification',
        subPoint:
            'Fusshn is not responsible for any changes to event details, including time, date, lineup, or venue. It\'s advisable to confirm event specifics closer to the date.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'User Conduct and Obligations',
    subPoints: [
      SubPointModel(
        subPoint:
            'You agree not to engage in any prohibited activities on Fusshn, including unauthorized commercial use of tickets or listings, attempting to access or modify the app\'s source code, using bots, scrapers, or other automated tools to extract data from Fusshn.',
      ),
      SubPointModel(
        header: 'Respectful behavior',
        subPoint:
            'Users are expected to engage respectfully with event organizers, Fusshn staff, and other users. Discriminatory, offensive, or abusive conduct may result in account suspension or ban.',
      ),
      SubPointModel(
        header: 'Reporting Issues',
        subPoint:
            'If you encounter issues with ticketing, event information, or user interactions, please report them to Fusshn\'s customer support promptly.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Intellectual Property and Content Use',
    subPoints: [
      SubPointModel(
        header: 'Ownership of content',
        subPoint:
            'All content, including graphics, logos, images, text, and software, is the property of Fusshn or its licensors. Unauthorized use is strictly prohibited.',
      ),
      SubPointModel(
        header: 'Limited License',
        subPoint:
            'Fusshn grants you a limited, revocable license to use the app for personal, non-commercial purposes only.',
      ),
      SubPointModel(
        header: 'User-Generated Content',
        subPoint:
            'By posting or uploading content to Fusshn (such as reviews or comments), you grant Fusshn a non-exclusive, royalty-free license to use, distribute, or modify the content as part of platform operations.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'mainPoint',
    subPoints: [
      SubPointModel(
        header: 'Data Colleciton',
        subPoint:
            'Fusshn collects and processes personal information to provide services. By using Fusshn, you agree to our data handling practices as outlined in our Privacy Policy.',
      ),
      SubPointModel(
        header: 'Data Security',
        subPoint:
            'We employ measures to protect your information from unauthorized access, but please remember that no platform is completely secure. Fusshn is not liable for data breaches caused by external factors.',
      ),
      SubPointModel(
        header: 'User Rights',
        subPoint:
            'You have the right to access, correct, and delete your personal information. For any inquiries about data privacy, please contact Fusshn\'s support.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Disclaimer of Warranties',
    subPoints: [
      SubPointModel(
        header: '"As-Is Basis"',
        subPoint:
            'Fusshn is provided "as-is" and "as-available." We do not guarantee uninterrupted, error-free access or that the platform will meet your expectations.',
      ),
      SubPointModel(
        header: 'Event Quality',
        subPoint:
            'Fusshn is not responsible for the quality or content of events listed. We only act as a facilitator and do not influence event planning or management.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Limitation of Liability',
    subPoints: [
      SubPointModel(
        header: 'Direct Damages',
        subPoint:
            'To the maximum extent permitted by law, Fusshn\'s liability is limited to the amount paid for the specific ticket purchase that led to the claim.',
      ),
      SubPointModel(
        header: 'No Indirect Damages',
        subPoint:
            'Fusshn is not liable for indirect damages, including loss of opportunity, data loss, or reputational harm resulting from your use of the app.',
      ),
      SubPointModel(
        header: 'Third Party Liablities',
        subPoint:
            'Fusshn is not responsible for actions, omissions, or misconduct by event organizers or third-party vendors.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Indemnification',
    subPoints: [
      SubPointModel(
        subPoint:
            'You agree to indemnify and hold harmless Fusshn, its affiliates, officers, and employees from any claims, damages, or expenses resulting from: Violation of these Terms, misuse of the platform or services, infringement of third-party rights through your account.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Governing Law and Dispute Resolution',
    subPoints: [
      SubPointModel(
        header: 'Applicable Law',
        subPoint:
            'These Terms and any disputes are governed by the laws of [Your Jurisdiction].',
      ),
      SubPointModel(
        header: 'Dispute Resolution',
        subPoint:
            'For unresolved disputes, we encourage you to contact Fusshn\'s support for informal resolution. Otherwise, disputes may be resolved through arbitration in [Location/Your Jurisdiction].',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint: 'Feedback',
    subPoints: [
      SubPointModel(
        header: 'Feedback',
        subPoint:
            'We welcome feedback to help improve our platform and services. Any suggestions or comments submitted to Fusshn may be used without restriction.',
      ),
    ],
  ),
  const TermsAndConditionModel(
    mainPoint:
        'By using Fusshn, you confirm that you have read, understood, and agree to these Terms.\nThank you for trusting Fusshn to enhance your event experience!',
    subPoints: [],
  ),
];
