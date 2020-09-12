import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../json/questions.dart';

class QuestionsService {

  Future<CoreData> fetchQuestion(String url) async {
    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    CoreData parsedQuestions = CoreData.fromJson(jsonResponse);

    return parsedQuestions;
  }
}
