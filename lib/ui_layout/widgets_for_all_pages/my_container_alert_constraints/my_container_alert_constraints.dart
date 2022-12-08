import 'package:flutter/material.dart';
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
    this.withContainer,
    this.heightContainer,
    this.isErrorResponseStatus = false,
  }) : super(key: key);
  final VoidCallback? backCallback;
  final String title;
  final Widget childBody;
  final Color? color;
  final double? borderRadius;
  final double? withContainer;
  final double? heightContainer;
  final bool isErrorResponseStatus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  clipBehavior: Clip.none,
                  width: withContainer ?? 400,
                  height: heightContainer ?? null,
                  decoration: BoxDecoration(
                    color: color ?? Theme.of(context).cardColor,
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(38, 38, 38, 0.1),
                    ),
                    borderRadius: borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : BorderRadius.circular(16),
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
                            Align(
                              alignment: isErrorResponseStatus
                                  ? Alignment.centerLeft
                                  : Alignment.center,
                              child: Text(
                                title,
                                style: myTextStyleFontS8Sans(
                                  context: context,
                                  newFontWeight: isErrorResponseStatus
                                      ? FontWeight.w900
                                      : null,
                                  textColor: isErrorResponseStatus
                                      ? myColorTextBlue
                                      : null,
                                  fontSize: isErrorResponseStatus ? 90 : 19,
                                ),
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
                            clipBehavior: Clip.none,
                            elevation: 6,
                            backgroundColor: Theme.of(context).cardColor,
                            mini: true,
                            onPressed: backCallback,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color!,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
