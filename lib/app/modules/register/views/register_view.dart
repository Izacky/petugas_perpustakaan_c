import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petugas_perpustakaan_c/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/mdrn.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 5.0),// Reduce the space between logo and text fields
                TextFormField(
                  controller: controller.namaController,
                  decoration: InputDecoration(
                    hintText: "Masukan Nama",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    hintText: "Masukan Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.telpController,
                  decoration: InputDecoration(
                    hintText: "Masukan Telepon",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Telepon tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.alamatController,
                  decoration: InputDecoration(
                    hintText: "Masukan Alamat",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Alamat tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0), // Reduce the space between text fields
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    hintText: "Masukan Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => controller.loading.value
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : InkWell(
                      onTap: () {
                        controller.register();
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFF58634), Color(0xFFFED3237)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hammersmith',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sudah punya akun?",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Hammersmith'
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontFamily: 'Hammersmith',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),

          ),
    bottomNavigationBar: BottomAppBar(
    color: Color(0xFF100000),
    child: Container(
    height: 50,
    child: Center(
    child: GestureDetector(
    onTap: () {
    },
    child: Text(
    'Copyright ©Fahtiar\'Izacky 2k24',
    style: TextStyle(
    color: Colors.white,
    fontFamily: 'Hammersmith',
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    ),
    ),
    );
  }
}
