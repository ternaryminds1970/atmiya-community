part of 'upload_bloc.dart';

abstract class UploadState extends Equatable {
  const UploadState();

  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}

class Uploading extends UploadState {}

class Uploaded extends UploadState {}

class UploadError extends UploadState {
  final String message;

  const UploadError(this.message);

  @override
  List<Object> get props => [message];
}
