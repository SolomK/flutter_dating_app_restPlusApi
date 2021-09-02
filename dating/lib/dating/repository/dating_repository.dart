import 'package:dating/dating/data_provider/data_provider.dart';
import 'package:dating/dating/models/models.dart';



class DatingRepository {
  final DatingDataProvider dataProvider;
  

  DatingRepository({required this.dataProvider})
      // ignore: unnecessary_null_comparison
      : assert(dataProvider != null);

  Future<Dating> createDating(Dating dating) async {
    return await dataProvider.createDating(dating);
  }

  Future<List<Dating>> getDating() async {
    return await dataProvider.getDating();
  }

  Future<void> updateDating(Dating dating) async {
    await dataProvider.updateDating(dating);
  }

  Future<void> deleteDating(String id) async {
    await dataProvider.deleteDating(id);
  }
}
