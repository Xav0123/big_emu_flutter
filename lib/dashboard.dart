import 'package:flutter/material.dart';
import 'games.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
//import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';

//final myCustomCursor = CustomMouseCursor.asset('Normal-Select.png',  hotX:2, hotY:2 );

class Dashboard extends StatefulWidget {

  final List<Game> items;

  const Dashboard(this.items);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text("Big Emulator")
        ),
        body: MouseRegion( 
          cursor: SystemMouseCursors.allScroll,
          //padding: EdgeInsets.all(12.0), 
          // list view to show images and list count 
          child: ListWheelScrollViewX(   
            itemExtent: 200,
            scrollDirection: Axis.horizontal, 
            children: [ 
              // showing list of images 
              for (var currGame in widget.items) 
                Center( 
                  child: Container(width: 170, height: 120, child: GameCard(currGame)), 
                ) 
            ], 
          ), 
        ), 
      ), 
    ); 
      /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text("Big Emulator")
        ),
        body: Center(
          child: GridView.builder(
                      //padding: const EdgeInsets.all(30.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 8,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: allGames.length,
                      itemBuilder: (context, index) {
                        return GameCard(index, allGames);
                      }
          ),
        ),
      ),
    );*/
  }
}