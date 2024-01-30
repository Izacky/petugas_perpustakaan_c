import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petugas_perpustakaan_c/app/data/constant/endpoint.dart';
import 'package:petugas_perpustakaan_c/app/data/provider/api_provider.dart';
import 'package:petugas_perpustakaan_c/app/data/provider/storage_provider.dart';
import 'package:petugas_perpustakaan_c/app/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;

class AddBookController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();

  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  add() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.book,
            data: {
                  "judul": judulController.text.toString(),
                  "penulis": penulisController.text.toString(),
                  "penerbit": penerbitController.text.toString(),
                  "tahun_terbit": int.parse(tahunTerbitController.text.toString()),
                });
        if (response.statusCode == 201) {
          await StorageProvider.write(StorageKey.status, "logged");
          Get.back();
        } else {
          Get.snackbar(
              "Sorry", "Login Gagal !", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
