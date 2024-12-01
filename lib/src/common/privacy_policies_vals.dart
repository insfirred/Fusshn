List<PrivacyPolicyModel> privacyPolicies = [
  // 1st
  PrivacyPolicyModel(
    title: 'Introduction',
    subModels: [],
    points: [
      PrivacyPolicyPointModel(
        header: '',
        point:
            'Fusshn (“we,” “us,” or “our”) operates as a platform that connects users with event organizers for purchasing and selling event tickets. Protecting your privacy is central to our operations.',
      ),
      PrivacyPolicyPointModel(
        header: '',
        point:
            'This Privacy Policy applies to information collected through our app, website, and related services. It does not cover third-party websites, services, or applications that you may access through Fusshn.',
      ),
    ],
  ),

  // 2nd
  PrivacyPolicyModel(
    title: 'Information We Collect',
    subModels: [
      SubPrivacyPolicyModel(
        subtitle: 'Personal Information',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'Account Registration',
            point:
                'When creating an account, we may ask for personal details, including your name, email address, and phone number.',
          ),
          PrivacyPolicyPointModel(
            header: 'Payment Information',
            point:
                'When purchasing tickets, we collect billing information (such as payment card details), which are securely processed through our payment partners.',
          ),
          PrivacyPolicyPointModel(
            header: 'Contact Information',
            point:
                'We may also collect your email address, phone number, or social media profile if provided during sign-up or when subscribing to newsletters.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Location Data',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'Location-Based Services',
            point:
                'With your permission, we may collect real-time location data to provide recommendations on events near you and to tailor the event listings based on your location.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Usage Data',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'App Interactions',
            point:
                'We collect information on how you interact with the Fusshn app, including pages visited, time spent, features accessed, and links clicked.',
          ),
          PrivacyPolicyPointModel(
            header: 'Event Preferences',
            point:
                'We may collect information about events you\'re interested in, attend, or purchase, to personalize recommendations.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Device Information',
        pointModels: [
          PrivacyPolicyPointModel(
            header: '',
            point:
                'We collect technical information about the device you\'re using, including device type, operating system, IP address, unique device identifiers, and crash reports to enhance app functionality and compatibility.',
          ),
        ],
      ),
    ],
    points: [],
  ),

  // 3rd
  PrivacyPolicyModel(
    title: 'How We Use Your Information',
    subModels: [
      SubPrivacyPolicyModel(
        subtitle: 'Service Provision and Improvement',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'Account Management',
            point:
                'Your personal information is used to manage and personalize your Fusshn account and provide seamless access to our platform.',
          ),
          PrivacyPolicyPointModel(
            header: 'Order Processing',
            point:
                'We use your information to complete ticket purchases, process transactions, and communicate order details.',
          ),
          PrivacyPolicyPointModel(
            header: 'Personalized Recommendations',
            point:
                'Based on your preferences and activity, we provide tailored recommendations to improve your experience.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Marketing and Communication',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'Notifications',
            point:
                'We send reminders about upcoming events, promotional offers, and platform updates, which can be managed through notification settings.',
          ),
          PrivacyPolicyPointModel(
            header: 'Surveys and Feedback',
            point:
                'We may reach out for feedback to improve our services and collect opinions on user experience.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Security and Fraud Prevention',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'Verification',
            point:
                'Information may be used to verify your identity to prevent fraud, abuse, or other unauthorized activities.',
          ),
          PrivacyPolicyPointModel(
            header: 'Monitoring',
            point:
                'We may analyze usage patterns to identify security risks and ensure the integrity of our services.',
          ),
        ],
      ),
    ],
    points: [],
  ),

  // 4th
  PrivacyPolicyModel(
    title: 'How We Share Your Information',
    subModels: [
      SubPrivacyPolicyModel(
        subtitle: 'Event Organisers',
        pointModels: [
          PrivacyPolicyPointModel(
            header: '',
            point:
                'When you purchase tickets, we share relevant information (e.g., name, email) with event organizers for ticket verification and event logistics.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Service Providers',
        pointModels: [
          PrivacyPolicyPointModel(
            header: '',
            point:
                'We work with third-party providers for payment processing, data hosting, marketing, and analytics. These providers only access your information to perform functions on our behalf, and we ensure they uphold confidentiality and data security.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Legal Compliance and Protection',
        pointModels: [
          PrivacyPolicyPointModel(
            header: '',
            point:
                'We may disclose your information if required by law or to protect Fusshn\'s rights, property, or user safety. This includes compliance with court orders, legal processes, or government requests.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Business Transfers',
        pointModels: [
          PrivacyPolicyPointModel(
            header: '',
            point:
                'In the event of a merger, acquisition, or asset sale, your information may be transferred to the acquiring entity. We will notify you if your data is affected by such changes.',
          ),
        ],
      ),
    ],
    points: [],
  ),

  // 5th
  PrivacyPolicyModel(
    title: 'Security Measures',
    subModels: [],
    points: [
      PrivacyPolicyPointModel(
        header: '',
        point:
            'We prioritize the security of your information and have implemented measures such as encryption, secure servers, and access control. However, please note that no online service is completely secure, and we cannot guarantee absolute data security.',
      ),
    ],
  ),

  // 6th
  PrivacyPolicyModel(
    title: 'Your Rights and Choices',
    subModels: [
      SubPrivacyPolicyModel(
        subtitle: 'Access, Update, and Delete Information',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'Access',
            point:
                'You have the right to access the personal data we hold about you. This can be done by contacting our support team.',
          ),
          PrivacyPolicyPointModel(
            header: 'Update',
            point:
                'You can update your personal information by logging into your account and modifying your profile settings.',
          ),
          PrivacyPolicyPointModel(
            header: 'Delete',
            point:
                'You can delete your account and personal data. We may retain certain information for legal or operational reasons.',
          ),
        ],
      ),
      SubPrivacyPolicyModel(
        subtitle: 'Opt-Out of Marketing Communications',
        pointModels: [
          PrivacyPolicyPointModel(
            header: 'Email and Push Notifications',
            point:
                'You can opt-out of receiving promotional communications through your account settings or by following the unsubscribe instructions in our emails.',
          ),
        ],
      ),
    ],
    points: [],
  ),

  // 7th
  PrivacyPolicyModel(
    title: 'Cookies and Tracking Technologies',
    subModels: [],
    points: [
      PrivacyPolicyPointModel(
        header: '',
        point:
            'We use cookies, beacons, and other tracking technologies to enhance your user experience, understand your preferences, and analyze site traffic. You can modify your cookie preferences through your browser settings, but disabling cookies may affect your app experience.',
      ),
    ],
  ),

  // 8th
  PrivacyPolicyModel(
    title: 'Third-Party Links and Services',
    subModels: [],
    points: [
      PrivacyPolicyPointModel(
        header: '',
        point:
            'Fusshn may contain links to external websites or services. We are not responsible for the privacy practices or content of third parties. We encourage you to review the privacy policies of any third-party sites you visit.',
      ),
    ],
  ),

  // 9th
  PrivacyPolicyModel(
    title: 'Children\'s Privacy',
    subModels: [],
    points: [
      PrivacyPolicyPointModel(
        header: '',
        point:
            'Fusshn is not intended for use by anyone under the age of 13. We do not knowingly collect personal information from children under 13. If we learn of any such data collection, we will promptly delete it.',
      ),
    ],
  ),

  // 10th
  PrivacyPolicyModel(
    title: 'Changes to This Privacy Policy',
    subModels: [],
    points: [
      PrivacyPolicyPointModel(
        header: '',
        point:
            'We may periodically update this Privacy Policy to reflect changes in our practices or legal requirements. If significant changes are made, we will notify you through the app or via email, along with updating the “Last Updated” date.',
      ),
    ],
  ),

  // 11th
  PrivacyPolicyModel(
    title: 'Contact Us',
    subModels: [],
    points: [
      PrivacyPolicyPointModel(
        header: '',
        point:
            'If you have questions or concerns about this Privacy Policy, please contact us:',
      ),
      PrivacyPolicyPointModel(
        header: 'Email',
        point: 'info@fusshn.in',
      ),
      PrivacyPolicyPointModel(
        header: 'Address',
        point: 'Garudacharpalya, Bengaluru, Karnataka, 560048',
      ),
    ],
  ),
];

class PrivacyPolicyModel {
  final String title;
  final List<SubPrivacyPolicyModel> subModels;
  final List<PrivacyPolicyPointModel> points;

  PrivacyPolicyModel({
    required this.title,
    required this.subModels,
    required this.points,
  });
}

class SubPrivacyPolicyModel {
  final String subtitle;
  final List<PrivacyPolicyPointModel> pointModels;

  SubPrivacyPolicyModel({
    required this.subtitle,
    required this.pointModels,
  });
}

class PrivacyPolicyPointModel {
  final String header;
  final String point;

  PrivacyPolicyPointModel({
    required this.header,
    required this.point,
  });
}
