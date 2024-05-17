import 'dart:convert';

import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rental_car/application/routes/routes.dart';
import 'package:rental_car/application/utils/assets_utils.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/application/utils/format_utils.dart';
import 'package:rental_car/data/dtos/car_detail_dto.dart';
import 'package:rental_car/presentation/views/car_detail/notifier/car_detail_notifier.dart';

class HeaderCarDetailWidget extends StatelessWidget {
  const HeaderCarDetailWidget({
    super.key,
    required this.carDetail,
    this.distance,
    this.latCar,
    this.longCar,
    required this.carDetailNotifier,
  });

  final CarDetailDTO carDetail;
  final double? latCar;
  final double? longCar;
  final double? distance;
  final CarDetailNotifier carDetailNotifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedMemoryImage(
          width: 360.w,
          height: 200.h,
          uniqueKey: carDetail.imagesCar,
          fit: BoxFit.cover,
          bytes: const Base64Decoder().convert(carDetail.imagesCar),
        ),
        Positioned(
          top: 30,
          left: 15,
          child: IconButton(
            onPressed: () => Routes.goToPreviousView(context),
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorUtils.whiteColor,
            ),
          ),
        ),
        latCar != 0.0
            ? Positioned(
                top: 40,
                right: 10,
                child: GestureDetector(
                  onTap: () async => await carDetailNotifier.launchMap(
                      latCar: latCar ?? 10.0, longCar: longCar ?? 10.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: ColorUtils.whiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          FormatUtils.formatDistance(distance ?? 0),
                        ),
                        SvgPicture.asset(
                          AssetUtils.icDirect,
                          colorFilter: ColorFilter.mode(
                            ColorUtils.primaryColor,
                            BlendMode.srcIn,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
