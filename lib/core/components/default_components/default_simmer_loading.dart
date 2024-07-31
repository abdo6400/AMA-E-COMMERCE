import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/app_enums.dart';
import '../../utils/app_values.dart';

class DefaultSimmerLoading extends StatelessWidget {
  final SimmerLoadingType type;
  final double? height;
  final double? width;
  final Axis? scrollDirection;
  const DefaultSimmerLoading(
      {super.key,
      required this.type,
      this.height,
      this.width,
      this.scrollDirection});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case SimmerLoadingType.detailsScreen:
        return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height ?? AppValues.sizeHeight * 200,
                      width: width ?? AppValues.screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 20),
                      ),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 10,
                    ),
                    const Divider(),
                    SizedBox(
                      height: AppValues.sizeHeight * 10,
                    ),
                    Container(
                      height: (AppValues.sizeHeight * 80),
                      width: AppValues.screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 20),
                      ),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 10,
                    ),
                    Container(
                      height: (AppValues.sizeHeight * 90),
                      width: AppValues.screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 20),
                      ),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 10,
                    ),
                    Container(
                      height: (AppValues.sizeHeight * 90),
                      width: AppValues.screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 20),
                      ),
                    ),
                    SizedBox(
                      height: AppValues.sizeHeight * 10,
                    ),
                    Container(
                      height: height ?? AppValues.sizeHeight * 100,
                      width: width ?? AppValues.screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 20),
                      ),
                    ),
                  ]),
            ));
      case SimmerLoadingType.list:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListView.separated(
            itemCount: 10,
            padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
            separatorBuilder: (context, index) => SizedBox(
              height: AppValues.sizeHeight * 10,
            ),
            scrollDirection: scrollDirection ?? Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(AppValues.paddingWidth),
              child: Container(
                height: height ?? AppValues.sizeHeight * 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppValues.radius * 20),
                ),
              ),
            ),
          ),
        );
      case SimmerLoadingType.grid:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: scrollDirection ?? Axis.horizontal,
            padding: EdgeInsets.only(
              left: AppValues.paddingWidth * 10,
              right: AppValues.paddingWidth * 10,
              bottom: AppValues.paddingHeight * 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: AppValues.sizeHeight * 10,
              crossAxisSpacing: AppValues.sizeWidth * 10,
              crossAxisCount: 2,
              mainAxisExtent: AppValues.sizeHeight * 160,
            ),
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppValues.radius * 20)),
            ),
          ),
        );
      case SimmerLoadingType.card:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Center(
            child: Card(
              elevation: 0,
              margin: EdgeInsets.all(AppValues.marginWidth),
              child: SizedBox(
                width: width ?? double.infinity,
                height: height ?? AppValues.sizeHeight * 100,
              ),
            ),
          ),
        );
      case SimmerLoadingType.text:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: AppValues.sizeWidth * 10,
            height: AppValues.sizeHeight * 2,
            color: Colors.white,
          ),
        );
      case SimmerLoadingType.circle:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: AppValues.sizeWidth * 50,
            height: AppValues.sizeHeight * 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        );
      case SimmerLoadingType.circleText:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppValues.sizeWidth * 80,
                height: AppValues.sizeHeight * 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: AppValues.paddingHeight),
              Container(
                width: AppValues.sizeWidth * 60,
                height: AppValues.sizeHeight * 2,
                color: Colors.white,
              ),
            ],
          ),
        );
      case SimmerLoadingType.listOfCircles:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListView.separated(
            itemCount: 10,
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
            separatorBuilder: (context, index) => SizedBox(
              width: AppValues.sizeWidth * 15,
            ),
            scrollDirection: scrollDirection ?? Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(AppValues.paddingWidth),
              child: Container(
                width: AppValues.sizeWidth * 80,
                height: AppValues.sizeHeight * 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      case SimmerLoadingType.listOfCard:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListView.separated(
            itemCount: 10,
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
            separatorBuilder: (context, index) => SizedBox(
              width: AppValues.sizeWidth * 15,
            ),
            scrollDirection: scrollDirection ?? Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(AppValues.paddingWidth),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.all(AppValues.marginWidth),
                child: SizedBox(
                  width: width ?? double.infinity,
                  height: height ?? AppValues.sizeHeight * 20,
                ),
              ),
            ),
          ),
        );
      case SimmerLoadingType.listOfText:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SizedBox(
            height: height ?? AppValues.sizeHeight * 150,
            width: width ?? AppValues.screenWidth,
            child: ListView.separated(
              itemCount: 10,
              padding:
                  EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
              separatorBuilder: (context, index) => SizedBox(
                width: AppValues.sizeWidth * 15,
              ),
              scrollDirection: scrollDirection ?? Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(AppValues.paddingWidth),
                child: Container(
                  width: AppValues.sizeWidth * 10,
                  height: AppValues.sizeHeight * 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      case SimmerLoadingType.listOfCircleText:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: scrollDirection ?? Axis.horizontal,
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
            separatorBuilder: (context, index) => SizedBox(
              width: AppValues.sizeWidth * 15,
            ),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(AppValues.paddingWidth),
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: AppValues.sizeWidth * 80,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(height: AppValues.paddingHeight),
                  Expanded(
                    child: Container(
                      width: AppValues.sizeWidth * 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
