import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';

Widget myAppBar({
  required BuildContext context,
  bool deleteFIO = false,
}) {
  return Container(
    color: Theme.of(context).cardColor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo(),
          rightAppBar(
            context: context,
            deleteFIO: deleteFIO,
          ),
        ],
      ),
    ),
  );
}

logo() => SvgPicture.asset(
      'assets/icons/logo.svg',
      semanticsLabel: 'logo',
      fit: BoxFit.contain,
    );

rightAppBar({
  required BuildContext context,
  required bool deleteFIO,
}) =>
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyButton(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/edit.svg',
                  semanticsLabel: 'edit',
                  fit: BoxFit.contain,
                ),
                SizedBox(width: withBetweenContent),
                Text(
                  '12',
                  style: myTextStyleFontS8Sans(context: context),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: withBetweenContent),
            child: VerticalDivider(),
          ),
          if (!deleteFIO)
            Text(
              'Елизавета Киселева',
              style: myTextStyleFontS8Sans(
                context: context,
                textColor: Theme.of(context).textTheme.bodyMedium!.color!,
              ),
            ),
          SizedBox(width: withBetweenContent),
          SvgPicture.asset(
            'assets/icons/user.svg',
            semanticsLabel: 'user',
            fit: BoxFit.contain,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
          ),
        ],
      ),
    );
