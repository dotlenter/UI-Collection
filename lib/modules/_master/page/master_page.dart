import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

import '../../../core/navigation/navigation_interceptor.dart';
import '../../../core/routes/authenticated_routes.dart';
import '../../../widget/lifecycle_watcher/lifecycle_watcher.dart';
import '../../../widget/routes/route_generator.dart';
import '../domain/bloc/master_page_bloc.dart';
import '../widget/master_loading_widget.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MasterPage();
}

class _MasterPage extends LifecycleWatcherState<MasterPage> {
  final _navigationInterceptor = NavigationInterceptor();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MasterPageBloc>(context)
        .add(const MasterPageEvent.initializeHomePage());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      return _handleOnResume();
    }

    super.didChangeAppLifecycleState(state);
  }

  void _handleOnResume() {
    final isHomePageInitialized =
        BlocProvider.of<MasterPageBloc>(context).state.maybeWhen(
              orElse: () => false,
              homePageInitialized: () => true,
            );

    if (!isHomePageInitialized) return;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RouteObserverProvider(create: _handleRouteObserverProvider),
      ],
      child: BlocBuilder<MasterPageBloc, MasterPageState>(
        buildWhen: (previous, current) => current.maybeWhen(
          orElse: () => false,
          initial: () => true,
          homePageInitialized: () => true,
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: () => MasterLoadingWidget(),
          homePageInitialized: () => RouteGenerator(
            initialRoute: 'home',
            routes: AuthenticatedRoutes.get(),
            navigationInterceptor: _navigationInterceptor,
          ),
        ),
      ),
    );
  }

  GlobalRouteObserver _handleRouteObserverProvider(BuildContext context) =>
      GlobalRouteObserver()
        ..navigation.listen(
          (event) {
            if (event.type == NavigationBehaviorType.didPop) {
              if (event.route?.settings.name == null) {
                return;
              }
              _navigationInterceptor.onPop();
            }
          },
        );
}
