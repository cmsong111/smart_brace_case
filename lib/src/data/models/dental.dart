import 'package:smart_brace_case/src/data/models/notice.dart';

class Dental {
  String name;
  String address;
  String phone;
  List<Notice> notice;

  Dental({
    required this.name,
    required this.address,
    required this.phone,
    required this.notice,
  });
}
