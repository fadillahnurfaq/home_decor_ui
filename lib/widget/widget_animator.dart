import 'package:flutter/material.dart';
import '../utils/utils.dart';
import 'widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class ErrorWidget extends StatelessWidget {
  final String message;
  final Color? iconColor, textColor;
  const ErrorWidget({
    super.key,
    required this.message,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 35.0, color: iconColor ?? AppColors.salmon),
          const SpaceHeight(10.0),
          AppText(
            text: message,
            align: TextAlign.center,
            textStyle: AppTextStyle.regularStyle.copyWith(
              color: textColor ?? AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.salmon),
    );
  }
}

class WidgetAnimator<T> extends StatelessWidget {
  final RequestState requestState;
  final Widget loadingWidget;
  final Widget Function(T? result) successWidget;
  final Widget Function(String message)? errorWidget;
  final Widget emptyWidget;
  final Widget initialWidget;
  final Color? iconColor, textColor;

  const WidgetAnimator({
    super.key,
    required this.requestState,
    required this.successWidget,
    this.loadingWidget = const LoadingWidget(),
    this.errorWidget,
    this.emptyWidget = const EmptyWidget(),
    this.initialWidget = const SizedBox(),
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return _getChild();
  }

  _getChild() {
    if (requestState is RequestStateLoaded) {
      final result = (requestState as RequestStateLoaded<T>).result;
      return successWidget(result);
    } else if (requestState is RequestStateError) {
      final message = (requestState as RequestStateError).message;
      if (errorWidget != null) {
        return errorWidget!(message);
      } else {
        return ErrorWidget(
          message: message,
          iconColor: iconColor,
          textColor: textColor,
        );
      }
    } else if (requestState is RequestStateInitial) {
      return initialWidget;
    } else if (requestState is RequestStateEmpty) {
      return emptyWidget;
    } else if (requestState is RequestStateLoading) {
      return loadingWidget;
    } else {
      return const SizedBox();
    }
  }
}
