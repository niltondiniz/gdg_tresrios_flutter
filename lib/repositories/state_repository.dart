import 'package:appgdg/models/state_model.dart';
import 'package:appgdg/util/constants.dart';

class StateRepository {
  List<StateModel> getAll() {
    List<StateModel> _listState = [];

    for (var item in listEstados) {
      _listState.add(StateModel(name: item['nome'], initials: item['sigla']));
    }

    return _listState;
  }
}
