import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/place_event.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/place_state.dart';

class PlaceBloc extends Bloc<PlacesEvent, PlaceState> {
  PlaceBloc() : super(PlaceState(places: [])) {
    on<InitialPlacesEvent>(_onInitial);
    

  }

  _onInitial(InitialPlacesEvent event, Emitter<PlaceState> emit) {
    emit(state.copyWith(places: event.places));
  }
}
