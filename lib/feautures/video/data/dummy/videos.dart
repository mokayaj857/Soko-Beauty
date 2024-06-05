import 'package:soko_beauty/feautures/video/data/models/comment.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/data/models/video_type.dart';

List<Video> fetchDummyData() {
  return [
    Video(
      id: 1,
      url:
          'https://firebasestorage.googleapis.com/v0/b/sokobeauty-20bb2.appspot.com/o/videos%2FAfro%20to%20Curls%20Tutorial%20%23afro%20%23afrohair%20%23hair.mp4?alt=media&token=00fcef3e-e043-4ad8-a019-7267d2053a11',
      videoType: VideoType.Service,
      associatedItemId: 101,
      comments: [
        Comment(
            userId: 'user1',
            text: 'Great tutorial!',
            timestamp: DateTime.now()),
        Comment(
            userId: 'user2',
            text: 'I love this hairstyle.',
            timestamp: DateTime.now().subtract(Duration(minutes: 30))),
      ],
      likes: ['user1', 'user3', 'user5'],
      shares: ['user2', 'user4'],
      likeCount: 3,
      shareCount: 2,
      ownerId: '@joycebeauty',
      tags: ['hair', 'tutorial', 'beauty'],
      description:
          'Learn how to create a beautiful hairstyle with this tutorial.',
    ),
    Video(
      id: 2,
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      videoType: VideoType.Product,
      associatedItemId: 201,
      comments: [
        Comment(
            userId: 'user3',
            text: 'This lipstick color is amazing!',
            timestamp: DateTime.now().subtract(Duration(hours: 1))),
        Comment(
            userId: 'user1',
            text: 'Where can I buy this product?',
            timestamp: DateTime.now().subtract(Duration(hours: 2))),
      ],
      likes: ['user2', 'user4'],
      shares: ['user3'],
      likeCount: 2,
      shareCount: 1,
      ownerId: '@dukatech',
      tags: ['makeup', 'lipstick', 'beauty'],
      description: 'Check out this gorgeous lipstick color review.',
    ),
    Video(
      id: 3,
      url:
          'https://player.vimeo.com/external/517090081.hd.mp4?s=41698e1dec8310a33d49620e58eacab0589913da&profile_id=169&oauth2_token_id=57447761',
      videoType: VideoType.Service,
      associatedItemId: 102,
      comments: [
        Comment(
            userId: '@decorate',
            text: 'Amazing spa experience!',
            timestamp: DateTime.now().subtract(Duration(days: 1))),
        Comment(
            userId: 'user3',
            text: 'I want to try this treatment!',
            timestamp: DateTime.now().subtract(Duration(days: 2))),
      ],
      likes: ['user1', 'user3'],
      shares: ['user2', 'user4'],
      likeCount: 2,
      shareCount: 2,
      ownerId: 'user3',
      tags: ['spa', 'treatment', 'relaxation'],
      description:
          'Experience the ultimate spa day with this relaxing treatment.',
    ),
    Video(
      id: 4,
      url:
          'https://player.vimeo.com/external/459389137.hd.mp4?s=964e360f6996936b708905b2fcf9bdd66c26de0d&profile_id=170&oauth2_token_id=57447761',
      videoType: VideoType.Product,
      associatedItemId: 202,
      comments: [
        Comment(
            userId: 'user1',
            text: 'The skincare routine is fantastic!',
            timestamp: DateTime.now().subtract(Duration(days: 3))),
        Comment(
            userId: 'user2',
            text: 'Where can I find these products?',
            timestamp: DateTime.now().subtract(Duration(days: 4))),
      ],
      likes: ['user3', 'user5'],
      shares: ['user1'],
      likeCount: 2,
      shareCount: 1,
      ownerId: 'user4',
      tags: ['skincare', 'routine', 'beauty'],
      description: 'Discover an effective skincare routine for radiant skin.',
    ),
    Video(
      id: 5,
      url: 'https://example.com/video5',
      videoType: VideoType.Service,
      associatedItemId: 103,
      comments: [
        Comment(
            userId: 'user3',
            text: 'The hair treatment looks so good!',
            timestamp: DateTime.now().subtract(Duration(days: 5))),
        Comment(
            userId: 'user1',
            text: 'I need to book an appointment!',
            timestamp: DateTime.now().subtract(Duration(days: 6))),
      ],
      likes: ['user2', 'user4', 'user5'],
      shares: ['user3', 'user1'],
      likeCount: 3,
      shareCount: 2,
      ownerId: 'user2',
      tags: ['hair', 'treatment', 'salon'],
      description: 'Experience a rejuvenating hair treatment at our salon.',
    ),
    Video(
      id: 6,
      url: 'https://example.com/video6',
      videoType: VideoType.Product,
      associatedItemId: 203,
      comments: [
        Comment(
            userId: 'user2',
            text: 'The eyeshadow palette is stunning!',
            timestamp: DateTime.now().subtract(Duration(days: 7))),
        Comment(
            userId: 'user3',
            text: 'I just ordered it online!',
            timestamp: DateTime.now().subtract(Duration(days: 8))),
      ],
      likes: ['user1', 'user4'],
      shares: ['user2', 'user3'],
      likeCount: 2,
      shareCount: 2,
      ownerId: 'user5',
      tags: ['makeup', 'eyeshadow', 'beauty'],
      description:
          'Unbox and explore the colors of our latest eyeshadow palette.',
    ),
    Video(
      id: 7,
      url: 'https://example.com/video7',
      videoType: VideoType.Service,
      associatedItemId: 104,
      comments: [
        Comment(
            userId: 'user1',
            text: 'The massage therapy is heavenly!',
            timestamp: DateTime.now().subtract(Duration(days: 9))),
        Comment(
            userId: 'user2',
            text: 'I need a spa day!',
            timestamp: DateTime.now().subtract(Duration(days: 10))),
      ],
      likes: ['user3', 'user5'],
      shares: ['user1'],
      likeCount: 2,
      shareCount: 1,
      ownerId: 'user4',
      tags: ['spa', 'massage', 'relaxation'],
      description:
          'Indulge in a luxurious massage therapy for ultimate relaxation.',
    ),
    Video(
      id: 8,
      url: 'https://example.com/video8',
      videoType: VideoType.Product,
      associatedItemId: 204,
      comments: [
        Comment(
            userId: 'user3',
            text: 'This hairdryer is a game-changer!',
            timestamp: DateTime.now().subtract(Duration(days: 11))),
        Comment(
            userId: 'user1',
            text: 'Adding it to my wishlist!',
            timestamp: DateTime.now().subtract(Duration(days: 12))),
      ],
      likes: ['user2', 'user4', 'user5'],
      shares: ['user3'],
      likeCount: 3,
      shareCount: 1,
      ownerId: 'user2',
      tags: ['hair', 'styling', 'beauty'],
      description:
          'Experience fast and efficient hair drying with our latest hairdryer.',
    ),
    Video(
      id: 9,
      url: 'https://example.com/video9',
      videoType: VideoType.Service,
      associatedItemId: 105,
      comments: [
        Comment(
            userId: 'user2',
            text: 'I love the makeup artist\'s skills!',
            timestamp: DateTime.now().subtract(Duration(days: 13))),
        Comment(
            userId: 'user3',
            text: 'Can\'t wait to try these techniques!',
            timestamp: DateTime.now().subtract(Duration(days: 14))),
      ],
      likes: ['user1', 'user4'],
      shares: ['user2', 'user3'],
      likeCount: 2,
      shareCount: 2,
      ownerId: 'user5',
      tags: ['makeup', 'artist', 'tutorial'],
      description:
          'Learn pro makeup techniques from our skilled makeup artist.',
    ),
    Video(
      id: 10,
      url: 'https://example.com/video10',
      videoType: VideoType.Product,
      associatedItemId: 205,
      comments: [
        Comment(
            userId: 'user1',
            text: 'This skincare brand is my favorite!',
            timestamp: DateTime.now().subtract(Duration(days: 15))),
        Comment(
            userId: 'user2',
            text: 'I use their products daily!',
            timestamp: DateTime.now().subtract(Duration(days: 16))),
      ],
      likes: ['user3', 'user5'],
      shares: ['user1'],
      likeCount: 2,
      shareCount: 1,
      ownerId: 'user4',
      tags: ['skincare', 'products', 'beauty'],
      description: 'Discover the magic of our bestselling skincare products.',
    ),
    // Add more dummy data...
  ];
}





































// final List<Map<String, dynamic>> allVideos = [
//   {
//     "url":
//         
//   },
//   {
//     "url":
//         "",
//   },
//   {
//     "url":
//         "",
//   },
//   {
//     "url":
//         "https://player.vimeo.com/external/517090081.hd.mp4?s=41698e1dec8310a33d49620e58eacab0589913da&profile_id=169&oauth2_token_id=57447761",
//   },
//   {
//     "url":
//         "https://player.vimeo.com/external/296210754.hd.mp4?s=08c03c14c04f15d65901f25b542eb2305090a3d7&profile_id=175&oauth2_token_id=57447761",
//   },
//   {
//     "url":
//         "https://player.vimeo.com/external/459389137.hd.mp4?s=964e360f6996936b708905b2fcf9bdd66c26de0d&profile_id=170&oauth2_token_id=57447761",
//   },
//   {
//     "url":
//         "https://player.vimeo.com/external/517090081.hd.mp4?s=41698e1dec8310a33d49620e58eacab0589913da&profile_id=169&oauth2_token_id=57447761",
//   },
// ];
// import 'package:soko_beauty/models/video/comment.dart';
// import 'package:soko_beauty/models/video/video_type.dart';




