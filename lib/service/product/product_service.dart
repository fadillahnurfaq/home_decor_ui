import 'package:dartz/dartz.dart';
import 'package:home_decor/model/product/product_model.dart';

import '../../model/api_exception.dart';
import '../../model/response_model.dart';
import '../../utils/utils.dart';

class ProductService {
  Future<Either<ApiException, List<ProductModel>>> getAll() async {
    try {
      final response = await HttpService.request(endpoint: "products");
      return response.fold(
        (l) => Left(l),
        (r) => Right(
          ResponseModel<List<ProductModel>>.fromJson(
                r,
                (data) => data is List
                    ? (data).map((item) => ProductModel.fromJson(item)).toList()
                    : [],
              ).data ??
              [],
        ),
      );
    } catch (e) {
      return Left(
        ApiException(
          statusCode: null,
          message: "Terjadi kesalahan pada aplikasi, silakan coba lagi nanti.",
        ),
      );
    }
  }
}
