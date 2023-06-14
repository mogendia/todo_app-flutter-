import 'package:flutter/material.dart';
import 'package:omda_todo_app/core/utils/utils.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          kImage,
        ),
      ),
    );
  }
}
