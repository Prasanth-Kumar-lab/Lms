import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/faculty_role_controller.dart';
import '../model/faculty_role_model.dart';
import '../widgets/custom_textfield.dart';

class FacultySignUpScreen extends StatelessWidget {
  const FacultySignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FacultyRoleController controller = Get.put(FacultyRoleController());

    // TEXT CONTROLLERS
    final roleCtrl = TextEditingController(text: "Faculty");
    final firstNameCtrl = TextEditingController();
    final lastNameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final confirmPassCtrl = TextEditingController();

    final schoolIdCtrl = TextEditingController();
    final dobCtrl = TextEditingController();
    final genderCtrl = TextEditingController();

    // NEW FACULTY FIELDS
    final employeeIdCtrl = TextEditingController();
    final admissionNumCtrl = TextEditingController();
    final designationCtrl = TextEditingController();
    final departmentIdCtrl = TextEditingController();
    final joiningDateCtrl = TextEditingController();
    final qualificationCtrl = TextEditingController();
    final experienceYearsCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // PROFILE IMAGE — kept exactly as you wanted
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
                ],
              ),

              const SizedBox(height: 10),

              // FACULTY ACADEMIC DETAILS
              ExpansionTile(
                title: const Text(
                  "Faculty Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  CustomTextField(
                      controller: schoolIdCtrl,
                      label: "School ID",
                      icon: Icons.school_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: employeeIdCtrl,
                      label: "Employee ID",
                      icon: Icons.badge_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: admissionNumCtrl,
                      label: "Admission Number",
                      icon: Icons.confirmation_number_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: designationCtrl,
                      label: "Designation",
                      icon: Icons.work_outline),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: departmentIdCtrl,
                      label: "Department ID",
                      icon: Icons.apartment_outlined),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: joiningDateCtrl,
                      label: "Joining Date",
                      icon: Icons.date_range),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: qualificationCtrl,
                      label: "Qualification",
                      icon: Icons.school),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: experienceYearsCtrl,
                      label: "Experience (Years)",
                      icon: Icons.timeline),
                ],
              ),

              const SizedBox(height: 10),

              // PASSWORD
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

      /// SIGN UP BUTTON
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue.shade700,
              ),
              onPressed: controller.isLoading.value
                  ? null
                  : () {
                final faculty = FacultyModel(
                  role: roleCtrl.text,
                  firstName: firstNameCtrl.text,
                  lastName: lastNameCtrl.text,
                  email: emailCtrl.text,
                  phone: phoneCtrl.text,
                  password: passwordCtrl.text,
                  schoolId: schoolIdCtrl.text,
                  dateOfBirth: dobCtrl.text,
                  gender: genderCtrl.text,
                  employeeId: employeeIdCtrl.text,
                  admissionNumber: admissionNumCtrl.text,
                  designation: designationCtrl.text,
                  departmentId: departmentIdCtrl.text,
                  joiningDate: joiningDateCtrl.text,
                  qualification: qualificationCtrl.text,
                  experienceYears: experienceYearsCtrl.text,
                );

                controller.signUpFaculty(faculty);
              },
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            );
          }),
        ),
      ),
    );
  }
}
