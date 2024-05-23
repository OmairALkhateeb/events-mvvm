import 'package:events_mvc/model/lounges_model.dart';
import 'package:events_mvc/repository/halls_repository.dart';

class HallsViewModel {
  late final String? categoryName;
  late final List<int> numbers;
  static String id = 'HalsPage';
  Future<List<Lounges>> getHalls({required Category}) async {
    return HallsRepository().getAllhals(category: Category);
  }
}
