import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../bloc/offers_bloc/offers_bloc.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.bestOffers.tr(context)),
        elevation: 1,
      ),
      body: BlocProvider.value(
        value: ModalRoute.of(context)?.settings.arguments as OffersBloc,
        child: Container(),
      ),
    );
  }
}
