class SplitStackIndex {
  List<ResidenceDepartment>? residenceDepartment;
  List<Municipality>? municipality;
  List<PoliticalPerson>? politicalPerson;
  List<PublicCharge>? publicCharge;
  List<AccessFunds>? accessFunds;
  List<Stockholder>? stockholder;
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
