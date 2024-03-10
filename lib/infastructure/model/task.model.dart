

import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.model.freezed.dart';
part 'task.model.g.dart';


@freezed
class TaskModel with _$TaskModel {
 
  factory TaskModel({
    required String id,         
    required String title,        
    required String description,
    required String date,      
    required String status,     
  }) = _TaskModel;
    factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
