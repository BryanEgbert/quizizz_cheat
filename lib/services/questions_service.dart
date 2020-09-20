import 'dart:convert' as convert;
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import '../json/questions.dart';

/// Parse the JSON file.
class QuestionsService {
  Future<CoreData> fetchQuestion(String url) async {
    final response = await http.get(url);
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    // If response.statusCode return 200(OK) then parse the data
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      CoreData parsedQuestions = CoreData.fromJson(jsonResponse);

      return parsedQuestions;

    // If there is no connection while fetching the data.
    // throw SocketException
    } else if (connectivityResult == ConnectivityResult.none) {
      throw SocketException("Internet connection not found");

    // If there is error in fetching the data.
    // throw HttpException
    } else if (response.statusCode == 404) {
      throw HttpException("Error 404");
      
    // else throw FormatException
    } else {
      throw FormatException();
    }
  }
}

