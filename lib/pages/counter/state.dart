import 'package:flutter_app_core/models/user_entity.dart';

class CounterState {
  late int count;

  UserEntity? user;
  String? errorMessage;

  CounterState() {
    count = 0;
  }
}
