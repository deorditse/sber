import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/adaptive_response/adaptive_widget.dart';

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
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              Widget _contentContainerWithAdaptive({double? maxWithContainer}) {
                return Container(
                  clipBehavior: Clip.none,
                  constraints: BoxConstraints(
                    maxWidth:
                        maxWithContainer ?? constrains.constrainWidth() / 2.7,
                    minWidth:
                        minWithContainer ?? constrains.constrainWidth() / 4,
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
                                  fontSize: 19,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // mySizedHeightBetweenContainer,
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
                            onPressed: backCallback,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color!,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }

              return Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AdaptiveWidget(
                      wide: _contentContainerWithAdaptive(),
                      narrow: _contentContainerWithAdaptive(
                        maxWithContainer: Get.width * 0.9,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
