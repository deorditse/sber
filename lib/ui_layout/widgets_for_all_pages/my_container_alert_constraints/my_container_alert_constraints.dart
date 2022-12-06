import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';

class MyContainerAlertWidget extends StatelessWidget {
  const MyContainerAlertWidget({
    Key? key,
    required this.childBody,
    required this.title,
    this.backCallback,
    this.borderRadius,
    this.color,
    this.isCircular = false,
    this.maxWithContainer,
    this.minWithContainer,
    this.maxHeightContainer,
    this.minHeightContainer,
  }) : super(key: key);
  final VoidCallback? backCallback;
  final String title;
  final Widget childBody;
  final bool isCircular;
  final Color? color;
  final double? borderRadius;
  final double? maxWithContainer;
  final double? minWithContainer;
  final double? maxHeightContainer;
  final double? minHeightContainer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                clipBehavior: Clip.none,
                constraints: BoxConstraints(
                  maxWidth: maxWithContainer ?? constrains.maxWidth / 3,
                  minWidth: minWithContainer ?? constrains.maxWidth / 5,
                  maxHeight: maxHeightContainer ?? constrains.maxHeight,
                  minHeight: minHeightContainer ?? constrains.minHeight,
                ),
                decoration: BoxDecoration(
                  color: color ?? Theme.of(context).cardColor,
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(38, 38, 38, 0.1),
                  ),
                  borderRadius: borderRadius != null
                      ? BorderRadius.circular(borderRadius!)
                      : BorderRadius.circular(isCircular ? 100 : 15),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              title,
                              style: myTextStyleFontS8Sans(
                                context: context,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          mySizedHeightBetweenContainer,
                          childBody,
                        ],
                      ),
                    ),
                    if (backCallback != null)
                      Positioned(
                        top: 18,
                        left: -20,
                        child: FloatingActionButton(
                          elevation: 6,
                          backgroundColor: Theme.of(context).cardColor,
                          mini: true,
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_back_ios,
                            color:
                                Theme.of(context).textTheme.titleSmall!.color!,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
