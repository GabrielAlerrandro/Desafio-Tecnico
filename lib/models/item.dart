class Item {
  late String id;
  late String name;
  late String description;
  late String urlImagem;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.urlImagem});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    urlImagem = json['urlImagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['urlImagem'] = urlImagem;
    return data;
  }
}
