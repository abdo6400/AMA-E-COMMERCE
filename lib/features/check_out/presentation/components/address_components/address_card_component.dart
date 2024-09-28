import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:ama/features/check_out/domain/entities/address.dart';
import 'package:ama/features/check_out/presentation/bloc/cubits/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCardComponent extends StatelessWidget {
  final Address? address;

  const AddressCardComponent({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Theme.of(context).hintColor.withOpacity(0.1))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 15,
                vertical: AppValues.paddingHeight * 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.shippingAddress.tr(context),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: const Icon(Icons.edit,
                                  color: AppColors.greenDark)),
                          SizedBox(
                            width: AppValues.sizeWidth * 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.delete,
                                color: AppColors.error),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text:
                                '${AppStrings.shippingName.tr(context)}: ${address?.shippingName}, '),
                        TextSpan(
                            text:
                                '${AppStrings.fullName.tr(context)}: ${address?.fullName}, '),
                        TextSpan(
                            text:
                                '${AppStrings.shippingPhone.tr(context)}: ${address?.shippingPhone}, '),
                        TextSpan(
                            text:
                                '${AppStrings.streetName.tr(context)}: ${address?.streetName}, '),
                        TextSpan(
                            text:
                                '${AppStrings.buildingNumber.tr(context)}: ${address?.buildingNumber}, '),
                        TextSpan(
                            text:
                                '${AppStrings.houseNumber.tr(context)}: ${address?.houseNumber}, '),
                        TextSpan(
                            text:
                                '${AppStrings.cityORArea.tr(context)}: ${address?.cityOrArea}, '),
                        TextSpan(
                            text:
                                '${AppStrings.district.tr(context)}: ${address?.district}, '),
                        TextSpan(
                            text:
                                '${AppStrings.governorate.tr(context)}: ${address?.governorate}, '),
                        TextSpan(
                            text:
                                '${AppStrings.nearestLandmark.tr(context)}: ${address?.nearestLandmark}, '),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        BlocBuilder<AddressCubit, String>(
          builder: (context, state) {
            return Checkbox(
                value: state == address?.id.toString(),
                onChanged: (_) => context
                    .read<AddressCubit>()
                    .changeAddress(address?.id.toString() ?? ''));
          },
        ),
      ],
    );
  }
}
