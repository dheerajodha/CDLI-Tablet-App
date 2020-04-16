import 'package:firstapp/models/Cuneiform_Data.dart';
import 'package:firstapp/screens/Cuneiform_Collection_Page.dart';
import 'package:flutter/material.dart';

class CuneiformInfoPage extends StatelessWidget {

  final CuneiformData obj;

  CuneiformInfoPage({Key key, @required this.obj}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(obj.date),
        ),
        body: getCuneiform(),
        
        drawer: Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child : Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children : <Widget> [

                        _buildC(),
                        _buildD(),
                        _buildL(),
                        _buildI()

                    ]
                  ),
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                // Update the state of the app
                Navigator.push(context, MaterialPageRoute(builder: (context)
                 =>  CuneiformCollectionPage(),
                ));
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('View Entries'),
              onTap: () {
                // Update the state of the app
                Navigator.push(context, MaterialPageRoute(builder: (context)
                 =>  CuneiformInfoPage(obj: obj),
                ));
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Explore Themes'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getCuneiform() {
    if (obj == null) {
      return Container();
    } else {
      return Center(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(obj.url),
                fit: BoxFit.contain,
              ),
            )),
      );
    }
  }

  Text _buildC() {
    return Text(
      "c",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 59,
        fontFamily: 'RadikalMedium'
      ),
    );
  }

  Text _buildD() {
    return Text(
      "d",
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 59,
        fontFamily: 'RadikalMedium'
      ),
    );
  }

  Text _buildL() {
    return Text(
      "l",
      style: TextStyle(
        color: Colors.red,
        fontSize: 59,
        fontFamily: 'RadikalMedium'
      ),
    );
  }

  Text _buildI() {
    return Text(
      "i",
      style: TextStyle(
        color: Colors.green,
        fontSize: 59,
        fontFamily: 'RadikalMedium'
      ),
    );
  }
}