import 'package:get/get.dart';
import 'package:my_app/Tickets/common/routes.dart';
import '../tickets_modules/view.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.tickets, page: () => const TicketsScreen()),
  ];
}