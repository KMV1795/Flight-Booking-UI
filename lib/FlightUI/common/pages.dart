import 'package:get/get.dart';
import 'package:my_app/FlightUI/common/routes.dart';
import '../flight_ui/screens/book_flight.dart';
import '../flight_ui/screens/dashboard.dart';
import '../flight_ui/screens/intro_screen.dart';
import '../flight_ui/screens/recent_flights.dart';
import '../flight_ui/screens/search_flight.dart';
import '../flight_ui/screens/ticket_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: Routes.INTRO, page: () => const IntroScreen()),
    GetPage(name: Routes.bookFlight, page: () => const BookFlightPage()),
    GetPage(name: Routes.recentFlights, page: () => const RecentFlights()),
    GetPage(name: Routes.FLIGHTSEARCH, page: () => const SearchFlightScreen()),
    GetPage(name: Routes.TICKETSDETAILS, page: () => const TicketFinalScreen()),
    GetPage(name: Routes.DASHBOARD, page: () => const DashboardScreen()),
  ];
}