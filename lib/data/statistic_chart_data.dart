import 'package:matemafront/models/week_chart_data_model.dart';

class ChartData {
  static int interval = 2;
  static List<Data> barData = [];

  static Future<void> fetchChartData() async {
    List<Map<String, dynamic>> mockJsonData = [
      {'day': '2023-12-04', 'count': 1},
      {'day': '2023-12-05', 'count': 2},
      {'day': '2023-12-06', 'count': 3},
      {'day': '2023-12-07', 'count': 4},
      {'day': '2023-12-08', 'count': 5},
      {'day': '2023-12-09', 'count': 3},
      {'day': '2023-12-10', 'count': 0}
    ];

    try {
      barData = mockJsonData.map((data) {
        DateTime date = DateTime.parse(data['day']);
        int id = date.weekday;

        return Data(
          id: id,
          y: data['count'].toDouble(),
        );
      }).toList();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
