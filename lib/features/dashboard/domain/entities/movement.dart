import 'package:bank_app/features/dashboard/data/models/movement_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement.freezed.dart';

@freezed
abstract class Movement with _$Movement {
  const factory Movement({
    required String date,
    required String timestamp,
    required String description,
    required double amount,
    required String type,
    required String sign,
    required String category,
  }) = _Movement;
}

extension MovementExtension on Movement {
  MovementModel toModel() {
    return MovementModel(
      date: date,
      timestamp: timestamp,
      description: description,
      amount: amount,
      type: type,
      sign: sign,
      category: category,
    );
  }
}

extension MovementFromModelExtension on MovementModel {
  Movement fromModel() {
    return Movement(
      date: date,
      timestamp: timestamp,
      description: description,
      amount: amount,
      type: type,
      sign: sign,
      category: category,
    );
  }
}
