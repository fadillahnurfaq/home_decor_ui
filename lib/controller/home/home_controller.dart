import 'package:get/get.dart';
import 'package:home_decor/service/product/product_service.dart';
import 'package:home_decor/utils/utils.dart';

import '../../model/product/product_model.dart';

class HomeController extends GetxController {
  final ProductService productService;

  HomeController({required this.productService});

  RxInt caregorieIndex = 0.obs;

  Rx<RequestState<List<ProductModel>>> productState = Rx(RequestStateInitial());

  void setCategorieIndex(int index) {
    caregorieIndex.value = index;
    caregorieIndex.refresh();
  }

  Future<void> getAllProduct() async {
    productState.value = RequestStateLoading();
    productState.refresh();

    final result = await productService.getAll();
    result.fold(
      (l) => productState.value = RequestStateError(message: l.message),
      (r) {
        productState.value = r.isEmpty
            ? RequestStateEmpty()
            : RequestStateLoaded(result: r);
      },
    );
    productState.refresh();
  }
}
