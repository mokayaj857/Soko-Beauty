import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String phoneNumber;
  final String? fname;
  final String? lname;
  final String? bio;
  final String? gender;
  final DateTime? dob;
  final DateTime? createdAt;
  final String? profilePhotoUrl;
  final UserStats stats;

  bool get isVendor => stats.shops > 0;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.phoneNumber,
    this.fname,
    this.lname,
    this.bio,
    this.gender,
    this.dob,
    this.createdAt,
    this.profilePhotoUrl,
    UserStats? stats, 
  }) : this.stats = stats ?? UserStats.zero(); 

  static UserModel fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserModel(
      id: doc.id,
      email: data['email'],
      username: data['username'],
      fname: data['fname'],
      lname: data['lname'],
      bio: data['bio'],
      gender: data['gender'],
      dob: data['dob'] != null ? (data['dob'] as Timestamp).toDate() : null,
      createdAt: data['createdAt'] != null
          ? (data['createdAt'] as Timestamp).toDate()
          : null,
      profilePhotoUrl: data['profilePhotoUrl'],
      phoneNumber: data['phoneNumber'] ?? '',
      stats: UserStats.fromMap(data['stats'] ?? {}), 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'fname': fname,
      'lname': lname,
      'bio': bio,
      'gender': gender,
      'dob': dob,
      'createdAt': createdAt,
      'profilePhotoUrl': profilePhotoUrl,
      'phoneNumber': phoneNumber,
      'isVendor': isVendor,
      'stats': stats.toMap(),
    };
  }
}

class UserStats {
  final int shops;
  final int followers;
  final int following;
  final int posts;
  final int likedPosts;

  UserStats({
    required this.shops,
    required this.followers,
    required this.following,
    required this.posts,
    required this.likedPosts,
  });

  factory UserStats.zero() {
    return UserStats(
      shops: 0,
      followers: 0,
      following: 0,
      posts: 0,
      likedPosts: 0,
    );
  }

  static UserStats fromMap(Map<String, dynamic> map) {
    return UserStats(
      shops: map['shops'] ?? 0,
      followers: map['followers'] ?? 0,
      following: map['following'] ?? 0,
      posts: map['posts'] ?? 0,
      likedPosts: map['likedPosts'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'shops': shops,
      'followers': followers,
      'following': following,
      'posts': posts,
      'likedPosts': likedPosts,
    };
  }
}
