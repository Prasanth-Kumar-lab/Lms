import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';

import '../controllers/signup_controller.dart';
import '../model/signup_model.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    // TEXT CONTROLLERS
    final roleCtrl = TextEditingController(text: "Student");
    final firstNameCtrl = TextEditingController();
    final lastNameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final schoolIdCtrl = TextEditingController();
    final dobCtrl = TextEditingController();
    final genderCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final pincodeCtrl = TextEditingController();
    final admissionCtrl = TextEditingController();
    final classIdCtrl = TextEditingController();
    final sectionIdCtrl = TextEditingController();
    final rollCtrl = TextEditingController();
    final guardianNameCtrl = TextEditingController();
    final guardianPhoneCtrl = TextEditingController();
    final academicYearCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final confirmPassCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(backgroundColor:Colors.blue.shade50 ,),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 20),
              /*Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () => Get.back(),
                ),
              ),*/
              // PROFILE IMAGE
              Obx(() {
                return Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: controller.profileImage.value == null
                            ? Lottie.asset(
                          'assets/student with laptop.json',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                            : Image.file(
                          controller.profileImage.value!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: controller.pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              }),

              const SizedBox(height: 20),

              // ROLE
              CustomTextField(
                controller: roleCtrl,
                label: "Role",
                icon: Icons.person,
                readOnly: true,
              ),

              const SizedBox(height: 10),

              // PERSONAL DETAILS
              ExpansionTile(
                title: const Text(
                  "Personal Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  CustomTextField(
                      controller: firstNameCtrl,
                      label: "First Name",
                      icon: Icons.person_outline),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: lastNameCtrl,
                      label: "Last Name",
                      icon: Icons.person_outline),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: dobCtrl,
                      label: "Date of Birth",
                      icon: Icons.cake_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: genderCtrl,
                      label: "Gender",
                      icon: Icons.transgender),
                ],
              ),

              const SizedBox(height: 10),

              // GUARDIAN DETAILS
              ExpansionTile(
                title: const Text(
                  "Guardian Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  CustomTextField(
                      controller: guardianNameCtrl,
                      label: "Guardian Name",
                      icon: Icons.person_pin_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: guardianPhoneCtrl,
                      label: "Guardian Phone",
                      icon: Icons.phone_android),
                ],
              ),

              const SizedBox(height: 10),

              // CONTACT DETAILS
              ExpansionTile(
                title: const Text(
                  "Contact Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  CustomTextField(
                      controller: emailCtrl,
                      label: "Email",
                      icon: Icons.email_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: phoneCtrl,
                      label: "Phone",
                      icon: Icons.phone),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: addressCtrl,
                      label: "Address",
                      icon: Icons.home_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: pincodeCtrl,
                      label: "Pincode",
                      icon: Icons.pin_drop_outlined),
                ],
              ),

              const SizedBox(height: 10),

              // ACADEMIC DETAILS
              ExpansionTile(
                title: const Text(
                  "Academic Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  CustomTextField(
                      controller: schoolIdCtrl,
                      label: "School ID",
                      icon: Icons.school_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: admissionCtrl,
                      label: "Admission Number",
                      icon: Icons.confirmation_number_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: classIdCtrl,
                      label: "Class ID",
                      icon: Icons.class_),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: sectionIdCtrl,
                      label: "Section ID",
                      icon: Icons.view_column_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: rollCtrl,
                      label: "Roll Number",
                      icon: Icons.format_list_numbered),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: academicYearCtrl,
                      label: "Academic Year",
                      icon: Icons.date_range),
                ],
              ),

              const SizedBox(height: 10),

              // SECURITY
              ExpansionTile(
                title: const Text(
                  "Security",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  CustomTextField(
                      controller: passwordCtrl,
                      label: "Password",
                      icon: Icons.lock_outline,
                      obscure: true),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: confirmPassCtrl,
                      label: "Confirm Password",
                      icon: Icons.lock_outline,
                      obscure: true),
                ],
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue.shade700,
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    final student = StudentModel(
                      role: roleCtrl.text,
                      firstName: firstNameCtrl.text,
                      lastName: lastNameCtrl.text,
                      email: emailCtrl.text,
                      phone: phoneCtrl.text,
                      password: passwordCtrl.text,
                      schoolId: schoolIdCtrl.text,
                      dateOfBirth: dobCtrl.text,
                      gender: genderCtrl.text,
                      address: addressCtrl.text,
                      pincode: pincodeCtrl.text,
                      admissionNumber: admissionCtrl.text,
                      classId: classIdCtrl.text,
                      sectionId: sectionIdCtrl.text,
                      rollNumber: rollCtrl.text,
                      guardianName: guardianNameCtrl.text,
                      guardianPhone: guardianPhoneCtrl.text,
                      academicYear: academicYearCtrl.text,
                    );
                    controller.signUpStudent(student);
                  },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
