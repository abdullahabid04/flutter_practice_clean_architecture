import 'package:practice_clean_architecture/constants/error_messages.dart';
import 'package:practice_clean_architecture/core/errors/failures/failures.dart';

List<String> mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return [
        SERVER_FAILURE_TITLE,
        SERVER_FAILURE_MESSAGE,
      ];
    case CacheFailure:
      return [
        CACHE_FAILURE_TITLE,
        CACHE_FAILURE_MESSAGE,
      ];
    case GenericFailure:
      return [
        GENERAL_FAILURE_TITLE,
        GENERAL_FAILURE_MESSAGE,
      ];
    case InvalidCredentialsFailure:
      return [
        INVALID_EMAIL_OR_PASSWORD_TITLE,
        INVALID_EMAIL_OR_PASSWORD_MESSAGE,
      ];
    case UserNotCreatedFailure:
      return [
        USER_NOT_CREATED_TITLE,
        USER_NOT_CREATED_MESSAGE,
      ];
    case UserNotVerifiedFailure:
      return [
        USER_NOT_VERIFIED_TITLE,
        USER_NOT_VERIFIED_MESSAGE,
      ];
    case NoInternetConnectionFailure:
      return [
        NO_INTERNET_CONNECTION_TITLE,
        NO_INTERNET_CONNECTION_MESSAGE,
      ];
    default:
      return [
        INVALID_ERROR_TITLE,
        INVALID_ERROR_MESSAGE,
      ];
  }
}
