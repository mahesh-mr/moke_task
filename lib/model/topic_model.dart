import 'dart:convert';

List<TopicsModels> topicsModelsFromJson(List topicModel) =>
    List<TopicsModels>.from(topicModel.map((e) => TopicsModels.fromJson(e)));

class TopicsModels {
  TopicsModels({
    required this.topicName,
    this.isCheck=false,
    this.isVisible=false,
    required this.concepts,
  });

  String topicName;
  bool isCheck;
  bool isVisible ;
  List<Concept> concepts;

  factory TopicsModels.fromJson(Map<String, dynamic> json) {
    List<String> allConcepts =
        List<String>.from(json["concepts"].map((e) => e));

    return TopicsModels(
        topicName: json["topicName"],
        // isCheck: json["isCheck"],
        // isVisible: json["isVisible"],
        concepts: List.generate(
            allConcepts.length, (index) => Concept(name: allConcepts[index])));
  }
}

class Concept {
  Concept({
    required this.name,
    this.isCheck =false,
  });

  String? name;
  bool isCheck;

  // factory Concept.fromJson(Map<String, dynamic> json) => Concept(
  //       name: json["name"],
  //       isCheck: json["isCheck"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "isCheck": isCheck,
  //     };
}
