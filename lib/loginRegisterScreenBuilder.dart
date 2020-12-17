import 'package:flutter/material.dart';

import 'dart:async';

import 'package:study_tracker/utils.dart';

class LoginRegisterScreenBuilder
{
  LoginRegisterScreenBuilder()
  {
    // Set up controllers
    _onLoginPressController = new StreamController.broadcast();
    _onRegisterPressController = new StreamController.broadcast();
  }

  Widget getHome(BuildContext context)
  {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          getIconSizedWidth(0.4, Icons.account_circle_rounded),
          getPaddingFieldSmall(),
          Center(child: getButton("Login", _onLoginPress, context)),
          getPaddingField(),
          Center(child: getButton("Register", _onRegisterPress, context)),
          Expanded(child: Container())
        ],
      )
    );
  }

  void _onLoginPress()
  {
    _onLoginPressController.add(null);
  }

  void _onRegisterPress()
  {
    _onRegisterPressController.add(null);
  }

  // Stream controllers
  StreamController _onLoginPressController;
  StreamController _onRegisterPressController;

  // Streams
  Stream get onLoginPressStream => _onLoginPressController.stream;
  Stream get onRegisterPressStream => _onRegisterPressController.stream;
}