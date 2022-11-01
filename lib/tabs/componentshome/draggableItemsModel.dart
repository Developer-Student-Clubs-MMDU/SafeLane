import 'package:flutter/material.dart';

class SettingButtons extends StatelessWidget {
  final String textLabel;
  final void Function()? onTap;
  final Widget child;

  const SettingButtons({
    Key? key,
    required this.textLabel,
    required this.onTap, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 25.0),
        child: Row(
          children: [
            child,
            SizedBox(width: 20,),
            Text(
              textLabel,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
