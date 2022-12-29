// GV_signup_Dynamic_Form_Header_data
class SplitSignupDynamicHeaderModel {
  List<dynamic>? headerValue;

  SplitSignupDynamicHeaderModel.empty() {
    headerValue = [];
  }

  void fromJsonAppend(List<dynamic> json) {
    headerValue?.addAll(json
        .map((e) => {
              'name': e['name'].toString(),
              'name2': e['name2'].toString(),
              'hasChild': e['hasChild'].toString(),
              'type': e['type'].toString(),
              'helpText': e['helpText'].toString(),
              'label': e['label'].toString(),
              'labelQuestion': e['labelQuestion'].toString(),
              'label2': e['label2'].toString(),
              'valueMapResult': e['valueMapResult'].toString(),
              'valueMapResult2': e['valueMapResult2'].toString(),
              'actualValue': e['actualValue'].toString(),
              'mandatory': e['mandatory'].toString(),
              'relationshipList': e['relationshipList'] != null
              ? (e['relationshipList'] as List)
                  .map((e) => {
                        'id': e['id'].toString(),
                        'title': e['title'].toString()
                      })
                  .toList()
              : [],
              'validator': e['validator'].toString(),
            })
        .toList());
  }
}
