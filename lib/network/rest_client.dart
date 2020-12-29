import 'dart:async';

import 'package:dio/dio.dart';
import 'package:raf_airlines_client/models/airplane.dart';
import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/models/flight.dart';
import 'package:raf_airlines_client/models/ticket.dart';
import 'package:raf_airlines_client/models/user.dart';
import 'package:raf_airlines_client/network/network_exception.dart';

class RestClient {
  Dio _dio;

  String _authorizationToken;

  static final RestClient _singleton = RestClient._internal();

  factory RestClient() {
    return _singleton;
  }

  RestClient._internal() {
    init();
  }

  void init() async {
    _dio = Dio();

    _dio.options.baseUrl = "http://localhost:8080/";

    _dio.options.connectTimeout = 90000;
    _dio.options.receiveTimeout = 90000;

    _dio.options.validateStatus = (status) => status < 300 && status >= 200;

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options) async {
      options.headers["Authorization"] = _authorizationToken;
      options.headers["Content-Type"] = "application/json";

      return options;
    }));
  }

  Future<void> login(String email, String password) async {
    try {
      Response response = await _dio.post("login", data: {"username": email, "password": password});
      _authorizationToken = response.headers.value("authorization");
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  FutureOr<void> register(String name, String surname, String email, String password, String passport) async {
    try {
      await _dio.post("register",
          data: {"name": name, "surname": surname, "email": email, "password": password, "passport": passport});
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  FutureOr<void> updateProfile(String name, String surname, String email, String passport) async {
    try {
      await _dio.put("update", data: {"name": name, "surname": surname, "email": email, "passport": passport});
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<User> getMyProfile() async {
    try {
      Response response = await _dio.get("my-profile");
      return User.fromJson(response.data);
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  FutureOr<void> updatePassword(String currentPassword, String newPassword) async {
    try {
      await _dio.put("update-password", data: {"currentPassword": currentPassword, "newPassword": newPassword});
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<List<CreditCard>> getMyCreditCards() async {
    try {
      Response response = await _dio.get("credit-card/get-all");
      return response.data.map<CreditCard>((jsonItem) => CreditCard.fromJson(jsonItem)).toList();
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  FutureOr<void> deleteCreditCard(CreditCard creditCard) async {
    try {
      await _dio.delete("credit-card/remove", data: {"number": creditCard.number});
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<CreditCard> addCreditCard(CreditCard creditCard) async {
    try {
      Response response =
          await _dio.post("credit-card/add", data: {"number": creditCard.number, "ccv": creditCard.ccv});
      return CreditCard.fromJson(response.data);
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<List<Airplane>> getAllAirplanes() async {
    try {
      Response response = await _dio.get("airplane/all");
      return response.data.map<Airplane>((jsonItem) => Airplane.fromJson(jsonItem)).toList();
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<List<Flight>> getAvailableFlights() async {
    try {
      Response response = await _dio.get("flight/available");
      return response.data.map<Flight>((jsonItem) => Flight.fromJson(jsonItem)).toList();
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<List<Flight>> searchFlights(String startDestination, String endDestination, int minDistance, int maxDistance,
      int minPrice, int maxPrice, Airplane airplane) async {
    try {
      Response response = await _dio.post("flight/search", data: {
        "startDestination": startDestination,
        "endDestination": endDestination,
        "minDistance": minDistance,
        "maxDistance": maxDistance,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "airplaneId": airplane.id
      });
      return response.data.map<Flight>((jsonItem) => Flight.fromJson(jsonItem)).toList();
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<List<Ticket>> getMyTickets() async {
    try {
      Response response = await _dio.get("get-my-tickets");
      return response.data.map<Ticket>((jsonItem) => Ticket.fromJson(jsonItem)).toList();
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }

  Future<Ticket> buyTicket(CreditCard creditCard, Flight flight) async {
    try {
      Response response =
          await _dio.post("buy-ticket", data: {"creditCardNumber": creditCard.number, "flightId": flight.id});
      return Ticket.fromJson(response.data);
    } on DioError catch (e) {
      throw NetworkException(cause: e.message);
    }
  }
}
