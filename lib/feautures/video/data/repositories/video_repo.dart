import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';

class VideoRepository {
  final CollectionReference _videosCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<Video> addVideo(Video video) async {
    var newVideo = await _videosCollection.add(video.toMap());
    return Video.fromMap(
        (await newVideo.get()).data() as Map<String, dynamic>, newVideo.id);
  }

  Future<void> updateVideo(String id, Video video) async {
    await _videosCollection.doc(id).update(video.toMap());
  }

  Future<Video> getVideo(String id) async {
    DocumentSnapshot doc = await _videosCollection.doc(id).get();
    return Video.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<List<Video>> getAllVideos({int limit = 50, int page = 1}) async {
    QuerySnapshot querySnapshot = await _videosCollection.limit(limit).get();
    return querySnapshot.docs
        .map((doc) => Video.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<void> deleteVideo(String id) async {
    await _videosCollection.doc(id).delete();
  }

  Future<List<Video>> searchVideos({
    String? tag,
    String? description,
    String? ownerId,
  }) async {
    Query query = _videosCollection;

    if (tag != null) {
      query = query.where('tags', arrayContains: tag);
    }

    if (description != null) {
      query = query
          .where('description', isGreaterThanOrEqualTo: description)
          .where('description', isLessThanOrEqualTo: description + '\uf8ff');
    }

    if (ownerId != null) {
      query = query.where('ownerId', isEqualTo: ownerId);
    }

    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs
        .map((doc) => Video.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<List<Video>> getVideosByType(VideoType type) async {
    QuerySnapshot querySnapshot =
        await _videosCollection.where('videoType', isEqualTo: type.index).get();
    return querySnapshot.docs
        .map((doc) => Video.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
