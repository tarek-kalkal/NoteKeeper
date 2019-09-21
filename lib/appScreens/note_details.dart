import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appbarTitle;

  NoteDetails(this.appbarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailsState(appbarTitle);
  }
}

class NoteDetailsState extends State<NoteDetails> {
  String appbarTitle;
  NoteDetailsState(this.appbarTitle);

  static var _priorities = ['High', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
         // debugPrint('back button is pressed');
         moveToLastScreen();
        },
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text(appbarTitle),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                moveToLastScreen();
              },
            ),
            elevation: 10.0,
          ),
          body: ListView(
            children: <Widget>[
              // First element
              Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  child: ListTile(
                    title: DropdownButton(
                        items: _priorities.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        value: 'Low',
                        onChanged: (valueSelectedByUser) {
                          setState(() {
                            debugPrint('User selected $valueSelectedByUser');
                          });
                        }),
                  )),

              Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  child: TextField(
                    controller: titleController,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  )),

              Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  child: TextField(
                    controller: descriptionController,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  )),

              Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        height: 40,
                        child: RaisedButton(
                          color: Colors.green,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)),
                          child: Text(
                            'Save',
                            textScaleFactor: 1.7,
                            style: TextStyle(color: Colors.grey[200]),
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                            });
                          },
                        ),
                      )),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        child: RaisedButton(
                          color: Colors.grey[200],
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)),
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.green),
                            textScaleFactor: 1.7,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                            });
                          },
                        ),
                      )),
                    ],
                  ))
            ],
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
