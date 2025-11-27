class StudentModel {
  final String role;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String schoolId;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String pincode;
  final String admissionNumber;
  final String classId;
  final String sectionId;
  final String rollNumber;
  final String guardianName;
  final String guardianPhone;
  final String academicYear;
  final String? profileImageUrl;

  StudentModel({
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.schoolId,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.pincode,
    required this.admissionNumber,
    required this.classId,
    required this.sectionId,
    required this.rollNumber,
    required this.guardianName,
    required this.guardianPhone,
    required this.academicYear,
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
      "address": address,
      "pincode": pincode,
      "admission_number": admissionNumber,
      "class_id": classId,
      "section_id": sectionId,
      "roll_number": rollNumber,
      "guardian_name": guardianName,
      "guardian_phone": guardianPhone,
      "academic_year": academicYear,
      "profile_image": profileImageUrl ?? "",
    };
  }
}
