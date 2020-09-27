import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:punchlist/db/database_provider.dart';
import 'package:punchlist/SubcontractorPage/contractors.dart';
import 'package:punchlist/SubcontractorPage/SpecificSubPage/SubDetailScreen.dart';

class SubPage extends StatefulWidget {
  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {

  final List<List<Contractors>> subsList1 = new List<List<Contractors>> ();

  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.getContractors().then(
            (subList) => subsList1.add(subList));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white70,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                iconSize: 30.0,
              ),
              //SizedBox(width: MediaQuery.of(context).size.width/5-8),
              Text(
                'Subcontractors',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 26.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 40.0),
            ],
          ),
          SizedBox(height:20),
         Container(
           //color: Color(0xFF374785),
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height /4 *3,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.only(
                  topLeft:  const  Radius.circular(10.0),
                  topRight: const  Radius.circular(10.0),
                  bottomLeft:  const  Radius.circular(10.0),
                  bottomRight: const  Radius.circular(10.0)
              ),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                color: Color(0xFF374785),
                offset: Offset(0,2),
                ),
              ],
           ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverFixedExtentList(
                      itemExtent: MediaQuery.of(context).size.height / 24 * 3,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return FlatButton(
                              onPressed: () {
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                    builder: (context) => SubDetailScreen(Contractors: subsList1[index]),
//                                  ),
//                                );
                              },
                              color: Color(0xFF374785),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Contractor $index',
                                    style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    'Other thing',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18.0,
                                     ),
                                    ),
                                ],
                              ),
                            );
                        },
                        childCount: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width:1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: FlatButton(
                    color: Color(0xFF374785),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/newSubPage');
                    },
                    child: Text(
                      'New Subcontractor',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Lato',
                      ),
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
}
