import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/cubits/size_cubit/size_cubit.dart';

class SizesComponent extends StatelessWidget {
  final List<String> sizes;
  const SizesComponent({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.sizes.tr(context),
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: AppValues.sizeHeight * 10,
        ),
        BlocBuilder<SizeCubit, String>(
          builder: (context, state) {
            return Wrap(
              spacing: AppValues.paddingWidth * 10,
              children: List<Widget>.generate(
                sizes.length,
                (index) => InkWell(
                  onTap: () =>
                      context.read<SizeCubit>().changeSize(sizes[index]),
                  child: Chip(
                      color: WidgetStateColor.resolveWith((_) =>
                          sizes[index] == state
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor),
                      label: Text(
                        sizes[index],
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color:
                                sizes[index] == state ? AppColors.white : null),
                      )),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
