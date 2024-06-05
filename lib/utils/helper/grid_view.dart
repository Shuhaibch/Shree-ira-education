class Choice {
  const Choice({
    required this.title,
    required this.courses,
  });
  final String title;
  final String courses;
}

bool isDeveloper = true;

const List<Choice> choices = <Choice>[
  Choice(title: 'Design', courses: "125 courses"),
  Choice(title: 'Business', courses: "125 Courses"),
  Choice(title: 'Front End', courses: "125 Courses"),
  Choice(title: 'Back End', courses: "125 Courses"),
  Choice(title: 'Java', courses: "125 Courses"),
  Choice(title: 'Ruby', courses: "125 Courses"),
];
