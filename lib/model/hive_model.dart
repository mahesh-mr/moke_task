import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String date;
  HiveModel({
    required this.date,
    required this.name,
  });
}

const String boxname = "test";
