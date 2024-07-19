import 'dart:convert';
import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../../../core/utils/app_strings.dart';

class AmaChatScreen extends StatelessWidget {
  const AmaChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatPage();
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  List<types.Message> _loadMessages() {
    final messages = (jsonDecode(jsonEncode(test)) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    return messages;
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.appName.tr(context)),
            elevation: 0,
            centerTitle: true,
          ),
          body: Chat(
            messages: _loadMessages(),
            onAttachmentPressed: () async {},
            // onMessageTap: ,
            // onPreviewDataFetched: ,
            onSendPressed: (message) {},
            showUserAvatars: true,
            showUserNames: true,
            user: const types.User(id: '56416146161'),
          ),
        ),
      );
}

final test = [
  {
    "author": {
      "firstName": "John",
      "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca",
      "lastName": "Doe"
    },
    "createdAt": 1655648404000,
    "id": "c67ed376-52bf-4d4e-ba2a-7a0f8467b22a",
    "status": "seen",
    "text": "Ooowww ☺️",
    "type": "text"
  },
  {
    "author": {
      "firstName": "Janice",
      "id": "e52552f4-835d-4dbe-ba77-b076e659774d",
      "imageUrl":
          "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d",
      "lastName": "King"
    },
    "createdAt": 1655648403000,
    "height": 1280,
    "id": "02797655-4d73-402e-a319-50fde79e2bc4",
    "name": "madrid",
    "size": 585000,
    "status": "seen",
    "type": "image",
    "uri": "https://images.unsplash.com/photo-1539037116277-4db20889f2d4",
    "width": 1920
  },
  {
    "author": {
      "firstName": "Janice",
      "id": "e52552f4-835d-4dbe-ba77-b076e659774d",
      "imageUrl":
          "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d",
      "lastName": "King"
    },
    "createdAt": 1655648402000,
    "id": "4e048753-2d60-4144-bc28-9967050aaf12",
    "status": "seen",
    "text": "What a ~nice~ _wonderful_ sunset! 😻",
    "type": "text"
  },
  {
    "author": {
      "firstName": "Matthew",
      "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac",
      "lastName": "White"
    },
    "createdAt": 1655648401000,
    "id": "64747b28-df19-4a0c-8c47-316dc3546e3c",
    "status": "seen",
    "text": "Here you go buddy! 💪",
    "type": "text"
  },
  {
    "author": {
      "firstName": "Matthew",
      "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac",
      "lastName": "White"
    },
    "createdAt": 1655648400000,
    "id": "6a1a4351-cf05-4d0c-9d0f-47ed378b6112",
    "mimeType": "application/pdf",
    "name": "city_guide-madrid.pdf",
    "size": 10550000,
    "status": "seen",
    "type": "file",
    "uri":
        "https://www.esmadrid.com/sites/default/files/documentos/madrid_imprescindible_2016_ing_web_0.pdf"
  },
  {
    "author": {
      "firstName": "John",
      "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca",
      "lastName": "Doe"
    },
    "createdAt": 1655624464000,
    "id": "38681a33-2563-42aa-957b-cfc12f791d16",
    "status": "seen",
    "text": "Matt, where is my Madrid guide?",
    "type": "text"
  },
  {
    "author": {
      "firstName": "Matthew",
      "id": "82091008-a484-4a89-ae75-a22bf8d6f3ac",
      "lastName": "White"
    },
    "createdAt": 1655624463000,
    "id": "113bb2e8-f74e-42cd-aa30-4085a0f52c58",
    "status": "seen",
    "text": "Awesome! 😍",
    "type": "text"
  },
  {
    "author": {
      "firstName": "Janice",
      "id": "e52552f4-835d-4dbe-ba77-b076e659774d",
      "imageUrl":
          "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d",
      "lastName": "King"
    },
    "createdAt": 1655624462000,
    "id": "22212d42-1252-4641-9786-d6f83b2ce4a8",
    "status": "seen",
    "text": "Matt, what do you think?",
    "type": "text"
  },
  {
    "author": {
      "firstName": "Janice",
      "id": "e52552f4-835d-4dbe-ba77-b076e659774d",
      "imageUrl":
          "https://i.pravatar.cc/300?u=e52552f4-835d-4dbe-ba77-b076e659774d",
      "lastName": "King"
    },
    "createdAt": 1655624461000,
    "id": "afc2269a-374b-4382-8864-b3b60d1e8cd7",
    "status": "seen",
    "text": "Yeah! Together with Demna, Mark Hamill and others 🥰",
    "type": "text"
  },
  {
    "author": {
      "firstName": "John",
      "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca",
      "lastName": "Doe"
    },
    "createdAt": 1655624460000,
    "id": "634b2f0b-2486-4bfe-b36d-1c7d6313c7b3",
    "status": "seen",
    "text":
        "Guys! Did you know Imagine Dragons became ambassadors for u24.gov.ua ?",
    "type": "text"
  }
];
