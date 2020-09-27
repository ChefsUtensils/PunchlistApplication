import 'package:flutter/material.dart';
import 'statefulDropdown.dart';
import 'TaskListBuilder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF77A6F7),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children:<Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text(
                    'Punchlist',
                    style: TextStyle(
                      fontFamily: 'Billabong',
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.settings),
                iconSize: 30.0,
                onPressed: () {print('settings page');},
              ),
            ],
          ),
          Container(
            //color: Color(0xFF24305E),
            width: double.infinity,
            height: 300.0,
            //color: Colors.black12, //so i can see it
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(width: 5.0);
                }
                return TaskListBuilder();
              },
            )
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 12.0),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                child:Container(
                  height:1.0,
                  width: double.maxFinite,
                  color:Colors.black,),),
              SizedBox(height: 4.0),
              Row(
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 16,
                            height: MediaQuery.of(context).size.height /5,
                            child: RaisedButton(
                              color: Color(0xFF3B8BEB),
                              onPressed: () {},
                              child: Text(
                                  'Jobs',
                                  style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 23.0,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        height: MediaQuery.of(context).size.height /5,
                        child: RaisedButton(
                          color: Color(0xFF3B8BEB),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/subPage');
                          },
                          child: Text(
                              'Subcontractors',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 23.0,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 16,
                          height: MediaQuery.of(context).size.height /5,
                          child: RaisedButton(
                            color: Color(0xFF3B8BEB),
                            onPressed: () {},
                            child: Text(
                                'idk what to put here',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 23.0,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        height: MediaQuery.of(context).size.height /5,
                        child: RaisedButton(
                          color: Color(0xFF3B8BEB),
                          onPressed: () {},
                          child: Text(
                              'Preferences',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 23.0,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             ],
          ),
        ],
      ),
    );
  }
}

