import 'package:flutter/material.dart';

import 'dart:async';

import 'package:study_tracker/utils.dart';

class LoginScreenBuilder
{
  LoginScreenBuilder()
  {
    // Set up controllers
    _onLoginPressController = new StreamController.broadcast();
  }

  Widget getHome(BuildContext context)
  {
    return Container(
      // padding: const EdgeInsets.all(MediaQuery.of(context).size.width * 0.65),
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            getIconSizedWidth(0.4, Icons.account_circle_rounded),
            getPaddingFieldSmall(),
            getTextField("Username"),
            getPaddingField(),
            getTextField("Password", visibility: false),
            getPaddingField(),
            Center(child: getButton("Login", _onLoginPress, context)),
            Expanded(child: Container())
          ],
        )
      )
    );
  }

  void _onLoginPress()
  {
    _onLoginPressController.add(null);
  }

  // Stream controllers
  StreamController _onLoginPressController;

  // Streams
  Stream get onLoginPressStream => _onLoginPressController.stream;
}