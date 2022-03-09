class myDB {
  //performing crud operations on nosql database from provided database

  final dbName;
  myDB({this.dbName});

  Map<String, dynamic> generateDB = Map<String, dynamic>();

  //updating element to datbase
  update(String mainkey, String subkey, dynamic value_tobe_update) {
    final subdata = generateDB[mainkey];
    subdata[subkey] = value_tobe_update;
  }

  //deleting element to databsae
  delete(String key) {
    generateDB.remove(key);
  }

  //insetng elemen to database
  insert(String key, dynamic value) {
    generateDB.addEntries([MapEntry(key, value)]);
  }
}
