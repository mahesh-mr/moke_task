import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:topic_test/controller/controller/hive_controller.dart';
import 'package:topic_test/controller/controller/topic_controller.dart';
import 'package:topic_test/model/hive_model.dart';
import 'package:topic_test/view/screen/screen_create/widgets/custom_checkbox.dart';
import 'package:topic_test/view/screen/screen_create/widgets/custom_textfield.dart';
import 'package:topic_test/view/screen/screen_home/widgets/custom_button.dart';
import 'package:topic_test/view/screen/screen_home/screen_home.dart';
import 'package:topic_test/view/style/style.dart';

class TestCreateScreen extends StatelessWidget {
  TestCreateScreen({super.key});

  final TextEditingController _createText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
  
    CheckboxController controller = Get.put(CheckboxController());
    HiveController hiveController = Get.put(HiveController());

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: white,
        title: const Text(
          "Create New Text",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: blue,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            CustomTextField(createText: _createText),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Topics",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: blue,
                  letterSpacing: 1,
                ),
              ),
            ),
            GetBuilder<CheckboxController>(builder: (_) {
              if (controller.topicmode.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.topicmode.length,
                  itemBuilder: (context, index) {
                    final items = controller.topicmode[index];
                    return CustomCheckbox(
                        topicName: items.topicName,
                        concepts: items.concepts,
                        visible: items.isVisible,
                        checkingValuue: items.isCheck,
                        topicIndex: index);
                  });
            }),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: CustomButton(
                      size: Size(size.width, height * .065),
                      onpressed: () {
                        DateTime now = DateTime.now();
                        String formattedDate =
                            DateFormat("MMM dd yyyy ").format(now);
                        HiveModel newTest = HiveModel(
                          name: _createText.text,
                          date: formattedDate,
                        );
                        if (_createText.text.isEmpty) {
                          Get.snackbar("Warning ", "Field can't be empty");
                        } else {
                          hiveController.addTestName(newTest);
                        }
                        Get.to(HomeScreen());
                      },
                      redius: 5,
                      title: "Create")),
            ),
          ],
        ),
      ),
    );
  }
}
