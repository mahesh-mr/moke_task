import 'package:dio/dio.dart';
import 'package:topic_test/controller/service/dio.dart';
import 'package:topic_test/model/topic_model.dart';

class TopicService {
  static Future <List<TopicsModels>?> getTopic()async{
    try {
    var response = await DioClient.dio.get("/topics");

      
      List<TopicsModels> models =topicsModelsFromJson(response.data);
      print(response.data);
      return models;
    } on DioError catch (e) {
      ("dio error cateched service");
      (e.message);
      (e.response!.data);
      (e.type);
     (e);
    } catch (e) {
      ("service catch");
      (e);
    }
  }
}
