import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:topic_test/model/hive_model.dart';

class HiveController extends GetxController{

  final box =Hive.box<HiveModel>(boxname);
  RxList<HiveModel>hivemodel =<HiveModel>[].obs;

  getTestName(){
hivemodel.value=box.values.toList();
  }

addTestName(HiveModel hiveModel){
  box.add(hiveModel);
  getTestName();
}

closeHiveData(){
  box.clear();
   getTestName();
}
@override
  void onInit() {
   getTestName();
    super.onInit();
  }
}