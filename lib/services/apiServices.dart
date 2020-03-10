import 'dart:convert';

import 'package:essay_checker/models/assessment.dart';

import '../models/records.dart';
import 'package:http/http.dart' as http;
import '../models/apiResponseData.dart';
import 'package:essay_checker/models/students.dart';
import 'package:essay_checker/models/authUser.dart';

class ApiServices {
  static const baseUrl =
      "https://30437bda-ee6f-484f-9591-990b6b620fe7.mock.pstmn.io";
  static const loginAPI = "$baseUrl/api/auth/login";
  static const assessmentAPI = "$baseUrl/api/assessment";
  static const studentsAPI = "$baseUrl/api/students";

  static const header = {"Content-Type": "application/json"};

  Future<APIResponse<Token>> loginUser(AuthUser user) async {
    return http.post(Uri.encodeFull(loginAPI), body: user.toMap()).then((data) {
      if (data.statusCode == 200) {
        final response = json.decode(data.body);
        return APIResponse<Token>(
          data: Token(
            id: response["id"],
            token: response["token"],
            auth: response["auth"],
          ),
        );
      }
      return APIResponse<Token>(error: true, errorMessage: "err");
    }).catchError(
        (err) => APIResponse<Token>(error: true, errorMessage: "err"));
  }

  Future<APIResponse<List<Records>>> getAssessmentRecord() async {
    return http.get(studentsAPI, headers: header).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final records = <Records>[];
        for (var item in jsonData) {
          final recordsList = Records(
            id: item['id'],
            name: item['name'],
            lastResult: item['lastResult'],
            testCount: item['testCount'],
          );
          records.add(recordsList);
        }
        return APIResponse<List<Records>>(data: records);
      }
      return APIResponse<List<Records>>(
          error: true, errorMessage: "oops! an error occured");
    }).catchError((err) {
      print(err);
      return APIResponse<List<Records>>(
        error: true,
        errorMessage: "oops! an error occured {$err}",
      );
    });
  }

  Future<APIResponse<List<Students>>> getStudents() async {
    return http.get(studentsAPI, headers: header).then((data) {
      // print(data.statusCode);
      if (data.statusCode == 200) {
        final students = <Students>[];
        final jsonData = json.decode(data.body);
        for (var item in jsonData) {
          final studentsList = Students(
            id: item['id'],
            name: item['name'],
            lastResult: item['lastResult'],
            testCount: item['testCount'],
          );
          students.add(studentsList);
        }
        return APIResponse<List<Students>>(data: students);
      }
      return APIResponse<List<Students>>(
          error: true, errorMessage: "oops! an error occured");
    }).catchError((err) {
      print(err);
      return APIResponse<List<Students>>(
        error: true,
        errorMessage: "oops! an error occured {$err}",
      );
    });
  }

  Future<APIResponse<Assessment>> checkSimilarity(Students test) async {
    return http.post(assessmentAPI, body: test.toMap()).then((data) {
      print('returned: ${data.statusCode}');
      var jsonData = json.decode(data.body);
      var result = Assessment(
        id: jsonData["id"],
        unique: jsonData['unique'],
        result: jsonData["result"],
        similarity: jsonData['similarity'],
        similarSections: jsonData['similarSections'],
        uniqueSections: jsonData['uniqueSections'],
      );
      return APIResponse<Assessment>(data: result);
    });
  }
}
