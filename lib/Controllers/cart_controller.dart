import 'package:get/get.dart';

class cartController extends GetxController{

  var totalP = 0.obs;
  calculate(data){
    totalP.value = 0;
    for(var i = 0; i<data.length; i++){
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

}