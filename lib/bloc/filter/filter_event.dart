part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
  @override
  List<Object?> get props => [];
}

class ApplyFilterEvent extends FilterEvent{

  final Student filter;

 const ApplyFilterEvent(this.filter);
  @override
  List<Object?> get props => [filter];
}

class GetInitialList extends FilterEvent{

}

