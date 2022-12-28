class SplitSignupDynamicIndex {
  String identifier;

  SplitSignupDynamicIndex({required this.identifier});

  factory SplitSignupDynamicIndex.fromJson(Map<String, dynamic> json) {
    if (json['identifier'] != null) {
      return SplitSignupDynamicIndex(identifier: json['identifier']);
    } else {
      return SplitSignupDynamicIndex(identifier: '');
    }
  }
}
