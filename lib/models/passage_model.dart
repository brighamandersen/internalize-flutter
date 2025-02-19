import 'package:hive/hive.dart';
part 'passage_model.g.dart';

@HiveType(typeId: 0)
class Passage {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  Passage({required this.id, required this.title, required this.body});
}
