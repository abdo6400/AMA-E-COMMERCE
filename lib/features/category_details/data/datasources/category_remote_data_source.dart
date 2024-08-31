import '../models/category_details_model.dart';
import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoryDetailsModel> getCategoryDetails(int id);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiConsumer apiConsumer;

  CategoryRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<CategoryDetailsModel> getCategoryDetails(int id) async {
    final response = await apiConsumer.get('${EndPoints.categories}/$id');
    return CategoryDetailsModel.fromJson(response);
  }
}
