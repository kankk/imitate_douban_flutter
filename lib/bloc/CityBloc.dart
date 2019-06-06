import 'package:bloc/bloc.dart';

// 定义State
class CityState {
  String _curCity;

  get curCity => _curCity;

  CityState(this._curCity);
}

// 定义Event
class CityEvent {
  String _city;

  get city => _city;

  CityEvent(this._city);
}

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() {
    initData();
  }

  void initData() async {
    String city = '深圳';
    dispatch(CityEvent(city));
  }

  @override
  // TODO: implement initialState
  get initialState => CityState(null); //默认值为空

  @override
  Stream<CityState> mapEventToState(CityEvent event) async*{
    // TODO: implement mapEventToState
    yield new CityState(event.city);
  }
}