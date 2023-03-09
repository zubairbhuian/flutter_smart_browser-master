import 'package:flutter/material.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/common/const/dimen_const.dart';

class CustomResponseItem extends StatelessWidget {
  final String ask, response;

  const CustomResponseItem({
    Key? key,
    required this.ask,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(
        paddingMedium,
      ),
      child: Card(
        color: colorAsh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: paddingStandard,
                top: paddingStandard,
                right: paddingStandard,
                bottom: paddingSmall,
              ),
              child: Text(
                "Ask: $ask",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: paddingStandard,
                top: paddingSmall,
                right: paddingStandard,
                bottom: paddingStandard,
              ),
              child: Text(
                "Response: $response",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
