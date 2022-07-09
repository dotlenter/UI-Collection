import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

import '../../../modules/schedule/domain/bloc/schedule_bloc.dart';

class ScheduelBlocProvider {
  static List<SingleChildWidget> get() => [
        BlocProvider(
          create: (context) => GetIt.I<ScheduleBloc>(),
        ),
      ];
}
