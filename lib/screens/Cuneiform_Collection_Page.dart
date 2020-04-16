import 'dart:convert';
import 'package:firstapp/api/Cuneiform_API.dart';
import 'package:firstapp/models/Cuneiform_Data.dart';
import 'package:firstapp/screens/Cuneiform_Info_Page.dart';
import 'package:flutter/material.dart';

class CuneiformCollectionPage extends StatefulWidget {
  
  CuneiformCollectionPage({Key key}) : super(key: key);


  @override
  _CuneiformCollectionPageState createState() => _CuneiformCollectionPageState();
}

class _CuneiformCollectionPageState extends State<CuneiformCollectionPage> {

  CuneiformDataList cuneiformDataList = CuneiformDataList();

  void getData() async {
    var cuneiformJson = await CuneiformAPI ().getCuneiforms();
    print(cuneiformJson);

    var cuneiformMap = json.decode(cuneiformJson);

    setState(() {
      cuneiformDataList = CuneiformDataList.fromJson(cuneiformMap);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Color(4278190080),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: (cuneiformDataList == null ||
                  cuneiformDataList.cuneiformData == null ||
                  cuneiformDataList.cuneiformData.length == 0)
              ? 0
              : cuneiformDataList.cuneiformData.length,

          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 2, 
            crossAxisSpacing: 4.0, 
            mainAxisSpacing: 4.0),
          
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)
                 =>  CuneiformInfoPage(obj: cuneiformDataList.cuneiformData[index]),
                ));
              },
              child : new Container(
                color: Colors.black,
                child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Image.network(cuneiformDataList.cuneiformData[index].thumbnail),
                    subtitle: Text(cuneiformDataList.cuneiformData[index].date ?? ''),
                  ),
                ),
              ),
              ),
            );
          }),
      ) 
    );
  }
}