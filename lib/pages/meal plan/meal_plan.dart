import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/icons.dart';
import 'package:task/controllers/meal_plan.dart';
import 'package:task/utils/size_config.dart';
import 'components/meal_card.dart';

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(MealPlanCont());
    final textTheme = Theme.of(context).textTheme;
    List<String> titles = [
      "Meal One",
      "Meal Two",
      "Meal Three",
      "Meal Four",
      "Meal Five",
      "Meal Six"
    ];
    List<String> icons = [
      AppIcons.copy,
      AppIcons.sun,
      AppIcons.sunFade,
      AppIcons.moon,
      AppIcons.moonStar,
      AppIcons.moonHalf,
    ];

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Meals",
            style:
                textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              onPressed: () {
                cont.isFavourite.value = !cont.isFavourite.value;
              },
              icon: SvgPicture.asset(
                cont.isFavourite.value
                    ? AppIcons.heartFilled
                    : AppIcons.heartoutlined,
                height: SizeConfig.imageSizeMultiplier * 6,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                color: AppColors.secondaryColor,
                size: SizeConfig.imageSizeMultiplier * 6.5,
              ),
            )
          ],
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: titles.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.widthMultiplier * 4,
                        right: SizeConfig.widthMultiplier * 3.4,
                        top: SizeConfig.heightMultiplier * .1),
                    child: MealCard(
                      title: titles[index],
                      icons: icons[index],
                      indexx: index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
