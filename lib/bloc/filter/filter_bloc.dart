import 'dart:async';
import 'dart:developer' as dev;
import 'package:atmiya_community/model/student_model.dart';
import 'package:atmiya_community/repositories/student_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({required this.studentRepository}) : super(FilterInitial()) {
    on<ApplyFilterEvent>(_onApplyFilter);
    on<GetInitialList>(_onGetInitialList);
  }
final StudentRepository studentRepository;

  FutureOr<void> _onApplyFilter(ApplyFilterEvent event, Emitter<FilterState> emit) async {
    emit(Filtering());
    try{
      final list = await studentRepository.applyFiltering(event.filter);
      emit(Filtered(list));
    }catch(e){
      emit(FilterError(e.toString()));
    }
  }



  FutureOr<void> _onGetInitialList(GetInitialList event, Emitter<FilterState> emit)  async{
    emit(Filtering());
    try{
     final initialList = await studentRepository.getInitialList();
     emit(InitialFilter(initialList));
    }catch(e){
      emit(FilterError(e.toString()));
    }
  }

  @override
  void onTransition(Transition<FilterEvent, FilterState> transition) {

    dev.log(transition.toString(), name: "Filter Bloc");
      super.onTransition(transition);


  }
}
