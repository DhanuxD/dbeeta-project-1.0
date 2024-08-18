class Course {
  final int id;
  final int instructorId;
  final String title;
  final String category;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Instructor instructor;
  final List<Lesson> lessons;

  Course({
    required this.id,
    required this.instructorId,
    required this.title,
    required this.category,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.instructor,
    required this.lessons,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      instructorId: json['instructor_id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      instructor: Instructor.fromJson(json['instructor']),
      lessons: json['lessons'] != null
          ? List<Lesson>.from(json['lessons'].map((lesson) => Lesson.fromJson(lesson)))
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
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'instructor': instructor.toJson(),
      'lessons': lessons.map((lesson) => lesson.toJson()).toList(),
    };
  }
}

class Instructor {
  final int id;
  final String name;
  final String role;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Instructor({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      email: json['email'],
      emailVerifiedAt: json.containsKey('email_verified_at') && json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
class Lesson {
  final int id;
  final int courseId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      courseId: json['course_id'],
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'title': title,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
