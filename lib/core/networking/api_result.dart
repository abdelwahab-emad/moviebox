sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult {
  final T data;

  Success(this.data);
}

class Failure extends ApiResult {
  final String message;

  Failure(this.message);
}