import 'package:myapp/helper_classes/database_helper.dart';


class DatabaseMethods{
  final dbHelper = DatabaseHelper.instance;

void insert(String task,String description,String category) async{

  Map<String, dynamic> row = 
  {
    DatabaseHelper.columnTask : task,
    DatabaseHelper.columnDescription : description,
    DatabaseHelper.columnCategory: category

  };

  final id = await dbHelper.insert(row);
   print('inserted row id: $id');
}

 void query() async {
    final  allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  // Future <List<Map<String,dynamic>>> listAllData() async
  // RETURNS A LIST OF MAP WHICH CAN BE EDITED OR EXTRACTED
   Future<List<Map<String, dynamic>>> addToList() async
   {
    List<Map<String,dynamic>> maps;
    List<Map> dataList = await dbHelper.queryAllRows();
     maps = dataList;
     return maps;
   }

   Future<List<Map<String, dynamic>>> addToFilteredList(String category) async{

     List<Map<String,dynamic>> maps;
     List<Map> dataList = await dbHelper.selectCategory(category);
     maps = dataList;
     return maps;
   }



  void update(String task,String description,String category ) async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnTask   : task,
      DatabaseHelper.columnDescription : description,
      DatabaseHelper.columnCategory  : category
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');

}
  void deleteRow(int id) async{
    final deletedRow = await dbHelper.deleteRow(id);
    print("Deleted Row: $deletedRow");
}
  void selectCategory(String category) async{
    final row = await dbHelper.selectCategory(category);
    print(row);
  }

}