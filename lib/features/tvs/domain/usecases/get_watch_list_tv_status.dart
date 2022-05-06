import '../repositories/tv_repository.dart';

class GetWatchListTvStatus {
  TVRepository repository;

  GetWatchListTvStatus({required this.repository});

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
