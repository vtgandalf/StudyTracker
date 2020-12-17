import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:study_tracker/categorySearchAndSelectionBuilder.dart';

import 'package:study_tracker/introScreen.dart';
import 'package:study_tracker/homeScreen.dart';
import 'package:study_tracker/loginRegisterScreenBuilder.dart';
import 'package:study_tracker/loginScreenBuilder.dart';
import 'package:study_tracker/registerScreenBuilder.dart';


void main() {
  runApp(StudyTracker());
}

class StudyTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Tracker',
      theme: ThemeData.dark(),
      home: new DynamicHome(),
    );
  }
}

class DynamicHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeStateHandler();
  }
  final int pageCounter = 0;
}

class HomeStateHandler extends State<DynamicHome> {
  @override
  Widget build(BuildContext context) {
    return getHome(context);
  }

  HomeStateHandler()
  {
    // Set up builders
    _introScreenBuilder = IntroScreenBuilder();
    _homeScreenBuilder = HomeScreenBuilder();
    _loginRegisterScreenBuilder = LoginRegisterScreenBuilder();
    _loginScreenBuilder = LoginScreenBuilder();
    _registerScreenBuilder = RegisterScreenBuilder();
    _categorySearchAndSelectionBuilder = CategorySearchAndSelectionBuilder();

    // Set up the event handlers
    SetUpEventHandlers();
  }

  void SetUpEventHandlers()
  {
    // Intro events
    _introScreenBuilder.doneStream.listen((_) {
      _updateHomeOnEvent(_loginRegisterScreenBuilder, context);
    });

    // Login/Register prompt
    _loginRegisterScreenBuilder.onLoginPressStream.listen((_) {
      _updateHomeOnEvent(_loginScreenBuilder, context);
    });

    _loginRegisterScreenBuilder.onRegisterPressStream.listen((_) {
      _updateHomeOnEvent(_registerScreenBuilder, context);
    });

    // Login
    _loginScreenBuilder.onLoginPressStream.listen((_) {
      _updateHomeOnEvent(_homeScreenBuilder, context);
    });

    // Register
    _registerScreenBuilder.onRegisterPressStream.listen((_) {
      _updateHomeOnEvent(_categorySearchAndSelectionBuilder, context);
    });

    // Category selection
    _categorySearchAndSelectionBuilder.onSavePressStream.listen((_) {
      _updateHomeOnEvent(_homeScreenBuilder, context);
    });
  }

  Widget getHome(BuildContext context)
  {
    if (_home == null)
      _home = _categorySearchAndSelectionBuilder.getHome(context);
      // _home = _introScreenBuilder.getHome(context);

    return _home;
  }

  void _updateHomeOnEvent(var builder, BuildContext context)
  {
    _home = builder.getHome(context);
    setState(() { });
  }

  // Vars
  Widget _home;

  // Builders
  IntroScreenBuilder _introScreenBuilder;
  LoginRegisterScreenBuilder _loginRegisterScreenBuilder;
  LoginScreenBuilder _loginScreenBuilder;
  RegisterScreenBuilder _registerScreenBuilder;
  CategorySearchAndSelectionBuilder _categorySearchAndSelectionBuilder;

  HomeScreenBuilder _homeScreenBuilder;
}