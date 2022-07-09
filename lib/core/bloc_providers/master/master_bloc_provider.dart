import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

import '../../../modules/_master/domain/bloc/master_page_bloc.dart';

class MasterBlocProvider {
  static List<SingleChildWidget> get() => [
        BlocProvider(
          create: (context) => GetIt.I<MasterPageBloc>(),
        ),
      ];
}
