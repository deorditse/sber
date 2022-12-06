import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/style_app/lib/style_app.dart';

class MyContainerAlertWidget extends StatelessWidget {
  const MyContainerAlertWidget({
    Key? key,
    required this.childBody,
    required this.title,
    this.borderRadius,
    this.color,
    this.isCircular = false,
    this.maxWithContainer,
    this.minWithContainer,
    this.maxHeightContainer,
    this.minHeightContainer,
  }) : super(key: key);
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
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              return Container(
                constraints: BoxConstraints(
                  maxWidth: maxWithContainer ?? constrains.constrainWidth() / 3,
                  minWidth: minWithContainer ?? constrains.constrainWidth() / 5,
                  maxHeight: maxHeightContainer ?? constrains.maxHeight,
                  minHeight: minHeightContainer ?? constrains.minHeight,
                ),
                decoration: BoxDecoration(
                  color: color ?? Theme.of(context).cardColor,
                  borderRadius: borderRadius != null
                      ? BorderRadius.circular(borderRadius!)
                      : BorderRadius.circular(isCircular ? 100 : 15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: myTextStyleFontS8Sans(context: context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      mySizedHeightBetweenContainer,
                      childBody,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
