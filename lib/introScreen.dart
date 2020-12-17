import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'package:flutter/material.dart';

import 'dart:async';


class IntroScreenBuilder
{
  Widget getHome(BuildContext context) {
    return new IntroSlider(
      // Slides
      slides: _slides,

      // Skip button
      renderSkipBtn: _renderSkipBtn(context),
      // colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Theme.of(context).accentColor,

      // Next button
      renderNextBtn: _renderNextBtn(context),

      // Done button
      renderDoneBtn: _renderDoneBtn(context),
      onDonePress: _onDonePress,

      // Dot indicator
      colorDot: Theme.of(context).accentColor,
      sizeDot: 13.0,

      // Custom tabs
      listCustomTabs: this._renderListCustomTabs(context),
      backgroundColorAllSlides: Theme.of(context).primaryColor,
    );
  }

  IntroScreenBuilder()
  {
    _doneController = new StreamController.broadcast();
    _slides = new List<Slide>();
    _fillInSlides();
  }

  void _onDonePress()
  {
    print("button has been pressed");
    _doneController.add(null);
  }

  void _fillInSlides()
  {
    _slides.add(
      new Slide(
        title: "Hello! Having too much to do? Let me help you with that.",
        description: null,
        // pathImage: "null",
        backgroundColor: Colors.black,
      )
    );
    _slides.add(
      new Slide(
        title: "I can help you organize your schedule and keep it updated.",
        description: null,
        // pathImage: "nullasdfasd",
        backgroundColor: Colors.black,
      )
    );
    _slides.add(
      new Slide(
        title: "Keep track of classes, exams and assignments.",
        description: null,
        // pathImage: null,
        backgroundColor: Colors.black,
      )
    );
    _slides.add(
      new Slide(
        title: "And free time: breaks, friends and sports.",
        description: null,
        // pathImage: null,
        backgroundColor: Colors.black,
      )
    );
    _slides.add(
      new Slide(
        title: "Decide your own goals!",
        description: null,
        // pathImage: null,
        backgroundColor: Colors.black,
      )
    );
    _slides.add(
      new Slide(
        title: "Make planning easy.",
        description: null,
        // pathImage: null,
        backgroundColor: Colors.black,
      )
    );
  }

  Widget _renderNextBtn(BuildContext context) {
    return Icon(
      Icons.navigate_next,
      color: Theme.of(context).accentColor,
      size: 35.0,
    );
  }

  Widget _renderDoneBtn(BuildContext context) {
    return Icon(
      Icons.done,
      color: Theme.of(context).accentColor,
    );
  }

  Widget _renderSkipBtn(BuildContext context) {
    return Icon(
      Icons.skip_next,
      color: Theme.of(context).accentColor,
    );
  }

  List<Widget> _renderListCustomTabs(BuildContext context) {
    List<Widget> tabs = new List();
    for (int i = 0; i < _slides.length; i++) {
      Slide currentSlide = _slides[i];
      tabs.add(
        Container(
          padding: const EdgeInsets.only(
            bottom: 140,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Text(
                      currentSlide.title,
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                    margin: EdgeInsets.only(top: 20.0),
                  ),
                ),
              ),
              if (currentSlide.pathImage != null)
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                    ),
                  ),
                ),
            ],
          ),
        )
      );
    }
    return tabs;
  }

  List<Slide> _slides;
  StreamController _doneController;
  Stream get doneStream => _doneController.stream;
}