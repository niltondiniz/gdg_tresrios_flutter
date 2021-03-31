import 'package:appgdg/models/covid_model.dart';
import 'package:appgdg/repositories/covid_repository.dart';
import 'package:intl/intl.dart';

class DetailController {
  List<CovidModel> listCovid;

  Future<void> getDataByState(String initials) async {
    var _listCovidModel = await CovidRepository().get(initials);

    this.listCovid = _listCovidModel;
  }

  String convertDate(String availableDate) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(availableDate); // <-- Incoming date

    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
