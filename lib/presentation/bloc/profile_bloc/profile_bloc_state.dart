part of 'profile_bloc_cubit.dart';

@immutable
abstract class ProfileBlocState {}

class ProfileBlocInitial extends ProfileBlocState {}
class UpdateImageState extends ProfileBlocState {}
class DeleteImageState extends ProfileBlocState {}
class LoadingProfileState extends ProfileBlocState {}
class SuccessProfileState extends ProfileBlocState {}
class ErrorProfileState extends ProfileBlocState {
  final String error;
  ErrorProfileState(this.error);
}

class UpdateLanguageState extends ProfileBlocState{}
class LogoutState extends ProfileBlocState{}
