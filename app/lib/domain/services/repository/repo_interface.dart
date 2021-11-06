// this class must be implemented by concrete classess
abstract class RepositoryInterface<T> {
  Future<void> delete(String id);
  Future<T> read(String id);
  Future<void> update(T data);
  Future<void> create(T data);
}
