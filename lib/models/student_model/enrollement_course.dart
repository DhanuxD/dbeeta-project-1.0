class EnrollmentResponse {
  final String? message;
  final Enrollment? enrollment;
  final Course? course;

  EnrollmentResponse({
    this.message,
    this.enrollment,
    this.course,
  });

  factory EnrollmentResponse.fromJson(Map<String, dynamic> json) {
    return EnrollmentResponse(
      message: json['message'],
      enrollment: json['enrollment'] != null
          ? Enrollment.fromJson(json['enrollment'])
          : null,
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'enrollment': enrollment?.toJson(),
      'course': course?.toJson(),
    };
  }
}

class Enrollment {
  final int? courseId;
  final int? studentId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;
  final Course? course;

  Enrollment({
    this.courseId,
    this.studentId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.course,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      courseId: json['course_id'],
      studentId: json['student_id'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'student_id': studentId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
      'course': course?.toJson(),
    };
  }
}

class Course {
  final int? id;
  final int? instructorId;
  final String? title;
  final String? category;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final Instructor? instructor;
  final List<Lesson>? lessons;

  Course({
    this.id,
    this.instructorId,
    this.title,
    this.category,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.instructor,
    this.lessons,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      instructorId: json['instructor_id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      instructor: json['instructor'] != null
          ? Instructor.fromJson(json['instructor'])
          : null,
      lessons: json['lessons'] != null
          ? (json['lessons'] as List)
          .map((lessonJson) => Lesson.fromJson(lessonJson))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'instructor_id': instructorId,
      'title': title,
      'category': category,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'instructor': instructor?.toJson(),
      'lessons': lessons?.map((lesson) => lesson.toJson()).toList(),
    };
  }
}

class Instructor {
  final int? id;
  final String? name;
  final String? role;
  final String? email;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  Instructor({
    this.id,
    this.name,
    this.role,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Lesson {
  final int? id;
  final int? courseId;
  final String? title;
  final String? content;
  final String? createdAt;
  final String? updatedAt;

  Lesson({
    this.id,
    this.courseId,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      courseId: json['course_id'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'title': title,
      'content': content,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
