class SplitIndexModel {
  String identifier;

  SplitIndexModel({required this.identifier});

  factory SplitIndexModel.fromJson(Map<String, dynamic> json) {
    if (json['identifier'] != null) {
      return SplitIndexModel(identifier: json['identifier']);
    } else {
      return SplitIndexModel(identifier: '');
    }
  }
}
