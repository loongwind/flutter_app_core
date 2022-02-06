// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/api_response/api_response_entity.dart';
import 'package:flutter_app_core/models/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_core/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });


  test("json", (){
    String userData = """
     [
        {
          "id":"12313",
          "name":"loongwind",
          "age":18
        },
        {
          "id":"22222",
          "name":"cmad",
          "age":25
        }
     ]
    """;

    List<UserEntity>? users = jsonConvert.convert<List<UserEntity>>(jsonDecode(userData));
    // List<UserEntity>? users = jsonConvert.asT<List<UserEntity>>(jsonDecode(userData));
    // List<UserEntity>? users = JsonConvert.fromJsonAsT<List<UserEntity>>(jsonDecode(userData));
    // List<UserEntity?>? users = jsonConvert.convertList<UserEntity>(jsonDecode(userData));
    // List<UserEntity>? users = jsonConvert.convertListNotNull<UserEntity>(jsonDecode(userData));

    // UserEntity? user = jsonConvert.asT<UserEntity>(jsonDecode(userData));

    // UserEntity? user = jsonConvert.convert<UserEntity>(jsonDecode(userData));

    // UserEntity user = UserEntity.fromJson(jsonDecode(userData));
    print(users);


  });


  test("JSONField", (){
    String userData = """
    {
      "code": 200,
      "message": "success",
      "data": 18
    }
    """;

    ApiResponse<int> response = ApiResponse.fromJson(jsonDecode(userData));
    print(response.data);



  });


  test("json list", (){
    String userData = """
    {
      "code": 200,
      "message": "success",
      "data":[
        {
          "id": "12312312",
          "name": "loongwind",
          "age": 18
        },{
          "id": "333333",
          "name": "cmad",
          "age": 25
        }
      ]
    }
    """;

    ApiResponse<List<UserEntity>> response = ApiResponse.fromJson(jsonDecode(userData));
    print(response.data?.length);
    print(response.data?.first.username);



  });


  test("jsonEncode", (){

    var data = [{
      "a":"a",
      "b":"b",
      "c":1,
      "d":UserEntity()
    }];

    print(jsonEncode(data));
    print(jsonDecode(jsonEncode(data)));
  });
}
