import 'package:events_mvc/model/category_model.dart';

class HomePageViewModel {
  final message = 'Hope to help you organize \nyour event';
  final selectType = 'Please select the type of event';

  final List<Category> categories = [
    Category(name: 'Weddings', numbers: [1, 2, 3, 4, 7]),
    Category(name: 'Sad occasions', numbers: [5, 6]),
    Category(name: 'Graduation parties', numbers: [1, 2, 3, 7]),
    Category(name: 'Birthdays', numbers: [1, 2, 3, 7]),
  ];
}
