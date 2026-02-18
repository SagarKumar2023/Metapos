import 'package:hive/hive.dart';
part 'user_model.g.dart';
@HiveType(typeId: 33)
class UserModel extends HiveObject{

  @HiveField(0)
  final String name ;

  @HiveField(1)
  final int age;

  UserModel({required this.name,required this.age});

}
