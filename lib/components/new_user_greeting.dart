import 'package:flutter/material.dart';
import 'package:learn/classes/children.dart';
import 'package:learn/classes/parents.dart';
import 'package:learn/utils/fontstyles.dart';

class NewUserGreetings extends StatelessWidget {
  final VolatileChildren child;

  const NewUserGreetings({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(child.value.photoPath, height: 60),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Bom dia, ',
                        style: FontStyles.body2MediumBlack,
                      ),
                      TextSpan(
                        text: child.value.name,
                        style: FontStyles.body2BoldBlack,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Image.asset(
          'assets/images/appIcons/bell.png',
          height: 24,
          width: 24,
        ),
      ],
    );
  }
}

