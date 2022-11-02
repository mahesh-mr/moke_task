import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topic_test/controller/controller/topic_controller.dart';
import 'package:topic_test/model/topic_model.dart';
import 'package:topic_test/view/style/style.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({
    Key? key,
    required this.topicName,
    required this.concepts,
    required this.visible,
    required this.checkingValuue,
    required this.topicIndex,
  }) : super(key: key);

  String topicName;
  List<Concept> concepts;
  int topicIndex;
  bool visible;
  bool checkingValuue;

  @override
  Widget build(BuildContext context) {
    CheckboxController checkboxController = Get.find<CheckboxController>();
    return Column(
      children: [
        ListTile(
              contentPadding: const EdgeInsets.all(0),
          leading: Checkbox(
              value: checkingValuue,
              onChanged: (value) {
                if (!visible) {
                  checkboxController.visiblity(!visible, topicIndex);
                }
            //    checkboxController.allcheckbox(topicIndex, value!, concepts.length);
              }),
          title: Text(topicName),
          onTap: () {
            checkboxController.visiblity(!visible, topicIndex);
          },
          trailing: !visible
              ? const Icon(Icons.keyboard_arrow_down_rounded)
              : const Icon(Icons.keyboard_arrow_up_rounded),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ...List.generate(
            visible ? concepts.length : 0,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                    children: [
                      Checkbox(
                          value: concepts[index].isCheck,
                          onChanged: (value) {
                            checkboxController.checkboxValue(
                                value: value!,
                                topicIndex: topicIndex,
                                concptsIndex: index);
                          }),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        height: 20,width: 200,
                        child: Text(concepts[index].name!,overflow: TextOverflow.ellipsis,))
                    ],
                  ),
            ))
      ],
    );
  }
}
