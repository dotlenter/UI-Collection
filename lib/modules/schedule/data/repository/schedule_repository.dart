// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';

// import '../../domain/entity/user_schedule/user_schedule_details_entity.dart';
// import '../datasource/schedule_datasource.dart';

// @injectable
// class ScheduleRepository {
//   final ScheduleDatasource _dataSource;

//   ScheduleRepository({
//     required ScheduleDatasource dataSource,
//   }) : _dataSource = dataSource;

//   Future<Either<Exception, List<UserScheduleDetailsEntity>>>
//       getSchedule() async {
//     try {
//       final modelList = await _dataSource.getSchedule();

//       final entityList = modelList.map((model) => )

//     } catch (e) {
//       return Left(Exception());
//     }
//   }
// }
