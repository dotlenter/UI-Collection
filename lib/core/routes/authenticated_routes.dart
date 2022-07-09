import '../../widget/routes/page_route.dart';
import '../../widget/routes/page_route_arguments.dart';
import 'home/home_routes.dart';
import 'schedule/schedule_routes.dart';
import 'tap/tap_page_routes.dart';

class AuthenticatedRoutes {
  static List<IPageRoute<IPageRouteArguments>> get() => [
        ...HomeRoutes.get(),
        ...ScheduleRoutes.get(),
        ...TapPageRoutes.get(),
      ];
}
