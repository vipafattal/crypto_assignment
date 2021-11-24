import 'package:crypto_assignment/models/network_process.dart';
import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:flutter/material.dart';

import '../colours.dart';

class ProcessErrorWidget extends StatelessWidget {
  final NetworkProcess process;
  final void Function()? onRetry;

  const ProcessErrorWidget({
    required this.process,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    print(process.message);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            process.exception!.toString(),
            style: Resources.textStyles.textBody1,
          ),
          SizedBox(height: 30),
          if(onRetry != null)
          MaterialButton(
            onPressed: onRetry,
            color: Colours.colorPrimary,
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            child: Text(
              Resources.strings.retry,
              style:
                  Resources.textStyles.textBody5.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
