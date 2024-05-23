import 'package:events_mvc/model/order_model.dart';
import 'package:events_mvc/repository/archive_repository.dart';

class ArchiveViewModel {
  Future<List<Order>> getOrders() async {
    return ArvhiveRepository().getallOrders();
  }
}
