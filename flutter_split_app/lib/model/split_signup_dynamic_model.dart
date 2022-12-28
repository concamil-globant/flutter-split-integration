
// GV_signup_Dynamic_Form_data
class SplitSignupDynamicModel {
  List<Map<String, String>>? residenceDepartment;
  List<Map<String, String>>? municipality;
  List<Map<String, String>>? politicalPerson;
  List<Map<String, String>>? publicCharge;
  List<Map<String, String>>? accessFunds;
  List<Map<String, String>>? stockholder;

  SplitSignupDynamicModel.empty() {
    municipality = [];
    residenceDepartment = [];
    politicalPerson = [];
    publicCharge = [];
    accessFunds = [];
    stockholder = [];
  }

  void fromJsonAppend(Map<String, dynamic> json) {
    if (json['residenceDepartment'] != null) {
      residenceDepartment?.addAll((json['residenceDepartment'] as List)
          .map(
              (e) => {'id': e['id'].toString(), 'title': e['title'].toString()})
          .toList());
    }

    if (json['municipality'] != null) {
      municipality?.addAll((json['municipality'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'title': e['title'].toString(),
                'value': e['value'].toString(),
                'id_dpto': e['id_dpto'].toString()
              })
          .toSet());
    }

    if (json['politicalPerson'] != null) {
      politicalPerson?.addAll((json['politicalPerson'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'radioButton': e['radioButton'].toString()
              })
          .toList());
    }

    if (json['publicCharge'] != null) {
      publicCharge?.addAll((json['publicCharge'] as List)
          .map(
              (e) => {'id': e['id'].toString(), 'title': e['title'].toString()})
          .toList());
    }

    if (json['accessFunds'] != null) {
      accessFunds?.addAll((json['accessFunds'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'radioButton': e['radioButton'].toString()
              })
          .toList());
    }

    if (json['stockholder'] != null) {
      stockholder?.addAll((json['stockholder'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'radioButton': e['radioButton'].toString()
              })
          .toList());
    }
  }
}

class ResidenceDepartment {
  String idDpto;
  String title;

  ResidenceDepartment({required this.idDpto, required this.title});
}

class Municipality {
  String id;
  String title;
  String value;
  String idDpto;

  Municipality(
      {required this.id,
      required this.title,
      required this.value,
      required this.idDpto});
}

class PoliticalPerson {
  String id;
  String radioButton;

  PoliticalPerson({required this.id, required this.radioButton});
}

class PublicCharge {
  String id;
  String title;

  PublicCharge({required this.id, required this.title});
}

class AccessFunds {
  String id;
  String radioButton;

  AccessFunds({required this.id, required this.radioButton});
}

class Stockholder {
  String id;
  String radioButton;

  Stockholder({required this.id, required this.radioButton});
}
