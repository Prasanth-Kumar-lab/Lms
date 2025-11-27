class FacultyModel {
  final String role;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String schoolId;
  final String dateOfBirth;
  final String gender;

  // NEW FIELDS
  final String employeeId;
  final String admissionNumber;
  final String designation;
  final String departmentId;
  final String joiningDate;
  final String qualification;
  final String experienceYears;

  final String? profileImageUrl;

  FacultyModel({
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.schoolId,
    required this.dateOfBirth,
    required this.gender,
    required this.employeeId,
    required this.admissionNumber,
    required this.designation,
    required this.departmentId,
    required this.joiningDate,
    required this.qualification,
    required this.experienceYears,
    this.profileImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "role": role,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "password": password,
      "school_id": schoolId,
      "date_of_birth": dateOfBirth,
      "gender": gender,

      // NEW FACULTY FIELDS
      "employee_id": employeeId,
      "admission_number": admissionNumber,
      "designation": designation,
      "department_id": departmentId,
      "joining_date": joiningDate,
      "qualification": qualification,
      "experience_years": experienceYears,

      "profile_image": profileImageUrl ?? "",
    };
  }
}
