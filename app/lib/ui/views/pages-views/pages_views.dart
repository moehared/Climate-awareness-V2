import 'package:app/ui/views/chat-view/chat-view.dart';
import 'package:app/ui/views/community-view/community_view.dart';
import 'package:app/ui/views/forum-view/forum-posts.dart';
import 'package:app/ui/views/location-view/location-view.dart';
import 'package:app/ui/views/profile-view/profile-view.dart';
import 'package:flutter/material.dart';

List<Map<String, Widget>> views = [
  {
    'page': CommunityView(),
  },
  {
    'page': ChatView(),
  },
  {
    'page': LocationView(),
  },
  {
    'page': ForumView(),
  },
  {
    'page': ProfileView(),
  },
];
