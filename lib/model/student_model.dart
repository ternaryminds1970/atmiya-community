class Student {
  final String division;
  final String rollNo;
  final String regNo;
  final String enrollNo;
  final String studentName;
  final String studentEmail;
  final String studentMobile;
  final String fatherMobile;
  final String fatherOccupation;
  final String motherOccupation;
  final bool business;
  final String typeOfBusiness1;
  final String typeOfBusiness2;
  final String city;
  final String district;
  final bool job;
  final String jobCompany;
  final String jobRole;
  final String jobCity;
  final bool physicallyDisable;

  Student({
    required this.division,
    required this.rollNo,
    required this.enrollNo,
    required this.regNo,
    required this.studentName,
    required this.studentEmail,
    required this.studentMobile,
    required this.fatherMobile,
    required this.fatherOccupation,
    required this.motherOccupation,
    required this.business,
    required this.typeOfBusiness1,
    required this.typeOfBusiness2,
    required this.city,
    required this.district,
    required this.job,
    required this.jobCompany,
    required this.jobRole,
    required this.jobCity,
    required this.physicallyDisable,
  });

  Map<String, dynamic> toMap() {
    return {
      'division': division,
      'rollNo': rollNo,
      'regNo': regNo,
      'enrollNO': enrollNo,
      'studentName': studentName,
      'studentEmail': studentEmail,
      'studentMobile': studentMobile,
      'fatherMobile': fatherMobile,
      'fatherOccupation': fatherOccupation,
      'motherOccupation': motherOccupation,
      'business': business,
      'typeOfBusiness1': typeOfBusiness1,
      'typeOfBusiness2': typeOfBusiness2,
      'city': city,
      'district': district,
      'job': job,
      'jobCompany': jobCompany,
      'jobRole': jobRole,
      'jobCity': jobCity,
      'physicallyDisable': physicallyDisable,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      division: map['division'] as String,
      rollNo: map['rollNo'] as String,
      enrollNo: map['enrollNo'] as String,
      regNo: map['regNo'] as String,
      studentName: map['studentName'] as String,
      studentEmail: map['studentEmail'] as String,
      studentMobile: map['studentMobile'] as String,
      fatherMobile: map['fatherMobile'] as String,
      fatherOccupation: map['fatherOccupation'] as String,
      motherOccupation: map['motherOccupation'] as String,
      business: map['business'] as bool,
      typeOfBusiness1: map['typeOfBusiness1'] as String,
      typeOfBusiness2: map['typeOfBusiness2'] as String,
      city: map['city'] as String,
      district: map['district'] as String,
      job: map['job'] as bool,
      jobCompany: map['jobCompany'] as String,
      jobRole: map['jobRole'] as String,
      jobCity: map['jobCity'] as String,
      physicallyDisable: map['physicallyDisable'] as bool,
    );
  }

  Student copyWith({
    String? division,
    String? rollNo,
    String? regNo,
    String? enrollNo,
    String? studentName,
    String? studentEmail,
    String? studentMobile,
    String? fatherMobile,
    String? fatherOccupation,
    String? motherOccupation,
    bool? business,
    String? typeOfBusiness1,
    String? typeOfBusiness2,
    String? city,
    String? district,
    bool? job,
    String? jobCompany,
    String? jobRole,
    String? jobCity,
    bool? physicallyDisable,
  }) {
    return Student(
      division: division ?? this.division,
      rollNo: rollNo ?? this.rollNo,
      enrollNo: enrollNo ?? this.enrollNo,
      regNo: regNo ?? this.regNo,
      studentName: studentName ?? this.studentName,
      studentEmail: studentEmail ?? this.studentEmail,
      studentMobile: studentMobile ?? this.studentMobile,
      fatherMobile: fatherMobile ?? this.fatherMobile,
      fatherOccupation: fatherOccupation ?? this.fatherOccupation,
      motherOccupation: motherOccupation ?? this.motherOccupation,
      business: business ?? this.business,
      typeOfBusiness1: typeOfBusiness1 ?? this.typeOfBusiness1,
      typeOfBusiness2: typeOfBusiness2 ?? this.typeOfBusiness2,
      city: city ?? this.city,
      district: district ?? this.district,
      job: job ?? this.job,
      jobCompany: jobCompany ?? this.jobCompany,
      jobRole: jobRole ?? this.jobRole,
      jobCity: jobCity ?? this.jobCity,
      physicallyDisable: physicallyDisable ?? this.physicallyDisable,
    );
  }
}
