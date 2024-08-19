// -------------------> Importing all Flutter SDK packages <----------------------//
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';

// ------------------------->GetX package from pub.dev<---------------------------//
export 'package:get/get.dart';
export 'package:get/get_navigation/src/routes/get_route.dart';

// ----------------------> Third-party packages from pub.dev<---------------------//
export 'package:lottie/lottie.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:google_fonts/google_fonts.dart';

//--------------------------->Project-specific imports<--------------------------//
export 'package:learning_management_systemo_v01/constant/Routes.dart';
export 'package:learning_management_systemo_v01/constant/app_colors.dart';
export 'package:learning_management_systemo_v01/utils/styles/font_style.dart';
export 'package:learning_management_systemo_v01/utils/styles/input_decorations.dart';
export 'package:learning_management_systemo_v01/screens/student_screen/student_home.dart';
export 'package:learning_management_systemo_v01/screens/login.dart';
export 'package:learning_management_systemo_v01/screens/register.dart';
export 'package:learning_management_systemo_v01/screens/splash.dart';
export 'package:learning_management_systemo_v01/controllers/auth_controllers/login_controller.dart';
export 'package:learning_management_systemo_v01/controllers/auth_controllers/register_controller.dart';
export 'package:learning_management_systemo_v01/enums/special.dart';
export 'package:learning_management_systemo_v01/services/remote/auth_services.dart';
export '../../constant/const.dart';
export '../../models/course_model.dart';
export '../../services/remote/student_services/course_service.dart';
export 'package:learning_management_systemo_v01/controllers/student_controllers/courses_controller.dart';
export 'package:learning_management_systemo_v01/screens/instructor_screen/create_course.dart';
export 'package:learning_management_systemo_v01/screens/instructor_screen/instructor_home.dart';
export 'package:learning_management_systemo_v01/screens/student_screen/courses_details.dart';
export '../../controllers/instructor_controllers/course_manage_controller.dart';
export 'package:learning_management_systemo_v01/services/remote/instructor_services/manage_courses_service.dart';

export '../../models/user_model.dart';
