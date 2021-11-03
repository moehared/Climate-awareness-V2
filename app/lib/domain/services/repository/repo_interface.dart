// this class must be implemented by concrete classess
abstract class RepositoryInterface<T> {
  Future<void> delete(T data);
  Future<void> read(T data);
  Future<void> update(T data);
  Future<void> create(T data);
<<<<<<< HEAD


=======
>>>>>>> 005a3d416b2de21dac6b3ba3170f8571a8954938
}
