// this class must be implemented by concrete classess
abstract class RepositoryInterface<T> {
  Future<void> delete(T data);
  Future<void> read(T data);
  Future<void> update(T data);
  Future<void> create(T data);
}
