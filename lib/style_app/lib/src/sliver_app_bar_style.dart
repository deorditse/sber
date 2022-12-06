import 'package:flutter/material.dart';

ShapeBorder myStyleShapeBorder() => const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
    );

Widget myBackLineInAppBar({required BuildContext context}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 10,
    child: Divider(
      color: Theme.of(context).textTheme.headline1!.color!.withOpacity(0.6),
      thickness: 3,
      height: 8,
    ),
  );
}
