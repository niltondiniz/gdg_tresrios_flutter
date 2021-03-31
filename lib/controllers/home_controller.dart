import 'package:appgdg/models/state_model.dart';
import 'package:appgdg/repositories/state_repository.dart';

class HomeController {
  List<StateModel> listState;

  Future<void> getStates() async {
    this.listState = StateRepository().getAll();
  }
}
