import 'package:get/get.dart';
import 'package:petugas_perpustakaan_c/app/modules/add_book/controllers/add_book_controller.dart';

import '../controllers/add_book_controller.dart';

class AddBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPeminjamanController>(
      () => AddPeminjamanController(),
    );
  }
}
