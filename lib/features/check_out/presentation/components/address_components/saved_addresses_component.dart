import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/features/check_out/presentation/bloc/blocs/address_bloc/address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/default_components/default_error_message.dart';
import '../../../../../core/components/default_components/default_message_card.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import 'address_card_component.dart';

class SavedAddressesComponent extends StatelessWidget {
  const SavedAddressesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state.hasError && !state.hasData) {
            return DefaultErrorMessage(
              message: state.message,
            );
          }
          if (state.hasData && state.addresses.isEmpty) {
            return const DefaultMessageCard(
              icon: Icons.location_history,
              title: AppStrings.addNewAddress,
              subTitle: AppStrings.addYourFirstAddress,
            );
          }

          return DefaultSimmerLoading(
            loading: state.isLoading,
            child: ListView.separated(
                padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
                separatorBuilder: (context, index) => SizedBox(
                      height: AppValues.sizeHeight * 10,
                    ),
                itemCount: state.hasData ? state.addresses.length : 3,
                itemBuilder: (context, index) {
                  return AddressCardComponent(
                    address: state.hasData ? state.addresses[index] : null,
                  );
                }),
          );
        },
      ),
    );
  }
}
