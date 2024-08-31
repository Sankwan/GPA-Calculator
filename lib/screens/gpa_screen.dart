import 'package:flutter/material.dart';

class GpaScreen extends StatefulWidget {
  @override
  _GpaScreenState createState() => _GpaScreenState();
}

class _GpaScreenState extends State<GpaScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Course> _courses = [];

  double? _gpa;
  double? _cgpa;
  String? _degreeClass;

  final _courseNameController = TextEditingController();
  final _creditController = TextEditingController();
  final _gradeController = TextEditingController();

  void _addCourse() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        String courseName = _courseNameController.text;
        double creditHours = double.parse(_creditController.text);
        double gradePoint = double.parse(_gradeController.text);
        _courses.add(Course(
            courseName: courseName,
            creditHours: creditHours,
            gradePoint: gradePoint));
        _courseNameController.clear();
        _creditController.clear();
        _gradeController.clear();
      });
    }
  }

  void _calculateGPA() {
    setState(() {
      _gpa = calculateGPA(_courses);
    });
  }

  void _calculatecgpa() {
    setState(() {
      _cgpa = calculatecgpa(_gpa!);
      _degreeClass = classifyDegree(_cgpa!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATU GPA Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _courseNameController,
                decoration: InputDecoration(labelText: 'Course Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the course name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _creditController,
                decoration: InputDecoration(labelText: 'Credit Hours'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter credit hours';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _gradeController,
                decoration: InputDecoration(labelText: 'Grade Point'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter grade point';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addCourse,
                child: Text('Add Course'),
              ),
              SizedBox(height: 16),
              _courses.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Added Courses:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        ..._courses.map((course) => Text(
                            '${course.courseName} - ${course.creditHours} Credit Hours - ${course.gradePoint} Grade Point')),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _calculateGPA,
                          child: Text('Calculate GPA'),
                        ),
                        if (_gpa != null)
                          Text('GPA: ${_gpa!.toStringAsFixed(2)}'),
                      ],
                    )
                  : SizedBox(),
              if (_gpa != null) ...[
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _calculatecgpa,
                  child: Text('Calculate CGPA'),
                ),
                if (_cgpa != null) Text('cgpa: ${_cgpa!.toStringAsFixed(2)}'),
                if (_degreeClass != null) Text('Degree Class: $_degreeClass'),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class Course {
  final String courseName;
  final double creditHours;
  final double gradePoint;

  Course(
      {required this.courseName,
      required this.creditHours,
      required this.gradePoint});
}

double calculateGPA(List<Course> courses) {
  double totalGradePoints = 0;
  double totalCreditHours = 0;

  for (var course in courses) {
    totalGradePoints += course.creditHours * course.gradePoint;
    totalCreditHours += course.creditHours;
  }

  return totalGradePoints / totalCreditHours;
}

double calculatecgpa(double gpa) {
  double weightedGPA =
      (gpa * 6); // Assuming the weights are applied as per the Ghanaian system
  return weightedGPA / 6;
}

String classifyDegree(double cgpa) {
  if (cgpa >= 3.60) {
    return 'First Class';
  } else if (cgpa >= 3.00) {
    return 'Second Class (Upper)';
  } else if (cgpa >= 2.00) {
    return 'Second Class (Lower)';
  } else if (cgpa >= 1.50) {
    return 'Third Class';
  } else if (cgpa >= 1.00) {
    return 'Pass';
  } else {
    return 'Fail (No Award)';
  }
}
