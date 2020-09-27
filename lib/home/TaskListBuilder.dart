import 'package:flutter/material.dart';
import 'statefulDropdown.dart';

class TaskListBuilder extends StatefulWidget {
  @override
  _TaskListBuilderState createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xFF24305E),
      margin: EdgeInsets.all(10.0),
      height:200.0,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            offset: Offset(0,2),
          ),
        ],
      ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color(0xFF24305E),
                pinned: false,
                floating: false,
                expandedHeight: 15.0,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text('To Do List')
                ),
                actions: <Widget>[

                ],
              ),
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      //color: Colors.cyan[100 * (index % 9)],
                      decoration: BoxDecoration(
                        color: Color(0xFF374785),
                        border: Border.all(
                          color: Colors.black54,
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Task $index',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              'Timestamp',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 11,
                ),
              ),
            ],
          ),
        ),
    );;
  }
}
