import 'package:fusshn/src/common/enums.dart';
import 'package:fusshn/src/common/event_tags.dart';
import 'package:fusshn/src/models/artist_data.dart';
import 'package:fusshn/src/models/ticket_type.dart';

import '../models/event_data.dart';

List<EventData> eventsForFirestore = [
  EventData(
    id: 'wbaebveabvrwk',
    name: 'Prateek Kuhad Silhouettes Tour - Gurgaon',
    description:
        '''Akin to painting on a blank canvas, singer, songwriter, and producer Prateek Kuhad brings his music to life in both broad and delicate strokes. Utilizing an entire spectrum of color and texture, his palette spans pop hooks, indie experimentation, and eloquent folk storytelling delivered in both English and Hindi, manifesting vibrancy through versatility. His breakout single “Cold/mess” generated over 50 million global streams, while former President Barack Obama touted the song on his “Favorite Music of 2019” playlist. On its heels, “Kasoor” exploded with over 100 million global streams and counting. He continued to garner tastemaker praise for his 2022 album, The Way That Lovers Do,” which WONDERLAND hailed as “filled with wispy vocals, ambient production and all-around romance-tinged sound.” His songs have surged through culture, appearing everywhere from the EMMY® Award-winning series Ted Lasso to campaigns for Uber, McDonald's, and WhatsApp. Amidst packing venues on multiple continents, Prateek's vision comes into focus clearer than ever before on a series of singles and more to come.''',
    artistLineup: [
      const ArtistData(
        id: 'prateek',
        name: 'Prateek Kuhad',
        imageUrl: 'https://facemagazine.in/wp-content/uploads/2023/05/8.png',
      ),
      const ArtistData(
        id: 'prateek',
        name: 'Prateek Kuhad',
        imageUrl: 'https://facemagazine.in/wp-content/uploads/2023/05/8.png',
      ),
    ],
    eventLocation: 'Airia Mall: Gurugram',
    posterUrl:
        'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fprateek_poster.png?alt=media&token=8dbc7683-6c3f-47cb-b5d4-f810a7e39b1b',
    imagesUrls: [
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover.jpg?alt=media&token=c1c5a393-1054-40a2-b065-a2d9500d884d',
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover2.jpg?alt=media&token=f2da8cc5-38e9-42e5-9b41-b58b51eef1dc',
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover3.jpg?alt=media&token=0b997c87-675c-4b9a-9bd0-a8dd95d39a80'
    ],
    startTime: DateTime(2024, 11, 3, 11),
    endTime: DateTime(2024, 11, 3, 17),
    tickets: [
      const TicketType(
        id: 'gp',
        name: 'General Pass',
        price: 500,
        personAllowed: 1,
        personGender: Gender.male,
        description: 'One person entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'vp',
        name: 'Vip Pass',
        personGender: Gender.male,
        price: 1000,
        personAllowed: 1,
        description: 'One male entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'fp',
        name: 'Fanpit Pass',
        personGender: Gender.male,
        price: 1500,
        personAllowed: 2,
        description: 'One couple entry pass',
        isRefundable: false,
        totalTickets: 50,
        availableTickets: 50,
      ),
    ],
    ageRestrictions: 16,
    organiserName: 'HTC Unwind',
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
    tags: [EventTags.liveMusic],
  ),
  EventData(
    id: 'wbaebveabvraa',
    name: 'Karan Aujla - It Was All A Dream',
    description:
        '''Experience the magic of Karan Aujla live on his It Was All A Dream World Tour! Get ready for a night of sensational music as he performs his biggest hits, including the soulful "Softly”, “Winning Speech”, “IDK HOW” and “Antidote”. ” Karan Aujla, renowned for his powerful voice and dynamic stage presence, will take you on a musical journey like no other. From chart-toppers to fan favorites, enjoy an unforgettable evening filled with electrifying performances and captivating melodies. Don’t miss this opportunity to witness one of Punjabi music’s brightest stars live in concert. Secure your tickets now and be part of this extraordinary event!''',
    artistLineup: [
      const ArtistData(
        id: 'karanaujla',
        name: 'Karan Aujla',
        imageUrl: 'https://facemagazine.in/wp-content/uploads/2023/05/8.png',
      ),
      const ArtistData(
        id: 'karanaujla',
        name: 'Karan Aujla',
        imageUrl: 'https://facemagazine.in/wp-content/uploads/2023/05/8.png',
      ),
    ],
    eventLocation: 'Airia Mall: Gurugram',
    posterUrl:
        'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fkaran_poster.jpg?alt=media&token=fdb1d4df-cc17-4b7f-a32f-cd589a54896d',
    imagesUrls: [
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover.jpg?alt=media&token=c1c5a393-1054-40a2-b065-a2d9500d884d',
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover2.jpg?alt=media&token=f2da8cc5-38e9-42e5-9b41-b58b51eef1dc',
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover3.jpg?alt=media&token=0b997c87-675c-4b9a-9bd0-a8dd95d39a80'
    ],
    startTime: DateTime(2024, 11, 3, 11),
    endTime: DateTime(2024, 11, 3, 17),
    tickets: [
      const TicketType(
        id: 'gp',
        name: 'General Pass',
        price: 500,
        personAllowed: 1,
        personGender: Gender.male,
        description: 'One person entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'vp',
        name: 'Vip Pass',
        personGender: Gender.male,
        price: 1000,
        personAllowed: 1,
        description: 'One male entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'fp',
        name: 'Fanpit Pass',
        personGender: Gender.male,
        price: 1500,
        personAllowed: 2,
        description: 'One couple entry pass',
        isRefundable: false,
        totalTickets: 50,
        availableTickets: 50,
      ),
    ],
    ageRestrictions: 16,
    organiserName: 'HTC Unwind',
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
    tags: [
      EventTags.liveMusic,
      EventTags.hiphop,
    ],
  ),
  EventData(
    id: 'wbaebveabvraa',
    name: 'Guru Randhawa - Moon Rise Tour, Delhi NCR',
    description:
        '''The sensational Punjabi superstar Guru Randhawa is hitting the road for an epic Indian Tour!
Brace yourselves for electrifying performances, unforgettable moments, and a musical journey like never before. Gather your squad, and get ready to groove to the beats of your favorite hits!''',
    artistLineup: [
      const ArtistData(
        id: 'gururandhawa',
        name: 'Guru Randhawa',
        imageUrl: 'https://facemagazine.in/wp-content/uploads/2023/05/8.png',
      ),
      const ArtistData(
        id: 'gururandhawa',
        name: 'Guru Randhawa',
        imageUrl: 'https://facemagazine.in/wp-content/uploads/2023/05/8.png',
      ),
    ],
    eventLocation: 'IG Indoor Stadium, ITO, Vikram Nagar, New Delhi,',
    posterUrl:
        'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fguru_poster.jpg?alt=media&token=29d13726-17f9-486d-b89a-e937dae68ca9',
    imagesUrls: [
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover.jpg?alt=media&token=c1c5a393-1054-40a2-b065-a2d9500d884d',
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover2.jpg?alt=media&token=f2da8cc5-38e9-42e5-9b41-b58b51eef1dc',
      'https://firebasestorage.googleapis.com/v0/b/fusshn-aef8e.appspot.com/o/test_data%2Fevent_cover3.jpg?alt=media&token=0b997c87-675c-4b9a-9bd0-a8dd95d39a80'
    ],
    startTime: DateTime(2024, 11, 3, 11),
    endTime: DateTime(2024, 11, 3, 17),
    tickets: [
      const TicketType(
        id: 'gp',
        name: 'General Pass',
        price: 500,
        personAllowed: 1,
        personGender: Gender.male,
        description: 'One person entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'vp',
        name: 'Vip Pass',
        personGender: Gender.male,
        price: 1000,
        personAllowed: 1,
        description: 'One male entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'fp',
        name: 'Fanpit Pass',
        personGender: Gender.male,
        price: 1500,
        personAllowed: 2,
        description: 'One couple entry pass',
        isRefundable: false,
        totalTickets: 50,
        availableTickets: 50,
      ),
    ],
    ageRestrictions: 16,
    organiserName: 'HTC Unwind',
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
    tags: [EventTags.liveMusic],
  ),
  EventData(
    id: 'wbaebveabvreekc',
    name: 'Martin Garrix - India Tour',
    description:
        '''Get ready for the musical experience of a lifetime as global EDM sensation Martin Garrix embarks on his highly anticipated India Tour in 2024. Known for his chart-topping hits, explosive performances, and captivating stage presence, Garrix is set to bring his signature sound to major cities across the country.
Unmatched Energy: Martin Garrix is famous for his high-energy sets that keep the crowd dancing all night long. With a mix of his biggest hits like "Animals," "Scared to Be Lonely," and "High on Life," alongside exclusive new tracks, each performance promises to be a non-stop party.
State-of-the-Art Production: Each show will feature state-of-the-art sound systems and mesmerizing pyrotechnics, ensuring every beat and drop hits just right.
Interactive Fan Engagement: From VIP meet-and-greets to interactive crowd experiences, fans will have multiple opportunities to connect with Garrix and be part of the show in unique ways.
Tickets are expected to sell out fast. Make sure to grab yours early and secure your spot at what promises to be one of the most memorable events of the year. Whether you're a longtime fan or new to the EDM scene, the Martin Garrix India Tour 2024 is an unmissable event that will leave you buzzing long after the final beat drops.''',
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
    tickets: [
      const TicketType(
        id: 'fp',
        name: 'Female Pass',
        price: 2900,
        personAllowed: 1,
        personGender: Gender.female,
        description: 'One female entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'mp',
        name: 'Male Pass',
        personGender: Gender.male,
        price: 5900,
        personAllowed: 1,
        description: 'One male entry pass',
        isRefundable: false,
        totalTickets: 100,
        availableTickets: 100,
      ),
      const TicketType(
        id: 'cp',
        name: 'Couple Pass',
        personGender: Gender.male,
        price: 7080,
        personAllowed: 2,
        description: 'One couple entry pass',
        isRefundable: false,
        totalTickets: 50,
        availableTickets: 50,
      ),
    ],
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
    tags: [
      EventTags.edm,
      EventTags.liveMusic,
    ],
  ),
];
