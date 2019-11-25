import 'package:flutter/material.dart';
import '../models/item.dart';
import 'package:todo_dev/pages/marcar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class MyHomePage extends StatefulWidget {
  var items = new List < Item > ();

  MyHomePage() {
    items = [];
    items.add(Item(title: "Bebê", done: false));
    items.add(Item(title: "Criança", done: true));
    items.add(Item(title: "Adolescente", done: false));

  }



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State < MyHomePage > {

  Material MyItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: < Widget > [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: < Widget > [
                    
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Text(heading,
                          style: TextStyle(
                            color: new Color(color),
                            fontSize: 20.0,
                          ),
                        ),
                    ),

                  //icone

                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                          icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                    
                  ],
                )
              ],
            ),
        )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home - Dashboard", style: TextStyle(color: Colors.white, ), ),
      ),

      body:

      StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: < Widget > [
          MyItems(Icons.graphic_eq, "TotalViews", 0xffed622b),
          MyItems(Icons.bookmark, "TotalViews", 0xff26cb3c),
          MyItems(Icons.notifications, "TotalViews", 0xffff3266),
          MyItems(Icons.attach_money, "TotalViews", 0xff3399fe),
          MyItems(Icons.settings, "TotalViews", 0xfff4c83f),
          MyItems(Icons.group_work, "TotalViews", 0xff622F74),
          MyItems(Icons.favorite, "TotalViews", 0xffad61f1),
          MyItems(Icons.message, "TotalViews", 0xff7297ff),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 250.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(2, 240.0),
          StaggeredTile.extent(2, 120.0),
        ],
      ),

      /*ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => Horario()
            ),
          );
        },
        child: Icon(Icons.skip_next),
        backgroundColor: Colors.orange,
      ),
*/
    );
  }
}