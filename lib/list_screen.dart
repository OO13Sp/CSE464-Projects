import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODO APP",
          style: TextStyle(color: Colors.blue),
        ),
      ),

      body: Container(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              color: Colors.cyan,
              width: 100,
                height: 100,
            ),
            Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            )


          ],
        ),

      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            ),
            Container(
              color: Colors.cyan,
              width: 100,
              height: 100,
            )


          ],
        ),

      ),
    );



  }
}
