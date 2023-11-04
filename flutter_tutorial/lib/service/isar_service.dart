import 'package:flutter_tutorial/models/phone_number_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> database;
  IsarService() {
    database = openIsar();
  }
  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [PhoneNumberEntitySchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<bool> createPhoneNumber(PhoneNumberEntity phoneNumber) async {
    try {
      final isar = await database;
      isar.writeTxnSync<int>(
          () => isar.phoneNumberEntities.putSync(phoneNumber));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<PhoneNumberEntity>> getAllPhoneNumbers() async {
    final isar = await database;
    final result = await isar.phoneNumberEntities.where().findAll();
    return result;
  }

  Future<bool> deletePhoneNumber(PhoneNumberEntity phoneNumber) async {
    try {
      final isar = await database;
      await isar.writeTxn(() async {
        await isar.phoneNumberEntities.delete(phoneNumber.id);
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
