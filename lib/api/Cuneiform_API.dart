import 'package:firstapp/api/network.dart';

const String cuneiformAPIURL = 'https://cdli.ucla.edu/cdlitablet_android/fetchdata.php';

class CuneiformAPI {
  
  Future<dynamic> getCuneiforms() async {
     
    Network network = Network('$cuneiformAPIURL');
    
    var cuneiformData = await network.getData();
    return cuneiformData;
  }

}