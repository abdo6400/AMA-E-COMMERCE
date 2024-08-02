import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/cubits/color_cubit/color_cubit.dart';

class ColorsComponent extends StatelessWidget {
  final List<String> colors;
  const ColorsComponent({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorCubit(AppColors.hexToColor(colors.first)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.colors.tr(context),
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: AppValues.sizeHeight * 10,
          ),
          BlocBuilder<ColorCubit, Color>(
            builder: (context, state) {
              return Wrap(
                spacing: AppValues.paddingWidth * 10,
                children: List<Widget>.generate(
                  colors.length,
                  (index) => InkWell(
                    onTap: () => context.read<ColorCubit>().changeColor(
                        AppColors.hexToColor(colors[index]) // change color
                        ),
                    child: Chip(
                        side: BorderSide(
                            width: 2,
                            color: AppColors.hexToColor(colors[index]) == state
                                ? Theme.of(context).textTheme.bodyLarge!.color!
                                : Colors.transparent),
                        padding: EdgeInsets.symmetric(
                            vertical: AppValues.paddingHeight * 5,
                            horizontal: AppValues.paddingWidth * 15),
                        backgroundColor: WidgetStateColor.resolveWith(
                            (_) => AppColors.hexToColor(colors[index])),
                        label: const Text("")),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
