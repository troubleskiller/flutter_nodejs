import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CupertinoTextFieldDemo(),
    );
  }
}
// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

class CupertinoTextFieldDemo extends StatelessWidget {
  const CupertinoTextFieldDemo();

  @override
  Widget build(BuildContext context) {
    var email;
    var password;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
        child: ListView(
          restorationId: 'text_field_demo_list_view',
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                  textInputAction: TextInputAction.next,
                  restorationId: 'email_address_text_field',
                  placeholder: 'troubleskiller@outlook.com',
                  keyboardType: TextInputType.emailAddress,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  autocorrect: false,
                  onChanged: (value) {
                    email = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CupertinoTextField(
                  textInputAction: TextInputAction.next,
                  restorationId: 'login_password_text_field',
                  placeholder: 'Password',
                  clearButtonMode: OverlayVisibilityMode.editing,
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) {
                    password = value;
                  }),
            ),
            FlatButton.icon(
                onPressed: () {
                  print(email);
                  print(password);
                  signUp(email, password);
                },
                icon: const Icon(Icons.save),
                label: const Text('save')),
            const CupertinoTextField(
              textInputAction: TextInputAction.done,
              restorationId: 'pin_number_text_field',
              prefix: Icon(
                CupertinoIcons.padlock_solid,
                size: 28,
              ),
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              clearButtonMode: OverlayVisibilityMode.editing,
              keyboardType: TextInputType.number,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0,
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

signUp(email, password) async {
  var url = Uri.parse('https://127.0.0.1:5000');

  ///ios
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(
      <String, String>{'email': email, 'password': password},
    ),
  );
  if (response.statusCode == 201) {
  } else {
    throw Exception('Failed');
  }
}
