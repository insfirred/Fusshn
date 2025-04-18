import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/booking.dart';
import '../models/event_data.dart';
import '../ui/auth/auth_view.dart';
import '../ui/booking_history/booking_history_view.dart';
import '../ui/confirm_booking/confirm_booking_view.dart';
import '../ui/contact_us/contact_us_view.dart';
import '../ui/edit_profile/edit_profile_view.dart';
import '../ui/event_detail_view/event_detail_view.dart';
import '../ui/events_tab/events_view.dart';
import '../ui/home_tab/home_view.dart';
import '../ui/main/main_view.dart';
import '../ui/onboarding/onboarding_view.dart';
import '../ui/privacy_policy/privacy_policy_view.dart';
import '../ui/profile_tab/profile_view.dart';
import '../ui/referral/referral_view.dart';
import '../ui/search_events/search_event_view.dart';
import '../ui/see_all_event/see_all_event_view.dart';
import '../ui/select_first_location/select_first_location_view.dart';
import '../ui/select_location/select_location_view.dart';
import '../ui/send_feedback/send_feedback_view.dart';
import '../ui/splash/splash_view.dart';
import '../ui/terms_and_conditions/terms_and_conditions_view.dart';
import '../ui/ticket/ticket_view.dart';
import '../ui/venue_tab/venue_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
        ),
        AutoRoute(
          path: '/auth',
          page: AuthRoute.page,
        ),
        AutoRoute(
          path: '/main',
          page: MainRoute.page,
          children: [
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'events',
              page: EventsRoute.page,
            ),
            // AutoRoute(
            //   path: 'venue',
            //   page: VenueRoute.page,
            // ),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/onboarding',
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          path: '/event-detail',
          page: EventDetailRoute.page,
        ),
        AutoRoute(
          path: '/confirm-booking',
          page: ConfirmBookingRoute.page,
        ),
        AutoRoute(
          path: '/booking-history',
          page: BookingHistoryRoute.page,
        ),
        AutoRoute(
          path: '/edit-profile',
          page: EditProfileRoute.page,
        ),
        AutoRoute(
          path: '/terms-and-conditions',
          page: TermsAndConditionsRoute.page,
        ),
        // AutoRoute(
        //   path: '/refund-and-cancellation',
        //   page: RefundAndCancellationRoute.page,
        // ),
        AutoRoute(
          path: '/privacy-policy',
          page: PrivacyPolicyRoute.page,
        ),
        AutoRoute(
          path: '/ticket',
          page: TicketRoute.page,
        ),
        AutoRoute(
          path: '/see-all-event',
          page: SeeAllEventRoute.page,
        ),
        CustomRoute(
          path: '/select-location',
          page: SelectLocationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 200,
        ),
        AutoRoute(
          path: '/search-event',
          page: SearchEventRoute.page,
        ),
        AutoRoute(
          path: '/select-first-location',
          page: SelectFirstLocationRoute.page,
        ),
        AutoRoute(
          path: '/referral',
          page: ReferralRoute.page,
        ),
        AutoRoute(
          path: '/contact-us',
          page: ContactUsRoute.page,
        ),
        AutoRoute(
          path: '/send-feedback',
          page: SendFeedbackRoute.page,
        ),
      ];
}
