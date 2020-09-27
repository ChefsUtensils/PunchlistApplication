
import 'package:flutter/material.dart';
import 'package:punchlist/SubcontractorPage/contractors.dart';
import 'package:punchlist/db/database_provider.dart';


class NewSub extends StatefulWidget {
  @override
  _NewSubState createState() => _NewSubState();
}

class _NewSubState extends State<NewSub> {

  final myControllerName = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerPhone = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerName.dispose();
    myControllerEmail.dispose();
    myControllerPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white70,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/subPage');
                },
                iconSize: 30.0,
              ),
              Text(
                'Create New Subcontractor',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 45),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 20,
                  child: TextField(
                    controller: myControllerName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Subcontractor Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Contact Information',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //margin: const EdgeInsets.only(right: 10, left: 10),
                  width: 200,
                  child: TextField(
                    controller: myControllerEmail,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email Address',
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //margin: const EdgeInsets.only(right: 10, left: 10),
                  width: 200,
                  child: TextField(
                    controller: myControllerPhone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Color(0xFF374785),
                  onPressed: () {
                    Contractors newContractor = Contractors(
                      name:myControllerName.text,
                      phone: myControllerPhone.text,
                      email: myControllerEmail.text
                    );
                    DatabaseProvider.db.insert(newContractor).then((storedSub) => null);
                    Navigator.pushReplacementNamed(context, '/subPage');
                  },
                  child: Text(
                    'Finish Creation',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//  _read() async {
//    DatabaseHelper helper = DatabaseHelper.instance;
//    int rowId = 1;
//    SubsStorage sub = await helper.querySub(rowId);
//    if (sub == null) {
//      print('read row $rowId: empty');
//    } else {
//      print('read row $rowId: ${sub.name} ${sub.phone}');
//    }
//
//  }
//
//  _save() async {
//    SubsStorage sub = SubsStorage();
//    sub.name = myControllerName.text;
//    sub.phone = myControllerPhone.text;
//    sub.email = myControllerEmail.text;
//    DatabaseHelper helper = DatabaseHelper.instance;
//    int id = await helper.insert(sub);
//    sub.id = id;
//    print('inserted row: $id');
//  }
//    _save() async {
//      var newSub = Contractors(
//        id: 1,
//        name: myControllerName.text,
//        phone: myControllerPhone.text,
//        email: myControllerPhone.text,
//      );
//      await
//    }
}