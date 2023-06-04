import 'package:flutter/material.dart';
import 'package:pcet_placements/presentation/theme/app_colors.dart';
import 'package:pcet_placements/presentation/user/widgets/app_text_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage(
                  'assets/images/default_profile.png',
                ),
                backgroundColor: Colors.white.withOpacity(0.4),
                radius: 40,
              ),
            ),
            _spacer(),
            AppTextField(
              controller: _nameController,
              textColor: Colors.black,
              hintText: 'Name',
            ),
            _spacer(),
            AppTextField(
              controller: _emailController,
              textColor: Colors.black,
              hintText: 'Email',
            ),
            _spacer(),
          ],
        ),
      ),
    );
  }

  SizedBox _spacer() {
    return const SizedBox(
      height: 16,
    );
  }
}
