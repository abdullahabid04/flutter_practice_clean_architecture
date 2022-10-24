convertJsonToObject(List<Map<String, dynamic>> listJson, type) {
  List<Type> typeList = <Type>[];
  if (listJson != null) {
    listJson.forEach((element) {
      typeList.add(type.fromJson(element));
    });
    return typeList;
  } else {
    return typeList;
  }
}
