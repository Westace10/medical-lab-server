class UserInfoModel {
  String? email;
  List<AppointmentModel>? appointments;
  List<TestModel>? tests;
  UserProfileModel? profile;
  List<TestResultModel>? results;

  UserInfoModel(
      {required this.email,
      this.appointments,
      this.tests,
      this.results,
      this.profile});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    email = json['user_email'] ?? "";
    appointments = json['user_appointments'] ?? [];
    tests = json['user_tests'] ?? [];
    profile = json['user_profile'] ??
        UserProfileModel(
          age: "",
          knownAilment: [],
          knownAllergies: [],
          bloodGroup: "",
          bloodPressure: "",
          phoneNumber: "",
          email: "",
          sugarLevel: "",
          name: UserNameModel(
            firstName: "",
            lastName: "",
            otherNames: [],
          ),
          genotype: "",
        ).toJson();
    results = json['user_test_results'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_email'] = email ?? "";
    data['user_appointments'] = appointments ?? [];
    data['user_tests'] = tests ?? [];
    data['user_profile'] = profile;
    data['user_test_results'] = results ?? [];
    return data;
  }
}

class AppointmentModel {
  String? dateTimeInfo;
  AssignedDoctorModel? assignedDoctor;
  String? appointDesc;
  String? appointId;

  AppointmentModel(
      {this.dateTimeInfo,
      this.assignedDoctor,
      this.appointDesc,
      this.appointId});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    dateTimeInfo = json['date_time_info'] ?? "";
    assignedDoctor = json['assigned_doctor'] ??
        AssignedDoctorModel(
                assignedDoctorDept: "",
                assignedDoctorName: "",
                assignedDoctorRole: "")
            .toJson();
    appointDesc = json['appointment_desc'] ?? "";
    appointId = json['appointment_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date_time_info'] = dateTimeInfo ?? "";
    data['assigned_doctor'] = assignedDoctor ??
        AssignedDoctorModel(
                assignedDoctorDept: "",
                assignedDoctorName: "",
                assignedDoctorRole: "")
            .toJson();
    data['appointment_desc'] = appointDesc ?? "";
    data['appointment_id'] = appointId ?? "";
    return data;
  }
}

class AssignedDoctorModel {
  String? assignedDoctorName;
  String? assignedDoctorDept;
  String? assignedDoctorRole;

  AssignedDoctorModel(
      {this.assignedDoctorDept,
      this.assignedDoctorName,
      this.assignedDoctorRole});

  AssignedDoctorModel.fromJson(Map<String, dynamic> json) {
    assignedDoctorName = json['assigned_doctor_name'] ?? "";
    assignedDoctorDept = json['assigned_doctor_dept'] ?? "";
    assignedDoctorRole = json['assigned_doctor_role'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assigned_doctor_name'] = assignedDoctorName ?? "";
    data['assigned_doctor_dept'] = assignedDoctorDept ?? "";
    data['assigned_doctor_role'] = assignedDoctorRole ?? "";
    return data;
  }
}

class TestModel {
  String? testName;
  String? testDateTime;
  String? testStatus;
  TestResultModel? testResult;
  TestLocationModel? testLocation;
  AssignedDoctorModel? testSupervisor;
  String? testId;

  TestModel({
    this.testDateTime,
    this.testId,
    this.testLocation,
    this.testName,
    this.testResult,
    this.testStatus,
    this.testSupervisor,
  });

  TestModel.fromJson(Map<String, dynamic> json) {
    testName = json['test_name'] ?? "";
    testDateTime = json['test_date_time'] ?? "";
    testStatus = json['test_status'] ?? "";
    testResult = json['test_result'] ??
        TestResultModel(testId: "", testType: "", testSample: "").toJson();
    testLocation = json['test_location'] ??
        TestLocationModel(
                testLocationId: "",
                testLocationAddress: "",
                testLocationDept: "")
            .toJson();
    testSupervisor = json['test_supervisor'] ??
        AssignedDoctorModel(
                assignedDoctorDept: "",
                assignedDoctorName: "",
                assignedDoctorRole: "")
            .toJson();
    testId = json['test_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['test_name'] = testName ?? "";
    data['test_date_time'] = testDateTime ?? "";
    data['test_status'] = testStatus ?? "";
    data['test_result'] = testResult ?? "";
    data['test_location'] = testLocation ?? "";
    data['test_supervisor'] = testSupervisor ??
        AssignedDoctorModel(
            assignedDoctorDept: "",
            assignedDoctorName: "",
            assignedDoctorRole: "");
    data['test_id'] = testId ?? "";
    return data;
  }
}

class TestResultModel {
  String? testId;
  String? testType;
  String? testSample;

  TestResultModel({this.testId, this.testSample, this.testType});

  TestResultModel.fromJson(Map<String, dynamic> json) {
    testId = json['test_id'] ?? "";
    testType = json['test_type'] ?? "";
    testSample = json['test_sample'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['test_id'] = testId;
    data['test_type'] = testType;
    data['test_sample'] = testSample;
    return data;
  }
}

class TestLocationModel {
  String? testLocationId;
  String? testLocationAddress;
  String? testLocationDept;

  TestLocationModel(
      {this.testLocationId, this.testLocationAddress, this.testLocationDept});

  TestLocationModel.fromJson(Map<String, dynamic> json) {
    testLocationId = json['test_location_id'] ?? "";
    testLocationAddress = json['test_location_address'] ?? "";
    testLocationDept = json['test_location_dept'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['test_location_id'] = testLocationId;
    data['test_location_address'] = testLocationAddress;
    data['test_location_dept'] = testLocationDept;
    return data;
  }
}

class UserProfileModel {
  String? email;
  String? phoneNumber;
  String? age;
  String? bloodGroup;
  String? genotype;
  String? bloodPressure;
  String? sugarLevel;
  UserNameModel? name;
  List<AilmentModel>? knownAilment;
  List<AllergyModel>? knownAllergies;

  UserProfileModel({
    this.email,
    this.phoneNumber,
    this.bloodPressure,
    this.age,
    this.knownAilment,
    this.knownAllergies,
    this.sugarLevel,
    this.bloodGroup,
    this.genotype,
    this.name,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['user_email'] ?? "";
    phoneNumber = json['phone_number'] ?? "";
    bloodPressure = json['blood_pressure'] ?? "";
    age = json['age'] ?? "";
    knownAilment = json['known_ailment'] ?? [];
    knownAllergies = json['known_allergies'] ?? [];
    sugarLevel = json['sugar_level'] ?? "";
    bloodGroup = json['blood_group'] ?? "";
    genotype = json['genotype'] ?? "";
    name = json['names'] ??
        UserNameModel(firstName: "", lastName: "", otherNames: []).toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_email'] = email ?? "";
    data['phone_number'] = phoneNumber ?? "";
    data['blood_pressure'] = bloodPressure ?? "";
    data['age'] = age ?? "";
    data['known_ailment'] = knownAilment ?? [];
    data['known_allergies'] = knownAllergies ?? [];
    data['sugar_level'] = sugarLevel ?? "";
    data['blood_group'] = bloodGroup ?? "";
    data['genotype'] = genotype ?? "";
    data['names'] = name ??
        UserNameModel(firstName: "", lastName: "", otherNames: []).toJson();
    return data;
  }
}

class UserNameModel {
  String? firstName;
  String? lastName;
  List<String>? otherNames;

  UserNameModel({this.firstName, this.lastName, this.otherNames});

  UserNameModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    otherNames = json['other_names'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['other_names'] = otherNames;
    return data;
  }
}

class AilmentModel {
  String? ailmentName;
  String? ailmentDesc;
  String? ailmentStatus;

  AilmentModel({this.ailmentName, this.ailmentDesc, this.ailmentStatus});

  AilmentModel.fromJson(Map<String, dynamic> json) {
    ailmentName = json['ailment_name'] ?? "";
    ailmentDesc = json['ailment_desc'] ?? "";
    ailmentStatus = json['ailment_status'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ailment_name'] = ailmentName;
    data['ailment_desc'] = ailmentDesc;
    data['ailment_status'] = ailmentStatus;
    return data;
  }
}

class AllergyModel {
  String? allergyName;
  String? allergyDesc;
  String? allergyStatus;

  AllergyModel({this.allergyName, this.allergyDesc, this.allergyStatus});

  AllergyModel.fromJson(Map<String, dynamic> json) {
    allergyName = json['allergy_name'] ?? "";
    allergyDesc = json['allergy_desc'] ?? "";
    allergyStatus = json['allergy_status'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allergy_name'] = allergyName;
    data['allergy_desc'] = allergyDesc;
    data['allergy_status'] = allergyStatus;
    return data;
  }
}
