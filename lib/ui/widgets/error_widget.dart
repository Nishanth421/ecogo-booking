import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'no_internet_widget.dart';


class ErrorWidgetWithRetry extends StatelessWidget {
  const ErrorWidgetWithRetry({
    super.key,
    required this.error,
    required this.retry,
  });

  final String error;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    switch (error.runtimeType) {
      case DioException:
        widget = NoInternetWidget(exception: error as DioException);
        break;
      default:
        widget = Center(
          child: Column(
            children: [
              Text(error.runtimeType.toString()),
              Text(error.toString()),
            ],
          ),
        );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error.toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(8),
          TextButton(
              onPressed: retry,
              child: Column(
                children: const [
                  Icon(Icons.replay_outlined),
                  Text("Retry"),
                ],
              )),
        ],
      ),
    );
  }
}
