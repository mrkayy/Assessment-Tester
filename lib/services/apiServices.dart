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
  static const recordsAPI = "$baseUrl/api/records";

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

  Future<Assessment> getstudentAssessment() async {
    return http
        .get(Uri.encodeFull(assessmentAPI), headers: header)
        .then((data) {
      print(data.statusCode);
      // print(data.body);
      if (data.statusCode == 200) {
        final response = json.decode(data.body);
        final result = Assessment.fromJson(response);
        return result;
      }
    }).catchError((err) => print("debug error: " + err));
  }

  Future<List<Records>> getAssessmentRecord() async {
    return http.get(recordsAPI, headers: header).then((data) {
      final records = <Records>[];
      if (data.statusCode == 200) {
        // print(data.statusCode);
        final jsonData = json.decode(data.body);
        // print(jsonData.first['student']);
        for (var item in jsonData) {
          final recordsList = Records(
            // id: item['id'],
            student: item['student'],
            unique: item['unique'],
            similar: item['similar'],
            result: item['result'],
          );
          records.add(recordsList);
        }
      }
      return records;
    });
  }

  Future<List<Students>> getStudents() async {
    return http.get(studentsAPI, headers: header).then((data) {
      final students = <Students>[];
      if (data.statusCode == 200) {
        // print(data.statusCode);
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
      }
      return students;
    });
  }

  // Future<APIResponse<Assessment>> getstudentAssessment() async {
  //   // var result;
  //   return http.get(assessmentAPI, headers: header).then((response) {
  //     if (response.statusCode == 200) {
  //       print('debug: ${response.statusCode}');
  //       var data = json.decode(response.body);
  //       final results = Assessment(
  //         id: data['id'],
  //         result: data['result'],
  //         similarity: data['similarity'],
  //         unique: data['unique'],
  //         body: data['body'],
  //       );

  //       print('debug: ${results.result}');
  //       return APIResponse<Assessment>(data: results);
  //     }
  //     return APIResponse<Assessment>(
  //         error: true, errorMessage: "an error occured");
  //   });
  // }
}
