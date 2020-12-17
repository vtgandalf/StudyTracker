import 'package:flutter/material.dart';

import 'dart:async';

import 'package:study_tracker/utils.dart';

class RegisterScreenBuilder
{
  RegisterScreenBuilder()
  {
    // Set up controllers
    _onRegisterPressController = new StreamController.broadcast();
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
            getTextField("Email"),
            getPaddingField(),
            getTextField("Password", visibility: false),
            getPaddingField(),
            getTextField("Re-enter", visibility: false),
            getPaddingField(),
            Center(child: getButton("Register", _onRegisterPress, context)),
            Expanded(child: Container())
          ],
        )
      )
    );
  }

  void _onRegisterPress()
  {
    _onRegisterPressController.add(null);
  }

  // Stream controllers
  StreamController _onRegisterPressController;

  // Streams
  Stream get onRegisterPressStream => _onRegisterPressController.stream;
}