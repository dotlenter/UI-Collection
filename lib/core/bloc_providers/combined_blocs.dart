import 'package:provider/single_child_widget.dart';

import 'master/master_bloc_provider.dart';

class CombinedBlocs {
  static List<SingleChildWidget> get() => [
        ...MasterBlocProvider.get(),
      ];
}
