import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../models/user.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _profileDescriptionController = TextEditingController();
  final _twitterController = TextEditingController();
  final _instagramController = TextEditingController();
  final _youtubeController = TextEditingController();
  final _vimeoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    final authProvider = context.read<AuthProvider>();
    final user = authProvider.user;
    
    if (user != null) {
      _displayNameController.text = user.displayName;
      _profileDescriptionController.text = user.profileDescription;
      _twitterController.text = user.socialLinks.twitter ?? '';
      _instagramController.text = user.socialLinks.instagram ?? '';
      _youtubeController.text = user.socialLinks.youtube ?? '';
      _vimeoController.text = user.socialLinks.vimeo ?? '';
    }
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _profileDescriptionController.dispose();
    _twitterController.dispose();
    _instagramController.dispose();
    _youtubeController.dispose();
    _vimeoController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    final currentUser = authProvider.user;
    
    if (currentUser == null) return;

    final updatedUser = currentUser.copyWith(
      displayName: _displayNameController.text.trim(),
      profileDescription: _profileDescriptionController.text.trim(),
      socialLinks: SocialLinks(
        twitter: _twitterController.text.trim().isEmpty 
            ? null 
            : _twitterController.text.trim(),
        instagram: _instagramController.text.trim().isEmpty 
            ? null 
            : _instagramController.text.trim(),
        youtube: _youtubeController.text.trim().isEmpty 
            ? null 
            : _youtubeController.text.trim(),
        vimeo: _vimeoController.text.trim().isEmpty 
            ? null 
            : _vimeoController.text.trim(),
      ),
    );

    final success = await authProvider.updateProfile(updatedUser);

    if (mounted) {
      if (success) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('プロフィールを更新しました'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.error ?? 'プロフィールの更新に失敗しました'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
        backgroundColor: const Color(0xFF009688),
        foregroundColor: Colors.white,
        actions: [
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return TextButton(
                onPressed: authProvider.isLoading ? null : _saveProfile,
                child: const Text(
                  '保存',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (authProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // プロフィール画像（将来実装）
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: authProvider.user?.photoURL != null
                              ? NetworkImage(authProvider.user!.photoURL!)
                              : null,
                          child: authProvider.user?.photoURL == null
                              ? const Icon(Icons.person, size: 50, color: Colors.grey)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF009688),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                              onPressed: () {
                                // TODO: 画像選択機能の実装
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('画像選択機能は今後実装予定です')),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 基本情報
                  Text(
                    '基本情報',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ユーザー名
                  TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      labelText: 'ユーザー名',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'ユーザー名を入力してください';
                      }
                      if (value.trim().length < 2) {
                        return 'ユーザー名は2文字以上で入力してください';
                      }
                      if (value.trim().length > 20) {
                        return 'ユーザー名は20文字以内で入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // 自己紹介
                  TextFormField(
                    controller: _profileDescriptionController,
                    maxLines: 4,
                    maxLength: 200,
                    decoration: const InputDecoration(
                      labelText: '自己紹介',
                      prefixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(),
                      helperText: 'あなたについて教えてください',
                    ),
                  ),
                  const SizedBox(height: 32),

                  // SNSリンク
                  Text(
                    'SNSリンク',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'SNSアカウントをお持ちの場合は、ユーザー名を入力してください',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Twitter
                  TextFormField(
                    controller: _twitterController,
                    decoration: const InputDecoration(
                      labelText: 'Twitter',
                      prefixIcon: Icon(Icons.alternate_email),
                      prefixText: '@',
                      border: OutlineInputBorder(),
                      helperText: 'ユーザー名のみ入力（@マークは不要）',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Instagram
                  TextFormField(
                    controller: _instagramController,
                    decoration: const InputDecoration(
                      labelText: 'Instagram',
                      prefixIcon: Icon(Icons.camera_alt),
                      border: OutlineInputBorder(),
                      helperText: 'ユーザー名を入力',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // YouTube
                  TextFormField(
                    controller: _youtubeController,
                    decoration: const InputDecoration(
                      labelText: 'YouTube',
                      prefixIcon: Icon(Icons.play_circle),
                      border: OutlineInputBorder(),
                      helperText: 'チャンネルIDまたはカスタムURL',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Vimeo
                  TextFormField(
                    controller: _vimeoController,
                    decoration: const InputDecoration(
                      labelText: 'Vimeo',
                      prefixIcon: Icon(Icons.videocam),
                      border: OutlineInputBorder(),
                      helperText: 'ユーザー名を入力',
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}