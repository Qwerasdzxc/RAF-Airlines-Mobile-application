import 'package:get_it/get_it.dart';
import 'package:raf_airlines_client/services/flight/dao/flight_mock_dao.dart';
import 'package:raf_airlines_client/services/flight/dao/flight_rest_dao.dart';
import 'package:raf_airlines_client/services/flight/flight_service.dart';
import 'package:raf_airlines_client/services/ticket/dao/ticket_mock_dao.dart';
import 'package:raf_airlines_client/services/ticket/dao/ticket_rest_dao.dart';
import 'package:raf_airlines_client/services/ticket/ticket_service.dart';
import 'package:raf_airlines_client/services/user/dao/user_mock_dao.dart';
import 'package:raf_airlines_client/services/user/dao/user_rest_dao.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';

final getService = GetIt.instance;

void initRestServices() {
  getService.registerLazySingleton<UserService>(() => UserService(dao: UserRestDAO()));
  getService.registerLazySingleton<FlightService>(() => FlightService(dao: FlightRestDAO()));
  getService.registerLazySingleton<TicketService>(() => TicketService(dao: TicketRestDAO()));
}

void initMockServices() {
  getService.registerLazySingleton<UserService>(() => UserService(dao: UserMockDAO()));
  getService.registerLazySingleton<FlightService>(() => FlightService(dao: FlightMockDAO()));
  getService.registerLazySingleton<TicketService>(() => TicketService(dao: TicketMockDAO()));
}