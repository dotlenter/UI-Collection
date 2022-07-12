import '../../../modules/schedule/page/schedule_home_page_route.dart';
import '../../../modules/schedule/page/schedule_page_route.dart';
import '../../../widget/routes/page_route.dart';
import '../../../widget/routes/page_route_arguments.dart';

class ScheduleRoutes {
  static List<IPageRoute<IPageRouteArguments>> get() => [
        ScheduleHomePageRoute(),
        SchedulePageRoute(),
      ];
}
