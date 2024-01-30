import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(key: controller.formKey, child: Column(
            children: [
              TextFormFiel
              d(
                controller: controller.judulController,
                decoration: InputDecoration(hintText: "Judul Buku"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Judul tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.penulisController,
                decoration: InputDecoration(hintText: "Penulis"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Penulis tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.penerbitController,
                decoration: InputDecoration(hintText: "Penerbit"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Penulis tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.tahunTerbitController,
                decoration: InputDecoration(hintText: "Tahun terbit buku"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Penulis tidak boleh kosong";
                  }
                  return null;
                },
              ),

              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(onPressed: () {
                controller.add();
              }, child: Text("Tambah buku")))
            ],
          ))
      ),
    );
  }
}
