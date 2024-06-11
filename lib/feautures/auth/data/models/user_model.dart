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
  final List<String> shops;
  final List<String> followers;
  final List<String> following;
  final List<String> posts;

  // Computed fields
  bool get isVendor => shops.isNotEmpty;
  int get postsCount => posts.length;
  int get followersCount => followers.length;
  int get followingCount => following.length;

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
    List<String>? shops,
    List<String>? followers,
    List<String>? following,
    List<String>? posts,
    List<String>? likedPosts,
  })  : this.shops = shops ?? [],
        this.followers = followers ?? [],
        this.following = following ?? [],
        this.posts = posts ?? [];

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
      shops: List<String>.from(data['shops'] ?? []),
      followers: List<String>.from(data['followers'] ?? []),
      following: List<String>.from(data['following'] ?? []),
      posts: List<String>.from(data['posts'] ?? []),
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
      'shops': shops,
      'followers': followers,
      'following': following,
      'posts': posts,
    };
  }
}
