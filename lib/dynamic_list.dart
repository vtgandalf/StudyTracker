// import 'dart:js';

import 'package:flutter/material.dart';

import 'utils.dart';

typedef AddItemCallback = void Function(Widget item);

class DynamicList extends StatefulWidget{
  DynamicListDefaultState _state = DynamicListDefaultState();
  // final GlobalKey key1 = GlobalKey();
  // const DynamicList({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _state;

  // final AddItemCallback addItemHandler;
  void addItem(Widget item)
  {
    _state.addItem(item);
  }
}

class DynamicListDefaultState extends State<DynamicList>
{
  List<SizableRow> items;

  DynamicListDefaultState()
  {
    items = <SizableRow>[];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: items,
      )
    );
  }

  void addItem(Widget item)
  {
    // Create the widget to add
    var itemToAdd = SizableItem(
      Container(
        padding: const EdgeInsets.all(STANDARD_ELEMENTS_PADDING),
        child: item
      )
    );

    // Check if _items are empty
    if (items.isEmpty)
    {
      items.add(SizableRow(Row(mainAxisAlignment: MainAxisAlignment.center, children: [itemToAdd])));
      setState(() { });
      return;
    }

    items.last.add(itemToAdd);
    print("item added");
    setState(() { });
    return;

    // Append the item to the first
    // Row that would not exceed the
    // render width
    for (SizableRow sRow in items)
    {
      Row tRow = sRow.child;
      SizableItem tLast = tRow.children.last;

      // Calculate the size of the elements in the row
      double size = 0;
      for (SizableItem child in tRow.children)
      {
        print(child.getWidth());
        size += child.getWidth();
      }

      // Check if the current row can handle the new element
      // if (sRow.getWidth() + itemToAdd.getWidth() <= widget.key1.currentContext.size.width)
      if (size + tLast.getWidth() <= sRow.getWidth())
      {
        // Add the new element
        final Row row = sRow.child;
        row.children.add(itemToAdd);

        setState(() { });
        return;
      }

      // Check if there are other rows to check
      if (sRow != items.last)
        continue;

      // If last add a new row
      items.add(SizableRow(Row(mainAxisAlignment: MainAxisAlignment.center, children: [itemToAdd])));
      break;
    }

    setState(() { });
  }

  void RemoveItem()
  {
    // Check if _items are empty
    if (items.isEmpty)
      return;
  }
}

class SizableItem extends StatelessWidget
{
  final GlobalKey key1 = GlobalKey();
  SizableItem(Widget row, {Key key})
  {
    child = row;
  }

  double getWidth()
  {
    return key1.currentContext.size.width;
  }

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(child: child, key: key1);
  }
}

class SizableRow extends StatefulWidget
{
  final GlobalKey key1 = GlobalKey();
  var _state = SizableRowState();
  SizableRow(Row row, {Key key})
  {
    child = row;
  }

  void add(Widget item)
  {
    _state.add(item);
  }

  double getWidth()
  {
    return key1.currentContext.size.width;
  }

  Row child;


  @override
  State<StatefulWidget> createState() => _state;
}

class SizableRowState extends State<SizableRow>
{
  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child, key: widget.key1);
  }

  void add(Widget item)
  {
    print(widget.child.children.length);
    widget.child.children.add(item);
    setState(() { });
  }
}
