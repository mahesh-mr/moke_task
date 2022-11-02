import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topic_test/controller/controller/hive_controller.dart';
import 'package:topic_test/model/hive_model.dart';
import 'package:topic_test/view/screen/screen_create/screen_create.dart';
import 'package:topic_test/view/screen/screen_home/widgets/custom_button.dart';
import 'package:topic_test/view/screen/screen_home/widgets/custom_card.dart';
import 'package:topic_test/view/style/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HiveController hiveController = Get.put(HiveController());
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final width12 = SizedBox(height: height * .02);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        toolbarHeight: height * .08,
        centerTitle: true,
        title: const Text(
          "Mock Test App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: height * .3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tester.png"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .090),
            child: CustomButton(
                size: Size(size.width * .8, height * .065),
                onpressed: () {
                  Get.to(TestCreateScreen());
                },
                redius: 10,
                title: "Create New Test"),
          ),
          width12,
          const Divider(
            thickness: 3,
            color: blue,
          ),
        width12,
          Obx(() {
            if (hiveController.hivemodel.isEmpty) {
              return const Center(
                child: Text(
                  "Text is Empty",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 1,
                  ),
                ),
              );
            }
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.090),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hiveController.hivemodel.length,
                itemBuilder: (context, index) {
                  HiveModel model = hiveController.hivemodel[index];

                  return CustomCard(
                      size: size, name: model.name, date: model.date);
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
