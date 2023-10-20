import 'package:smart_brace_case/src/data/models/data.dart';
import 'package:smart_brace_case/src/data/models/toto.dart';

class User {
  String dentalReference;
  List<Todo> todos;
  List<BraceCaseData> datas;

  User({
    required this.dentalReference,
    required this.todos,
    required this.datas,
  });
}
