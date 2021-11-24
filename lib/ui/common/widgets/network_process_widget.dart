import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/models/network_process.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'error_widget.dart';


class FutureProcessBuilder<T> extends StatelessWidget {
  final Future<NetworkProcess<T>> futureProcess;
  final Widget Function(T) widgetBuilder;

  const FutureProcessBuilder({
    required this.futureProcess,
    required this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NetworkProcess<T>>(
      future: futureProcess,
      builder: (context, snapshot) {
        final process = snapshot.data;
        if (process == null || process.isProcessing)
          return Center(child: CircularProgressIndicator());
        else if (process.hasError)
          return ProcessErrorWidget(process: process);
        else
          return widgetBuilder(process.data!);
      },
    );
  }
}


class NetworkProcessBuilder<T> extends StatelessWidget {
  final NetworkProcess<T>? process;
  final Widget Function(T) widgetBuilder;

  const NetworkProcessBuilder({
    required this.process,
    required this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (process == null || process!.isProcessing)
      return Center(child: CircularProgressIndicator());
    else if (process!.hasError)
      return ProcessErrorWidget(process: process!);
    else
      return widgetBuilder(process!.data!);
  }
}
class NetworkProcessWithProvider<T> extends StatelessWidget {

  final Widget Function(T) widgetBuilder;

  const NetworkProcessWithProvider({
    required this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final process = Provider.of<NetworkProcess<T>?>(context);
    if (process == null || process.isProcessing)
      return Center(child: CircularProgressIndicator());
    else if (process.hasError)
      return ProcessErrorWidget(process: process);
    else
      return widgetBuilder(process.data!);
  }
}
