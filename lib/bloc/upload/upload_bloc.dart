import 'dart:async';
import 'package:atmiya_community/repositories/student_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc({required this.studentRepository}) : super(UploadInitial()) {
  on<UploadFile>(_onUploadFile);
  }
  final StudentRepository studentRepository;


  FutureOr<void> _onUploadFile(UploadFile event, Emitter<UploadState> emit ) {
    emit(Uploading());
    studentRepository.pickAndUploadFiles();
    emit(Uploaded());

  }
}
