import 'package:ui_collection/modules/home/pages/home_page_route.dart';

import '../../modules/_master/page/master_page_route.dart';
import 'navigation_history.dart';

class NavigationInterceptor {
  final List<NavigationHistory> _historyList = [];

  final masterRoute = [
    HomePageRoute().getRoute(),
    MasterPageRoute().getRoute(),
  ];

  void addNavigationHistory(NavigationHistory history) {
    _historyList.add(history);
  }

  void onPop({int? index}) async {
    final history = _historyList.last;

    if (!masterRoute.contains(history.name)) {
      if (index != null && index != -1) {
        _historyList.removeRange(index, _historyList.length);
        return;
      }
      _historyList.removeLast();
    }
  }

  void willPop() async {
    final history = _historyList.last;

    if (!masterRoute.contains(history.name)) {
      final routeName = await history.onBackPressed!(history.context);

      if (routeName != null) {
        final index = _historyList.indexWhere(
          (history) => history.name == routeName,
        );

        onPop(index: index);
      }
    }
  }
}
