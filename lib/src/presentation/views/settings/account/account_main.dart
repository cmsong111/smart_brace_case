import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_brace_case/src/presentation/providers/firebase_auth_service.dart';

class AccountMainPage extends StatelessWidget {
  const AccountMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => FirebaseAuthService(),
        child: ListView(
          children: [
            SizedBox(
              height: 215,
              width: 215,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        Provider.of<FirebaseAuthService>(context)
                            .currentUser!
                            .photoURL!),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 75,
                    child: RawMaterialButton(
                      onPressed: () {
                        _showProfilePictureDialog(context);
                      },
                      elevation: 2.0,
                      fillColor: const Color(0xFFF5F6F9),
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("이름"),
              subtitle: Text(Provider.of<FirebaseAuthService>(context)
                  .currentUser!
                  .displayName!),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _showNameChangeDialog(context);
                },
              ),
            ),
            ListTile(
              title: const Text("이메일"),
              subtitle: Text(Provider.of<FirebaseAuthService>(context)
                  .currentUser!
                  .email!),
            ),
            ListTile(
              title: const Text("전화번호"),
              subtitle: Text(Provider.of<FirebaseAuthService>(context)
                      .currentUser!
                      .phoneNumber ??
                  "미기입"),
            ),
          ],
        ),
      ),
    );
  }
}

void _showNameChangeDialog(BuildContext context) {
  TextEditingController _nameController = TextEditingController();
  FirebaseAuthService auth =
      Provider.of<FirebaseAuthService>(context, listen: false);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("이름 변경"),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "이름",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("취소"),
          ),
          TextButton(
            onPressed: () {
              auth.currentUser!
                  .updateDisplayName(_nameController.text.trim().toString());
              Navigator.pop(context);
            },
            child: const Text("확인"),
          ),
        ],
      );
    },
  );
}

void _showProfilePictureDialog(BuildContext context) {
  TextEditingController _nameController = TextEditingController();
  FirebaseAuthService auth =
      Provider.of<FirebaseAuthService>(context, listen: false);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("프로필 사진 변경"),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "사진 URL",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("취소"),
          ),
          TextButton(
            onPressed: () {
              auth.currentUser!
                  .updatePhotoURL(_nameController.text.trim().toString());
              Navigator.pop(context);
            },
            child: const Text("확인"),
          ),
        ],
      );
    },
  );
}
