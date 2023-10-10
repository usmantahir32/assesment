import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../controllers/meal_plan.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';

class FoodDetailTile extends StatelessWidget {
  const FoodDetailTile({
    super.key,
    required this.title,
    required this.calories,
    required this.onTap,
    required this.indexx,
  });
  final String title;
  final int calories;
  final VoidCallback onTap;
  final int indexx;

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<MealPlanCont>();
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
            child: Row(
              children: [
                Text(
                  title,
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.textSecondaryColor),
                ),
                const Spacer(),
                Text(
                  "$calories Cals",
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Spacing.x(3),
                cont.isEdit[indexx].value
                    ? GestureDetector(
                        onTap: onTap,
                        child: Icon(
                          Icons.cancel,
                          color: const Color(0xffE78A84),
                          size: SizeConfig.imageSizeMultiplier * 5,
                        ),
                      )
                    : Container(
                        width: SizeConfig.widthMultiplier * 5,
                        height: SizeConfig.heightMultiplier * 2,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff60554B),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: SizeConfig.imageSizeMultiplier * 3,
                        ),
                      )
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 0,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
