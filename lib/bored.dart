class Bored {
  late String activity;
  late String type;
  late int participants;
  late double price;
  late String link;
  late String key;
  late double accessibility;

  Bored(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.link,
      required this.key,
      required this.accessibility});

  Bored.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'];
  }
}
