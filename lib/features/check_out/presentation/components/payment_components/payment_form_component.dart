import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/alerts_extensions.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../cart/presentation/bloc/cart_bloc.dart';

class PaymentFormComponent extends StatefulWidget {
  final String paymentUrl;
  const PaymentFormComponent({super.key, required this.paymentUrl});

  @override
  State<PaymentFormComponent> createState() => _PaymentFormComponentState();
}

class _PaymentFormComponentState extends State<PaymentFormComponent> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.contains('success')) {
            context.read<CartBloc>().add(ClearCartProductsEvent());
            context.showSuccessQuickAlert(
                AppStrings.success,
                () => context.navigateToFirstRoute());
            return NavigationDecision.prevent;
          } else if (request.url.contains('cancel')) {
            Navigator.pop(context);
            context.showToast(AppStrings.someThingWentWrong.tr(context),
                type: ToastType.shortToast);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Payment'),
        ),
        body: WebViewWidget(controller: controller));
  }
}
