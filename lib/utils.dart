import 'package:flutter/material.dart';
import 'search_widget.dart';

const double STANDARD_ELEMENTS_PADDING = 20;
const double EDGE_RADIUS = 10;
const double SMALL_PADDING = 10;

Widget getButton(var text, var buttonAction, BuildContext context)
{
  return RaisedButton(
    shape: StadiumBorder(),
    color: Theme.of(context).accentColor,
    onPressed: () { buttonAction(); },
    child: Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button.merge(
          TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.headline6.fontSize
          )
        )
      )
    )
  );
}

Widget getIconSizedWidth(var widthPercentage, var icon)
{
  return FractionallySizedBox(
    widthFactor: widthPercentage,
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Icon(icon),
    )
  );
}

Widget getTextField(var text, {bool visibility = true})
{
  return Material(
    child: TextField(
      obscureText: !visibility,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: text,
      ),
    )
  );
}

Widget _getTextFieldControlled(BuildContext context, var text, var controller, var focusNode)
{
  return TextField(
    controller: controller,
    focusNode: focusNode,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.search),
        labelText: text,
    ),
  );
}

Widget getPaddingField({double value = STANDARD_ELEMENTS_PADDING})
{
  return Container(padding: EdgeInsets.all(value/2));
}

Widget getPaddingFieldSmall()
{
  return getPaddingField(value: SMALL_PADDING);
}

Widget getSectionOverBackground(BuildContext context, Widget childWidget)
{
  return Expanded(
    child: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(EDGE_RADIUS),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: childWidget,
        ),
      ),
    ),
  );
}

Widget getSearchBar(BuildContext context, var text, var list, var dynamicListCallback)
{
  return Material(
    child: SearchWidget<String>(
      dataList: list,
      hideSearchBoxWhenItemSelected: false,
      listContainerHeight: MediaQuery.of(context).size.height/4,
      queryBuilder: (String query, List<String> list) {
        return list.where((String item) => item.toLowerCase().contains(query.toLowerCase())).toList();
      },
      popupListItemBuilder: (String item) {
        return _popUpListItemWidget(context, item);
      },
      selectedItemBuilder: (String selectedItem, VoidCallback deleteSelectedItem) {
        return _getSelectedItemWidget(context, selectedItem, deleteSelectedItem);
      },
      // widget customization
      noItemsFoundWidget: _noItemsFound(context),
      textFieldBuilder: (TextEditingController controller, FocusNode focusNode) {
        return _getTextFieldControlled(context, text, controller, focusNode);
      },
      dynamicListCallback: (var item) {return dynamicListCallback(item);},
    )
  );
}

Widget _noItemsFound(BuildContext context)
{
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        Icons.folder_open,
        size: 24,
        color: Colors.grey[900].withOpacity(0.7),
      ),
      const SizedBox(width: 10),
      Text(
        "No Items Found",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[900].withOpacity(0.7),
        ),
      ),
    ],
  );
}

Widget _popUpListItemWidget(BuildContext context, var item)
{
  return Container(
    padding: const EdgeInsets.all(12),
    child: Text(
      item,
      style: const TextStyle(fontSize: 16, color: Colors.black),
    ),
  );
}

Widget _getSelectedItemWidget(BuildContext context, var selectedItem, var deleteSelectedItem)
{
  return Material(
    child: Chip(
      label: Text(selectedItem, style: TextStyle(color: Theme.of(context).primaryColor)),
      backgroundColor: Theme.of(context).accentColor
    )
  );
}
