import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:study_tracker/utils.dart';

class HomeScreenBuilder
{
  HomeScreenBuilder();

  Widget getHome(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),

        drawer: Container(
          width: AppBar().preferredSize.height,
          child: Drawer(
            child: ListView(
              children: <Widget>[
                IconButton(icon: Icon(Icons.home_repair_service_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.account_circle_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.calendar_today_rounded), onPressed: null),
                // IconButton(icon: Icon(Icons.list_alt_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.list_rounded), onPressed: null),
                IconButton(icon: Icon(Icons.bar_chart_rounded), onPressed: null),
              ],
            ),
          ),
        ),


        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _portraitLayout(context)
                : _landscapeLayout(context);
          },
        ),

      );
  }

  Widget _portraitLayout(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.all(SMALL_PADDING),
      color: Theme.of(context).primaryColorDark,
      child: Column(
        children: <Widget>[
          getSectionOverBackground(context, Container()),
          getPaddingFieldSmall(),
          getSectionOverBackground(context, Container()),
        ]
      ),
    );
  }

  Widget _landscapeLayout(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.all(SMALL_PADDING),
      color: Theme.of(context).primaryColorDark,
      child: Row(
        children: <Widget>[
          getSectionOverBackground(context, Container()),
          getPaddingFieldSmall(),
          getSectionOverBackground(context, Container()),
        ],
      ),
    );
  }
}