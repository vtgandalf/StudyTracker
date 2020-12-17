import 'package:flutter/material.dart';

import 'dart:async';

import 'package:study_tracker/utils.dart';
import 'dynamic_list.dart';

class CategorySearchAndSelectionBuilder
{
  CategorySearchAndSelectionBuilder()
  {
    // Set up controllers
    _onSavePressController = new StreamController.broadcast();
    listClasses = DynamicList();
    listFreeTime = DynamicList();
  }

  Widget getHome(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.all(SMALL_PADDING),
      child: Column(
        children: <Widget>[
          getSectionOverBackground(context,
            Center(
              child: Container
              (
                padding: const EdgeInsets.all(STANDARD_ELEMENTS_PADDING),
                child: Column(
                  children: <Widget>[
                    getSearchBar(context, "Choose classes to schedule...", ["option 1", "option 2", "option 3", "option 4"], listClasses.addItem),
                    listClasses,
                  ]
                )
              )
            )
          ),
          getPaddingFieldSmall(),
          getSectionOverBackground(context,
            Center(
              child: Container
              (
                padding: const EdgeInsets.all(STANDARD_ELEMENTS_PADDING),
                child: Column(
                  children: <Widget>[
                    // getSearchBar(context, "And free time activities...", ["option 1", "option 2", "option 3", "option 4"]),
                    // listFreeTime,
                    Container(),
                  ]
                )
              )
            )
          ),
          getPaddingFieldSmall(),
          getButton("Save", _onSavePress, context),
        ]
      ),
    );
  }

  void _onSavePress()
  {
    _onSavePressController.add(null);
  }

  // Stream controllers
  StreamController _onSavePressController;

  // Streams
  Stream get onSavePressStream => _onSavePressController.stream;

  // Dynamic lists with the different categories
  DynamicList listClasses;
  DynamicList listFreeTime;
}