import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/semantics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text ("Hello"),
      ),
      bottomNavigationBar: BottomNavyBar(),
    ); 

  }
}

class BottomNavyBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavyBarState();
  }
  
}

class BottomNavyBarState extends State<BottomNavyBar> {
  
  int SelectedIndex=0;
  Color  backgroudColor = Colors.white;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('Home')),
    NavigationItem(Icon(Icons.favorite_border), Text('Favorite')),
    NavigationItem(Icon(Icons.search), Text('Search')),
    NavigationItem(Icon(Icons.person_outline), Text('Profile')),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: double.maxFinite,
      width: isSelected ? 150 : 50,
      padding: EdgeInsets.only(left: 6, right:3),
      decoration: isSelected ? BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ): null,
        child: ListView (
          scrollDirection: Axis.horizontal,
          children: <Widget> [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  
                  IconTheme(
                  data: IconThemeData(
                    size: 28,
                    color: isSelected ? backgroudColor : Colors.black
                  ),
                  child: item.icon,
                ), Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: isSelected ?  item.title: Container()
                )
              ]
            )
          ]
          
        ),
    );
    
     

  }
  @override 
  Widget build(BuildContext context) {
    return Container(
    //  color: Colors.amber,
      height: 60,
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item){
          var itemIndex = items.indexOf(item); 

            return GestureDetector(
              onTap: (){
                setState(() {
                  SelectedIndex = itemIndex;
              });

            }, 
              child: _buildItem(item, SelectedIndex == itemIndex)
            );
          }).toList(),
        ),
      );

    }
  } 

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
  
}
