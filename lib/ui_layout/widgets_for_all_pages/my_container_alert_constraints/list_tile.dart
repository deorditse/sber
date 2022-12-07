import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/app_bar.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.title,
    required this.number,
    required this.subtitle,
    this.isUpload = false,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String number;
  final String title;
  final bool isUpload;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: mySizedHeightBetweenContainer.height!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: myColorIsActive,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 10,
                child: Text(
                  number,
                  style: myTextStyleFontS8Sans(context: context),
                ),
              ),
            ),
          ),
          SizedBox(width: withBetweenContent),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: myTextStyleFontS8Sans(
                    context: context,
                    fontSize: 12,
                  ),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  subtitle,
                  style: myTextStyleFontS8Sans(
                      context: context,
                      fontSize: 12,
                      newFontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: mySizedHeightBetweenContainer.height! / 2,
                  ),
                  child: isUpload
                      ? fileNotLoaded(context: context, onTap: onTap)
                      : Container(
                          height: 20,
                          width: 50,
                          color: Colors.red,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  fileNotLoaded({
    required BuildContext context,
    required VoidCallback? onTap,
  }) {
    return MyButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/save.svg',
            semanticsLabel: 'save',
            fit: BoxFit.contain,
          ),
          SizedBox(width: 4),
          Text(
            'Загрузить документ',
            style: myTextStyleFontS8Sans(
              context: context,
              textColor: myColorTextBlue,
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  fileDownloaded({
    required BuildContext context,
    required VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color.fromRGBO(38, 38, 38, 0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/document_done.svg',
              semanticsLabel: 'document_done',
              fit: BoxFit.contain,
            ),
            SizedBox(width: 4),
            Column(
              children: [
                Text(
                  'Договор аренды',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    textColor: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  '24.06.2022',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    textColor: Theme.of(context).textTheme.titleSmall!.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
