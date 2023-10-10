import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/constants/icons.dart';
import 'package:task/controllers/meal_plan.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import 'food_tile.dart';

class MealCard extends StatelessWidget {
  const MealCard(
      {super.key,
      required this.title,
      required this.icons,
      required this.indexx});

  final String title, icons;
  final int indexx;

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<MealPlanCont>();
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: SizeConfig.widthMultiplier * 92,
            margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * .35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.widthMultiplier * 15,
                      height: SizeConfig.heightMultiplier * 7,
                      margin: EdgeInsets.only(
                        top: SizeConfig.heightMultiplier * 1,
                        bottom: SizeConfig.heightMultiplier * 1,
                        left: SizeConfig.heightMultiplier * 1,
                        right: SizeConfig.heightMultiplier * 1.5,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.primaryColor),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        icons,
                        color: AppColors.secondaryColor,
                        height: SizeConfig.imageSizeMultiplier * 6,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Spacing.y(.5),
                          cont.foodList[indexx].isEmpty
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.widthMultiplier * 3,
                                      vertical:
                                          SizeConfig.heightMultiplier * .2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffA9A4A0),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    "No Products",
                                    style: textTheme.displaySmall!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : cont.isEdit[indexx].value
                                  ? GestureDetector(
                                      onTap: () {
                                        cont.toggleIsEdit(indexx);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.widthMultiplier * 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: AppColors.successColor),
                                        ),
                                        child: Text(
                                          "Save",
                                          style: textTheme.displaySmall!
                                              .copyWith(
                                                  color:
                                                      AppColors.successColor),
                                        ),
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            cont.toggleIsEdit(indexx);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    SizeConfig.widthMultiplier *
                                                        3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                color: const Color(0xff60554B),
                                              ),
                                            ),
                                            child: Text(
                                              "Edit",
                                              style: textTheme.displaySmall!
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff60554B)),
                                            ),
                                          ),
                                        ),
                                        Spacing.x(2),
                                        SvgPicture.asset(
                                          AppIcons.bookmark,
                                          height:
                                              SizeConfig.imageSizeMultiplier *
                                                  6,
                                          color: AppColors.secondaryColor,
                                        )
                                      ],
                                    ),
                        ],
                      ),
                    ),
                  ],
                ),
                cont.foodList[indexx].isEmpty
                    ? const SizedBox()
                    : Container(
                        width: SizeConfig.widthMultiplier * 88,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 3),
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.heightMultiplier * 1,
                            left: SizeConfig.widthMultiplier * 1,
                            right: SizeConfig.widthMultiplier * 1),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(6),
                            bottom: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            ...List.generate(
                              cont.foodList[indexx].length,
                              (index) => FoodDetailTile(
                                title: cont.foodList[indexx][index].name,
                                calories: cont.foodList[indexx][index].calories,
                                indexx: indexx,
                                onTap: () {
                                  cont.removeFoodItem(
                                      cont.foodList[indexx][index], indexx);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.heightMultiplier * 2),
                              child: Row(
                                children: [
                                  Text(
                                    "Total",
                                    style: textTheme.bodyMedium!.copyWith(
                                        color: AppColors.successColor),
                                  ),
                                  const Spacer(),
                                  Obx(
                                    () => Text(
                                      "${cont.totalCalories[indexx].value} Cals",
                                      style: textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.successColor),
                                    ),
                                  ),
                                  Spacing.x(3),
                                  SizedBox(
                                    width: SizeConfig.widthMultiplier * 5,
                                    height: SizeConfig.heightMultiplier * 2,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                cont.addFoodItem(indexx);
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16.0),
                    topLeft: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0),
                    bottomLeft: Radius.circular(6.0),
                  ),
                  border: Border.all(color: const Color(0xffF2EEE5)),
                ),
                child: Container(
                  height: SizeConfig.heightMultiplier * 7,
                  width: SizeConfig.widthMultiplier * 13,
                  decoration: const BoxDecoration(
                    color: Color(0xff2F2A24),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0),
                      bottomLeft: Radius.circular(6.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
