import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../json/questions.dart';
import 'input_service.dart';

class QuestionsService {

  Future<CoreData> fetchQuestion({InputService inputService}) async {
    final response = await http.get(inputService.userInput);
    var jsonResponse = convert.jsonDecode(response.body);
    CoreData parsedQuestions = CoreData.fromJson(jsonResponse);

    return parsedQuestions;
  }
}
