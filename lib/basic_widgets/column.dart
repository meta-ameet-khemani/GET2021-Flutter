import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "1. Text",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "2. Text",
                  style: TextStyle(fontSize: 60.0),
                ),
                Text(
                  "3. Text",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(12.0),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(8),
                        color:Colors.red
                    ),
                    child: Text("React.js",style: TextStyle(color:Colors.yellowAccent,fontSize:20),),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(12.0),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(8),
                        color:Colors.red
                    ),
                    child: Text("Flutter",style: TextStyle(color:Colors.yellowAccent,fontSize:20),),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(12.0),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(8),
                        color:Colors.red
                    ),
                    child: Text("MySQL",style: TextStyle(color:Colors.yellowAccent,fontSize:20),),
                  )
                ]
            ),
          ],
        ),
      ),
    );
  }
}
