import 'package:flutter/material.dart';
import 'package:topic_test/view/style/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController createText,
  }) : _createText = createText, super(key: key);

  final TextEditingController _createText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: FocusNode(),
      textCapitalization: TextCapitalization.words,
      controller: _createText,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.assignment_ind_outlined,
          color: blue,
        ),
        hintText: "Test Name",
        hintStyle: const TextStyle(
          color: grey,
          fontWeight: FontWeight.w500,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: blue, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1.5, color: blue),
        ),
      ),
    );
  }
}
