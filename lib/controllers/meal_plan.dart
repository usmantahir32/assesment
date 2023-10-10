import 'package:get/get.dart';
import 'package:task/models/food.dart';

class MealPlanCont extends GetxController {
  RxBool isFavourite = false.obs;
  RxList<FoodItemModel> foodModelList1 = <FoodItemModel>[].obs;
  RxList<FoodItemModel> foodModelList2 = <FoodItemModel>[].obs;
  RxList<FoodItemModel> foodModelList3 = <FoodItemModel>[].obs;
  RxList<FoodItemModel> foodModelList4 = <FoodItemModel>[].obs;
  RxList<FoodItemModel> foodModelList5 = <FoodItemModel>[].obs;
  RxList<FoodItemModel> foodModelList6 = <FoodItemModel>[].obs;
  List<RxList<FoodItemModel>> foodList = <RxList<FoodItemModel>>[];
  List<RxList<FoodItemModel>> availableFoodItems = <RxList<FoodItemModel>>[];

  List<RxBool> isEdit = <RxBool>[];
  List<RxInt> currintIndex = <RxInt>[];
  List<RxInt> totalCalories = <RxInt>[];

  @override
  void onInit() {
    creating();
    super.onInit();
  }

  creating() {
    foodList.addAll([
      foodModelList1,
      foodModelList2,
      foodModelList3,
      foodModelList4,
      foodModelList5,
      foodModelList6
    ]);
    currintIndex.addAll([0.obs, 0.obs, 0.obs, 0.obs, 0.obs, 0.obs]);
    totalCalories.addAll([0.obs, 0.obs, 0.obs, 0.obs, 0.obs, 0.obs]);

    isEdit.addAll(
        [false.obs, false.obs, false.obs, false.obs, false.obs, false.obs]);
    for (int i = 0; i < 6; i++) {
      availableFoodItems.add(RxList<FoodItemModel>(foodItems));
    }
  }

  void addFoodItem(int idx) {
    if (availableFoodItems[idx].isNotEmpty) {
      FoodItemModel itemToAdd = availableFoodItems[idx].first;
      foodList[idx].add(itemToAdd);
      availableFoodItems[idx].removeAt(0);
      calculateTotalCalories(idx);
    }
  }

  void removeFoodItem(FoodItemModel item, int idx) {
    foodList[idx].remove(item);
    availableFoodItems[idx].add(item);
    calculateTotalCalories(idx);
  }

  void calculateTotalCalories(int idx) {
    int total = 0;
    for (var food in foodList[idx]) {
      total += food.calories;
    }

    totalCalories[idx].value = total;
  }

  void toggleIsEdit(int idx) {
    isEdit[idx].value = !isEdit[idx].value;
  }
}
