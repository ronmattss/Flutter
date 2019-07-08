import 'crud.dart';

class Data
 {
  List<Map<String, dynamic>> dataList = <Map<String, dynamic>>[];
  List<String> dataName = <String>[];
  List<String> dataDescription = <String>[];
  List<String> dataCategory = <String>[];
  List<int> dataValue = <int>[];

  // retrieve data from query list
  Future getTasks(List<Map> map) async 
  {
    DatabaseMethods dbm = new DatabaseMethods();
    dataList = await dbm.addToList();//print(map);
    map = dataList;
    print(dataList);
    assignToList(dataValue, dataName, dataDescription, dataCategory);
  }
 


  void assignToList(List<int> idList, List<String> tasks,
      List<String> description, List<String> category)  
      {
    List<String> columns = <String>[];

    columns.add("id");
    columns.add("task");
    columns.add("description");
    columns.add("category");

    for (var i = 0; i < columns.length; i++) 
    {
      for (var j = 0; j < dataList.length; j++) 
      {
        Map<String, dynamic> wat =
            Map.fromIterables(dataList[j].keys, dataList[j].values);
        switch (i) {
          case 0:
            idList.add(wat["id"]);
            print(idList);
            break;

          case 1:
            tasks.add(wat["task"]);
            print(tasks);
            break;

          case 2:
            description.add(wat["description"]);
            break;

          case 3:
            category.add(wat["category"]);
            break;

          default:
            break;
        }
      }
    }
    printDataList();
  }

  void printDataList() {
    print(dataName);
    print(dataDescription);
    print(dataCategory);
  }
}
