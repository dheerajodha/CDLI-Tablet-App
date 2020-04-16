import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:firstapp/api/Cuneiform_API.dart';
import 'package:firstapp/models/Cuneiform_Data.dart';
import 'package:firstapp/screens/Cuneiform_Info_Page.dart';
import 'package:flutter/material.dart';

class CuneiformLandingPage extends StatefulWidget {
  CuneiformLandingPage({Key key}) : super(key : key);
  
  @override
  _CuneiformLandingPageState createState() => _CuneiformLandingPageState();
  }
  
  class _CuneiformLandingPageState extends  State<CuneiformLandingPage>{

  PageController controller = PageController(viewportFraction: 0.50, keepPage: true);
  var currentPageValue = 0.0;
  

  int day = int.parse(DateFormat('d').format(new DateTime.now()));
  
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
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      currentPageValue++;
    

    controller.animateToPage(
      currentPageValue.toInt(),
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        color: Colors.black,
        child : Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children : <Widget> [

            _buildCuneiformPageView(),
            SizedBox(height: 0),
            _buildWelcomeText(),
            new Container( 
                  child : Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children : <Widget> [

                        _buildC(),
                        _buildD(),
                        _buildL(),
                        _buildI()

                    ]
                  )
            )
          ],
        )
      ),
    );
  }

  Text _buildWelcomeText() {

    return Text(
      "\nWelcome to ",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.grey,
          fontSize: 50,
          fontFamily: 'RadikalMedium'),
    );

  }

  Text _buildC() {
    return Text(
      "c",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 50,
        fontFamily: 'RadikalMedium'
      ),
    );
  }

  Text _buildD() {
    return Text(
      "d",
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 50,
        fontFamily: 'RadikalMedium'
      ),
    );
  }

  Text _buildL() {
    return Text(
      "l",
      style: TextStyle(
        color: Colors.red,
        fontSize: 50,
        fontFamily: 'RadikalMedium'
      ),
    );
  }

  Text _buildI() {
    return Text(
      "i",
      style: TextStyle(
        color: Colors.green,
        fontSize: 50,
        fontFamily: 'RadikalMedium'
      ),
    );
  }

  Stack _buildCuneiformContent() {
    return Stack(
      children: <Widget>[
        _buildCuneiformPageView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          ],
        ),
      ],
    );
  }  

  
  Container _buildCuneiformPageView() {
    return Container(
      height: 300,
      width: 500,
      child: PageView.builder(
        itemBuilder: (context, int currentIdx) {
          int crt = currentIdx;
          if (crt > cuneiformDataList.cuneiformData.length-1) {
            crt = crt % cuneiformDataList.cuneiformData.length;
          }
          return Container(
            margin: const EdgeInsets.only(top: 31.0, left: 0),
            child: _buildPageViewItem(cuneiformDataList.cuneiformData[crt], crt),
          );
        },
        controller: controller,
      ),
    );
  }


  GestureDetector _buildPageViewItem(CuneiformData obj, index) {
    bool entryOfTheDay = false;
    List<String> arr = [];
    arr = obj.date.split('-');
    String entryDate = arr[2];
    print(entryDate);
    String finalDate;

    if (day < 10) {
      finalDate = "0" + day.toString();  
    }
    else {
      finalDate = day.toString();
    }

    
    print(finalDate);
    if (entryDate == finalDate) {
      entryOfTheDay = true;
    }

    String suitableText = entryOfTheDay? "Entry of the Day" : "";

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)
                 =>  CuneiformInfoPage(obj: cuneiformDataList.cuneiformData[index]),
                ));
      },
      child: Column(
        mainAxisSize: MainAxisSize.max, 
        children: <Widget>[
        
              SizedBox(
              height: 229,
              width: 229,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(image: NetworkImage(obj.thumbnail))),
                )),

              Text(suitableText,
              style: TextStyle(
                color: Color.fromRGBO(243, 243, 243, 1),
                fontFamily: 'RadikalThin',
                fontSize: 18.0,
              ))
        ],
      ),
    );
  }
}