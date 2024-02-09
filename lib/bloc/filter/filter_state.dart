part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();
  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {}

class Filtering extends FilterState{

}

class Filtered extends FilterState{
 final List<Student> students;

 const Filtered(this.students);
 @override
 List<Object> get props => [students];
}

class FilterError extends FilterState{
  final String message;

  const FilterError(this.message);
  @override
  List<Object> get props => [message];
}

class InitialFilter extends FilterState{
  final List<Student> initialList;
  const InitialFilter(this.initialList);
  @override
  List<Object> get props => [initialList];
}