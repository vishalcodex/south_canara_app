import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/category_model.dart';
import '../providers/api_provider.dart';

class CategoryRepository {
  late ApiProvider apiProvider;

  CategoryRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchCategories() async {
    return await apiProvider
        .makeAPICall("GET", "categories", {}).then((value) async {
      if (value.status == Status.COMPLETED) {
        List<Category> categories = (value.data["categories"] as List).map((e) {
          return Category.fromJson(e);
        }).toList();
        value.data = categories;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchSubCategories(Category category) async {
    return await apiProvider
        // .makeAPICall("POST", "blogs", category.toJson())
        .makeAPICall("GET", "subcategories/${category.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["subcategories"] as List)
            .map((e) => Subcategory.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }
}
