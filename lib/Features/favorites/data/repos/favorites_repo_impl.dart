import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviebox/Features/favorites/data/repos/favorites_repo.dart';
import 'package:moviebox/Features/home/data/models/movie_model.dart';
import 'package:moviebox/core/errors/firestore_error_handler.dart';
import 'package:moviebox/core/networking/api_result.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  FavoritesRepoImpl(this._firestore, this._firebaseAuth);

  CollectionReference<Map<String, dynamic>> _favoritesCollection() {
    final uid = _firebaseAuth.currentUser!.uid;

    return _firestore.collection('users').doc(uid).collection('favorites');
  }

  @override
  Future<ApiResult<void>> addFavorite(MovieModel movie) async {
    try {
      await _favoritesCollection().doc(movie.id.toString()).set(movie.toJson());

      return Success(null);
    } catch (e) {
      return Failure(FirebaseErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> removeFavorite(int movieId) async {
    try {
      await _favoritesCollection().doc(movieId.toString()).delete();

      return Success(null);
    } catch (e) {
      return Failure(FirebaseErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<List<MovieModel>>> getFavorites() async {
    try {
      final snapshot = await _favoritesCollection().get();

      final movies = snapshot.docs
          .map((doc) => MovieModel.fromJson(doc.data()))
          .toList();

      return Success(movies);
    } catch (e) {
      return Failure(FirebaseErrorHandler.handle(e));
    }
  }
}
