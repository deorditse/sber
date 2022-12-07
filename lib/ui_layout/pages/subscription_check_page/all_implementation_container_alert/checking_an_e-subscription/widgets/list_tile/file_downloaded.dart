import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/app_bar.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';

class FileDownloaded extends StatelessWidget {
  const FileDownloaded({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromRGBO(38, 38, 38, 0.1),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/document_done.svg',
                      semanticsLabel: 'document_done',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: myWithBetweenContent),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Договор аренды',
                            style: myTextStyleFontS8Sans(
                              context: context,
                              textColor:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '24.06.2022',
                            style: myTextStyleFontS8Sans(
                              context: context,
                              textColor:
                                  Theme.of(context).textTheme.titleSmall!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
