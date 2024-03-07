import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petugas_perpustakaan_c/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M-Library'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body:  Container(
        child: Center(
        child: SingleChildScrollView(
        child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Padding(
    padding: EdgeInsets.only(bottom: 10.0),
    child: Image(
    image: AssetImage('assets/mdrn.png'),
    width: 300.0,
    height: 300.0,
    ),
    ),
      SizedBox(height: 15.0), // Reduce the space between text fields
      Form(
          key: controller.formKey,
          child: Column(
        children: [
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
            controller: controller.passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,// Untuk menyembunyikan teks
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
        ],
      )),

              SizedBox(height: 20.0),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: (){
                    controller.login();
                    },
                  child: Text("Login"))),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.REGISTER),
                child: Text(
                  "Registrasi",
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
             ],
          ),
      ),
    ),
          ),
      ),
    );
  }
}
