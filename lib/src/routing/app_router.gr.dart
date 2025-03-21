// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthView(),
      );
    },
    BookingHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingHistoryView(),
      );
    },
    ConfirmBookingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfirmBookingView(),
      );
    },
    ContactUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactUsView(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileView(),
      );
    },
    EventDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EventDetailView(
          eventData: args.eventData,
          key: args.key,
        ),
      );
    },
    EventsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventsView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingView(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    ReferralRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReferralView(),
      );
    },
    SearchEventRoute.name: (routeData) {
      final args = routeData.argsAs<SearchEventRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchEventView(
          heroTagForSearchbar: args.heroTagForSearchbar,
          key: args.key,
        ),
      );
    },
    SeeAllEventRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllEventRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SeeAllEventView(
          events: args.events,
          key: args.key,
        ),
      );
    },
    SelectFirstLocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectFirstLocationView(),
      );
    },
    SelectLocationRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLocationRouteArgs>(
          orElse: () => const SelectLocationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectLocationView(
          key: args.key,
          isFirstLocationView: args.isFirstLocationView,
        ),
      );
    },
    SendFeedbackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SendFeedbackView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    TermsAndConditionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsAndConditionsView(),
      );
    },
    TicketRoute.name: (routeData) {
      final args = routeData.argsAs<TicketRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TicketView(
          key: args.key,
          eventData: args.eventData,
          booking: args.booking,
        ),
      );
    },
    VenueRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VenueView(),
      );
    },
  };
}

/// generated route for
/// [AuthView]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookingHistoryView]
class BookingHistoryRoute extends PageRouteInfo<void> {
  const BookingHistoryRoute({List<PageRouteInfo>? children})
      : super(
          BookingHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmBookingView]
class ConfirmBookingRoute extends PageRouteInfo<void> {
  const ConfirmBookingRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmBookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmBookingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactUsView]
class ContactUsRoute extends PageRouteInfo<void> {
  const ContactUsRoute({List<PageRouteInfo>? children})
      : super(
          ContactUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventDetailView]
class EventDetailRoute extends PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    required EventData eventData,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EventDetailRoute.name,
          args: EventDetailRouteArgs(
            eventData: eventData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailRoute';

  static const PageInfo<EventDetailRouteArgs> page =
      PageInfo<EventDetailRouteArgs>(name);
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    required this.eventData,
    this.key,
  });

  final EventData eventData;

  final Key? key;

  @override
  String toString() {
    return 'EventDetailRouteArgs{eventData: $eventData, key: $key}';
  }
}

/// generated route for
/// [EventsView]
class EventsRoute extends PageRouteInfo<void> {
  const EventsRoute({List<PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainView]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingView]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyView]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReferralView]
class ReferralRoute extends PageRouteInfo<void> {
  const ReferralRoute({List<PageRouteInfo>? children})
      : super(
          ReferralRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReferralRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchEventView]
class SearchEventRoute extends PageRouteInfo<SearchEventRouteArgs> {
  SearchEventRoute({
    required String heroTagForSearchbar,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SearchEventRoute.name,
          args: SearchEventRouteArgs(
            heroTagForSearchbar: heroTagForSearchbar,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchEventRoute';

  static const PageInfo<SearchEventRouteArgs> page =
      PageInfo<SearchEventRouteArgs>(name);
}

class SearchEventRouteArgs {
  const SearchEventRouteArgs({
    required this.heroTagForSearchbar,
    this.key,
  });

  final String heroTagForSearchbar;

  final Key? key;

  @override
  String toString() {
    return 'SearchEventRouteArgs{heroTagForSearchbar: $heroTagForSearchbar, key: $key}';
  }
}

/// generated route for
/// [SeeAllEventView]
class SeeAllEventRoute extends PageRouteInfo<SeeAllEventRouteArgs> {
  SeeAllEventRoute({
    required List<EventData> events,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SeeAllEventRoute.name,
          args: SeeAllEventRouteArgs(
            events: events,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SeeAllEventRoute';

  static const PageInfo<SeeAllEventRouteArgs> page =
      PageInfo<SeeAllEventRouteArgs>(name);
}

class SeeAllEventRouteArgs {
  const SeeAllEventRouteArgs({
    required this.events,
    this.key,
  });

  final List<EventData> events;

  final Key? key;

  @override
  String toString() {
    return 'SeeAllEventRouteArgs{events: $events, key: $key}';
  }
}

/// generated route for
/// [SelectFirstLocationView]
class SelectFirstLocationRoute extends PageRouteInfo<void> {
  const SelectFirstLocationRoute({List<PageRouteInfo>? children})
      : super(
          SelectFirstLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectFirstLocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectLocationView]
class SelectLocationRoute extends PageRouteInfo<SelectLocationRouteArgs> {
  SelectLocationRoute({
    Key? key,
    bool isFirstLocationView = false,
    List<PageRouteInfo>? children,
  }) : super(
          SelectLocationRoute.name,
          args: SelectLocationRouteArgs(
            key: key,
            isFirstLocationView: isFirstLocationView,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectLocationRoute';

  static const PageInfo<SelectLocationRouteArgs> page =
      PageInfo<SelectLocationRouteArgs>(name);
}

class SelectLocationRouteArgs {
  const SelectLocationRouteArgs({
    this.key,
    this.isFirstLocationView = false,
  });

  final Key? key;

  final bool isFirstLocationView;

  @override
  String toString() {
    return 'SelectLocationRouteArgs{key: $key, isFirstLocationView: $isFirstLocationView}';
  }
}

/// generated route for
/// [SendFeedbackView]
class SendFeedbackRoute extends PageRouteInfo<void> {
  const SendFeedbackRoute({List<PageRouteInfo>? children})
      : super(
          SendFeedbackRoute.name,
          initialChildren: children,
        );

  static const String name = 'SendFeedbackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsAndConditionsView]
class TermsAndConditionsRoute extends PageRouteInfo<void> {
  const TermsAndConditionsRoute({List<PageRouteInfo>? children})
      : super(
          TermsAndConditionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsAndConditionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketView]
class TicketRoute extends PageRouteInfo<TicketRouteArgs> {
  TicketRoute({
    Key? key,
    required EventData eventData,
    required Booking booking,
    List<PageRouteInfo>? children,
  }) : super(
          TicketRoute.name,
          args: TicketRouteArgs(
            key: key,
            eventData: eventData,
            booking: booking,
          ),
          initialChildren: children,
        );

  static const String name = 'TicketRoute';

  static const PageInfo<TicketRouteArgs> page = PageInfo<TicketRouteArgs>(name);
}

class TicketRouteArgs {
  const TicketRouteArgs({
    this.key,
    required this.eventData,
    required this.booking,
  });

  final Key? key;

  final EventData eventData;

  final Booking booking;

  @override
  String toString() {
    return 'TicketRouteArgs{key: $key, eventData: $eventData, booking: $booking}';
  }
}

/// generated route for
/// [VenueView]
class VenueRoute extends PageRouteInfo<void> {
  const VenueRoute({List<PageRouteInfo>? children})
      : super(
          VenueRoute.name,
          initialChildren: children,
        );

  static const String name = 'VenueRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
