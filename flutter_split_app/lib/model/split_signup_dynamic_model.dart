// GV_signup_Dynamic_Form_data
class SplitSignupDynamicModel {
  List<Map<String, String>>? residenceDepartment;
  List<Map<String, String>>? municipality;
  List<Map<String, String>>? politicalPerson;
  List<Map<String, String>>? publicCharge;
  List<Map<String, String>>? accessFunds;
  List<Map<String, String>>? stockholder;

  List<Map<String, String>>? maritalStatus;
  List<Map<String, String>>? economicActivity;
  List<Map<String, String>>? incomeLevel;

  List<Map<String, String>>? familyState;
  List<Map<String, String>>? originFunds;
  List<Map<String, String>>? amountPerMonth;

  SplitSignupDynamicModel.empty() {
    municipality = [];
    residenceDepartment = [];
    politicalPerson = [];
    publicCharge = [];
    accessFunds = [];
    stockholder = [];

    maritalStatus = [];
    economicActivity = [];
    incomeLevel = [];

    familyState = [];
    originFunds = [];
    amountPerMonth = [];
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
          .toList());
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

    // --
    if (json['maritalStatus'] != null) {
      maritalStatus?.addAll((json['maritalStatus'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'title': e['title'].toString(),
                'value': e['value'].toString()
              })
          .toList());
    }

    if (json['economicActivity'] != null) {
      economicActivity?.addAll((json['economicActivity'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'title': e['title'].toString(),
                'value': e['value'].toString()
              })
          .toList());
    }

    if (json['incomeLevel'] != null) {
      incomeLevel?.addAll((json['incomeLevel'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'title': e['title'].toString(),
                'value': e['value'].toString()
              })
          .toList());
    }

    // --
    if (json['familyState'] != null) {
      familyState?.addAll((json['familyState'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'radioButton': e['radioButton'].toString()
              })
          .toList());
    }

    if (json['originFunds'] != null) {
      originFunds?.addAll((json['originFunds'] as List)
          .map(
              (e) => {'id': e['id'].toString(), 'title': e['title'].toString()})
          .toList());
    }

    if (json['amountPerMonth'] != null) {
      amountPerMonth?.addAll((json['amountPerMonth'] as List)
          .map((e) => {
                'id': e['id'].toString(),
                'radioButton': e['radioButton'].toString()
              })
          .toList());
    }
  }
}