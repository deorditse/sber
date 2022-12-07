import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:business_layout/business_layout.dart';

class SignatureVerificationContainer extends StatelessWidget {
  const SignatureVerificationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementControllerSubscriptionCheckPage>(
      builder: (controllerSubsCheckPage) {
        final SignatureVerificationModel? _signatureVerification =
            controllerSubsCheckPage.signatureVerification;
        return Container(
          decoration: BoxDecoration(
            color: _signatureVerification == null
                ? Colors.transparent
                : (_signatureVerification.success
                    ? Color.fromRGBO(243, 255, 246, 1)
                    : Color.fromRGBO(254, 246, 246, 1)),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: _signatureVerification == null
                  ? Theme.of(context).textTheme.bodySmall!.color!
                  : (_signatureVerification.success
                      ? Color.fromRGBO(20, 143, 43, 1)
                      : Color.fromRGBO(254, 46, 67, 1)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _signatureVerification == null
                ? const Center(
                    child: Text('Идет проверка...'),
                  )
                : Row(
                    children: [
                      SvgPicture.asset(
                        _signatureVerification.success
                            ? 'assets/icons/check.svg'
                            : 'assets/icons/close-circle.svg',
                        semanticsLabel: 'check',
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: myWithBetweenContent),
                      Text(_signatureVerification.success
                          ? 'Подпись принадлежит документу'
                          : 'Подпись не принадлежит документу'),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
