// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'phone_number_entity.g.dart';

@collection
class PhoneNumberEntity {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  final String? phoneNumber;
  final String? firstNumber;
  final String? idCountry;
  final String? country;

  PhoneNumberEntity({
    this.phoneNumber,
    this.firstNumber,
    this.idCountry,
    this.country,
  });
}
