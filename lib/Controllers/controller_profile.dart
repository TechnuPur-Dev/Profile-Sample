import 'package:get/get.dart';

class ControllerProfile extends GetxController {
  var viewProfessional = false.obs;
  var viewReviews = false.obs;

  var listItemsMySkills = [
    'Plumber',
    'Roofer',
    'Electrician',
    'VAC',
  ].obs;
  var yearsExprence = 5.0.obs;
  var listExperince = [
    {"title": "Contracting License", "selected": true},
    {"title": "Insurance Certicate", "selected": true},
    {"title": "all the tools equired for the job", "selected": false},
    {"title": "always follow the safety procedures", "selected": false},
    {"title": "clean the property after my job is done", "selected": false},
  ].obs;

  var listHaveExperince = ["Contracting License", "Insurance Certicate"].obs;
  var listDontHaveExperince = [
    "all the tools equired for the job",
    "always follow the safety procedures",
    "clean the property after my job is done"
  ].obs;

  setviewProfessional(bool value) => viewProfessional.value = value;
  setviewReviews(bool value) => viewReviews.value = value;

  setYearofEx(double value) => yearsExprence.value = value;

  addItemHaveExperinece(String item) => listHaveExperince.add(item);
  addItemDontHaveExperinece(String item) => listDontHaveExperince.add(item);
  removeItemHaveExperince(String item) => listHaveExperince.remove(item);
  removeItemDontHaveExperinece(String item) =>
      listDontHaveExperince.remove(item);

  setExprince(bool value, int index) {
    List<Map<String, Object>> newList = [...listExperince];
    newList[index]["selected"] = value;
    listExperince.value = newList;
    if (value) {
      addItemHaveExperinece(listExperince[index]["title"].toString());
      removeItemDontHaveExperinece(listExperince[index]["title"].toString());
    } else {
      addItemDontHaveExperinece(listExperince[index]["title"].toString());
      removeItemHaveExperince(listExperince[index]["title"].toString());
    }
  }

  addItem(String item) => listItemsMySkills.add(item);
  removeItem(String item) => listItemsMySkills.remove(item);
}
