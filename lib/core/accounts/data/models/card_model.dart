import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
abstract class CardModel with _$CardModel {
  factory CardModel({
    @JsonKey(name: 'user_id') required String cardUserId,
    @JsonKey(name: 'card_number') required String cardNumber,
    @JsonKey(name: 'card_name') required String cardHolderName,
    @JsonKey(name: 'card_expiration') required String expirationDate,
    @JsonKey(name: 'card_cvv') required String cvv,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
