import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement_model.freezed.dart';
part 'movement_model.g.dart';

@freezed
abstract class MovementModel with _$MovementModel {
  const factory MovementModel({
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'sign') required String sign,
    @JsonKey(name: 'category') required String category,
  }) = _MovementModel;

  factory MovementModel.fromJson(Map<String, dynamic> json) =>
      _$MovementModelFromJson(json);
}

extension MovementModelExtension on MovementModel {
  Movement toEntity() {
    return Movement(
      date: date,
      description: description,
      amount: amount,
      type: type,
      sign: sign,
      category: category,
    );
  }
}
