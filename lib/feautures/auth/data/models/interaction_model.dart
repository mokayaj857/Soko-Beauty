// import 'package:cloud_firestore/cloud_firestore.dart';

// class Interaction {
  

//   factory Interaction.fromDocument(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Interaction(
//       id: doc.id,
//       fromUserId: data['fromUserId'],
//       toUserId: data['toUserId'],
//       type: data['type'],
//       postId: data['postId'],
//       timestamp: data['timestamp'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'fromUserId': fromUserId,
//       'toUserId': toUserId,
//       'type': type,
//       'postId': postId,
//       'timestamp': timestamp,
//     };
//   }
// }
