import 'package:fusshn/src/common/enums.dart';
import 'package:fusshn/src/models/artist_data.dart';
import 'package:fusshn/src/models/ticket_type.dart';

import '../models/event_data.dart';

EventData eventWasteData = EventData(
  id: 'wbaebveabvrwkc',
  name: 'Martin Garrix - India Tour',
  description:
      '''Get ready for the musical experience of a lifetime as global EDM sensation Martin Garrix embarks on his highly anticipated India Tour in 2024. Known for his chart-topping hits, explosive performances, and captivating stage presence, Garrix is set to bring his signature sound to major cities across the country.
Unmatched Energy: Martin Garrix is famous for his high-energy sets that keep the crowd dancing all night long. With a mix of his biggest hits like "Animals," "Scared to Be Lonely," and "High on Life," alongside exclusive new tracks, each performance promises to be a non-stop party.
State-of-the-Art Production: Each show will feature state-of-the-art sound systems and mesmerizing pyrotechnics, ensuring every beat and drop hits just right.
Interactive Fan Engagement: From VIP meet-and-greets to interactive crowd experiences, fans will have multiple opportunities to connect with Garrix and be part of the show in unique ways.
Tickets are expected to sell out fast. Make sure to grab yours early and secure your spot at what promises to be one of the most memorable events of the year. Whether you're a longtime fan or new to the EDM scene, the Martin Garrix India Tour 2024 is an unmissable event that will leave you buzzing long after the final beat drops.''',
  category: 'Music Festival',
  eventGenre: 'EDM',
  artistLineup: [
    const ArtistData(
      id: 'paradox',
      name: 'Paradox',
      imageUrl: 'https://facemagazine.in/wp-content/uploads/2023/05/8.png',
    ),
    const ArtistData(
      id: 'justinmylo',
      name: 'Justin Mylo',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5512c9aae4b0b2a9ab91ab0a/1588260967729-Z43YBBYMYFMGAWOJTQ1D/Justin%252BMylo%252B3.jpg?format=1000w',
    ),
  ],
  eventLocation: 'DLF Cyber City Surface Parking: Gurugram',
  posterUrl:
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_poster.jpg?alt=media&token=deb29879-549e-47a9-8d8b-81764b46c1e0',
  imagesUrls: [
    'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_image1.jpeg?alt=media&token=9db952ec-9cdd-4ffe-9e12-ce78a73c0f29',
    'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_image2.jpg?alt=media&token=1cf964f4-39bb-4f81-9177-119d3b5fee80',
    'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_image3.jpg?alt=media&token=5f24b6d0-502f-45fb-80ee-ae9bbba05aa1'
  ],
  startTime: DateTime(2024, 2, 25, 16),
  endTime: DateTime(2024, 2, 25, 22),
  gateCloseTime: DateTime(2024, 2, 25, 20),
  tickets: _tickets,
  ageRestrictions: 16,
  organiserName: 'Martin Garrix Team',
  termsAndConditions: [
    'The ticket is a revocable license to enter the event and is subject to the terms and conditions of the festival.',
    'The ticket holder agrees to comply with all rules and regulations of the festival.',
    'The ticket holder voluntarily assumes all risk and danger incidental to the event, whether occurring before, during, or after the event.',
    'The event promoter reserves the right to refuse admission or eject any person whose conduct is deemed to be disorderly or who fails to comply with the terms and conditions of the event.',
    'The event promoter is not responsible for lost or stolen items, and attendees are advised not to bring valuable items to the festival.',
    'The event promoter may use any photos or videos taken at the event for promotional purposes.',
    'The event promoter reserves the right to change the lineup, schedule, or location of the event without prior notice.',
    'The ticket holder agrees to submit to a reasonable search for prohibited items upon entering the festival.',
    'The ticket holder may not bring outside food, drink, or illegal substances to the festival.',
    'The ticket holder may not resell or transfer their ticket without the express written consent of the event promoter.',
  ],
);

// Tickets
const _tickets = [
  _ticket1,
  _ticket2,
  _ticket3,
];

const TicketType _ticket1 = TicketType(
  id: 'fp',
  name: 'Female Pass',
  price: 2900,
  personAllowed: 1,
  personGender: Gender.female,
  description: 'One female entry pass',
  isRefundable: false,
  totalTickets: 100,
  availableTickets: 100,
);
const TicketType _ticket2 = TicketType(
  id: 'mp',
  name: 'Male Pass',
  personGender: Gender.male,
  price: 5900,
  personAllowed: 1,
  description: 'One male entry pass',
  isRefundable: false,
  totalTickets: 100,
  availableTickets: 100,
);
const TicketType _ticket3 = TicketType(
  id: 'cp',
  name: 'Couple Pass',
  personGender: Gender.male,
  price: 7080,
  personAllowed: 2,
  description: 'One couple entry pass',
  isRefundable: false,
  totalTickets: 50,
  availableTickets: 50,
);
