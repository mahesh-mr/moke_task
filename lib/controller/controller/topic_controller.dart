
import 'package:get/get.dart';
import 'package:topic_test/controller/service/topic_service.dart';
import 'package:topic_test/model/topic_model.dart';

class CheckboxController extends GetxController {
  List<TopicsModels> topicmode = [];
  
  void checkboxValue(
      {required bool value,
      required int topicIndex,
      required int concptsIndex}) {
    topicmode[topicIndex].concepts[concptsIndex].isCheck=value;
    int conseptLength = topicmode[topicIndex].concepts.length;
    int checkConceptLength = topicmode[concptsIndex]
        .concepts
        .where((element) => element.isCheck)
        .toList()
        .length;
    if (conseptLength == checkConceptLength) {
      topicmode[topicIndex].isCheck = true;
    } else {
      topicmode[topicIndex].isCheck = false;
    }
    update();
  }

  void allcheckbox(int topicIndex, bool value, int length) {
    for (var i = 0; i < length; i++) {
      topicmode[topicIndex].concepts[i].isCheck = value;
    }
    topicmode[topicIndex].isCheck = value;
    update();
  }

  void visiblity(bool value, int index) {
    topicmode[index].isVisible = value;
    update();
  }



  
  Future <List<TopicsModels>?>getmodels()async{
    try {
      var data =await TopicService.getTopic();
update();
    return data;
 } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
      print('catch bloc called');
  
      return[];
    
    }
  }
  @override
  void onInit() {
    getmodels().then((value) => topicmode=value!);
    super.onInit();
  }

}
