import 'package:flutter/material.dart';
import 'package:topic_test/model/hive_model.dart';
import 'package:topic_test/view/style/style.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    Key? key,
    required this.size,
    required this.name,required this.date,

  }) : super(key: key);

  final Size size;
 final  String name;
 final String date;
  //final HiveModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: grey, width: .3),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
               name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 15, right: 15),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Created on",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text:date,
                      style: const TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
