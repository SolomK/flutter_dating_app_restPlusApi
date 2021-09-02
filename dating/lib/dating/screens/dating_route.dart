import 'package:dating/dating/models/models.dart';

import 'package:dating/dating/screens/screens.dart';
import 'package:flutter/material.dart';


class DatingAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => DatingLogin());
    }

    // if (settings.name == AddUpdateDating.routeName) {
    //   DatingArgument args = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => AddUpdateCourse(
    //             args: args,
    //           ));
    // }

    // if (settings.name == DatingDetail.routeName) {
    //   Course course = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => CourseDetail(
    //             course: course,
    //           ));
    // }

    return MaterialPageRoute(builder: (context) => DatingLogin());
  }
}

class DatingArgument {
  final Dating dating;
  final bool edit;
  DatingArgument({required this.dating, required this.edit});
}
