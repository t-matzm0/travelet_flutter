import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'itinerary_list_screen.dart';
import 'itinerary_detail_screen.dart';
import 'search_screen.dart';
import 'login_screen.dart';
import 'profile_edit_screen.dart';
import '../models/spot.dart';
import '../models/itinerary.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  final List<Spot> spots;
  final List<Itinerary> itineraries;

  const HomeScreen({super.key, required this.spots, required this.itineraries});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    // 画面のリスト
    final List<Widget> pages = [
      // ホームタブ
      HomeTab(
        itineraries: widget.itineraries,
        onSearchTap: () {
          setState(() => _selectedIndex = 1);
        },
      ),
      // 検索タブ
      const SearchScreen(),
      // プランタブ
      ItineraryListScreen(itineraries: widget.itineraries),
      // マイページタブ
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'ホーム',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: '検索',
          ),
          NavigationDestination(
            icon: Icon(Icons.route_outlined),
            selectedIcon: Icon(Icons.route),
            label: 'プラン',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'マイページ',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 2
          ? FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('プラン作成機能は準備中です')),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

// ホームタブの内容
class HomeTab extends StatelessWidget {
  final List<Itinerary> itineraries;
  final VoidCallback onSearchTap;

  const HomeTab({
    super.key,
    required this.itineraries,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ヘッダー
        SliverAppBar(
          expandedHeight: 200,
          floating: false,
          pinned: true,
          backgroundColor: const Color(0xFF009688),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF00BCD4),
                    Color(0xFF009688),
                  ],
                ),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    // ロゴ（左上）
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.travel_explore,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'travelet',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 中央のキャッチコピー
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'どこへ行きたい？',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '今から行ける旅を見つけよう',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // 検索バー
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: onSearchTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      '場所、キーワード、所要時間で検索',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // 人気のプランセクション
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '人気のプラン',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // プラン一覧
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index >= itineraries.length) return null;
              final itinerary = itineraries[index];
              return PlanCard(itinerary: itinerary);
            },
            childCount: itineraries.length > 3 ? 3 : itineraries.length,
          ),
        ),

        // 余白
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}

// プランカード
class PlanCard extends StatelessWidget {
  final Itinerary itinerary;

  const PlanCard({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    final spotNames = itinerary.points.map((p) => p.spot.name).toList();
    final representativeImage = itinerary.representativeImageUrl ??
        (itinerary.points.isNotEmpty && 
         itinerary.points.first.spot.photos.isNotEmpty
            ? itinerary.points.first.spot.photos.first
            : null);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ItineraryDetailScreen(itinerary: itinerary),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // 画像
              if (representativeImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    representativeImage,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
                  ),
                )
              else
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.route, color: Colors.grey),
                ),
              const SizedBox(width: 16),
              
              // コンテンツ
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itinerary.title.isNotEmpty 
                          ? itinerary.title 
                          : 'タイトル未設定',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      spotNames.join(' → '),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 16,
                          color: itinerary.likedByMe ? Colors.red : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${itinerary.likes}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 16),
                        Icon(Icons.place, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${itinerary.points.length}スポット',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = authProvider.user;
        final isAuthenticated = user != null;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 180,
                floating: false,
                pinned: true,
                backgroundColor: const Color(0xFF009688),
                actions: isAuthenticated
                    ? [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ProfileEditScreen(),
                              ),
                            );
                          },
                        ),
                      ]
                    : null,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF00BCD4),
                          Color(0xFF009688),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage: user?.photoURL != null
                                ? NetworkImage(user!.photoURL!)
                                : null,
                            child: user?.photoURL == null
                                ? const Icon(Icons.person, size: 50, color: Colors.grey)
                                : null,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            isAuthenticated ? user.displayName : 'ゲストユーザー',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isAuthenticated
                                ? user.profileDescription.isEmpty
                                    ? '自己紹介を追加しましょう'
                                    : user.profileDescription
                                : 'ログインして全機能を利用する',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    
                    // 認証済みユーザーの場合のメニュー
                    if (isAuthenticated) ...[
                      // SNSリンク（設定されている場合）
                      if (user.socialLinks.twitter != null ||
                          user.socialLinks.instagram != null ||
                          user.socialLinks.youtube != null ||
                          user.socialLinks.vimeo != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'SNS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      if (user.socialLinks.twitter != null)
                                        IconButton(
                                          icon: const Icon(Icons.alternate_email),
                                          onPressed: () {
                                            // TODO: URLを開く
                                          },
                                        ),
                                      if (user.socialLinks.instagram != null)
                                        IconButton(
                                          icon: const Icon(Icons.camera_alt),
                                          onPressed: () {
                                            // TODO: URLを開く
                                          },
                                        ),
                                      if (user.socialLinks.youtube != null)
                                        IconButton(
                                          icon: const Icon(Icons.play_circle),
                                          onPressed: () {
                                            // TODO: URLを開く
                                          },
                                        ),
                                      if (user.socialLinks.vimeo != null)
                                        IconButton(
                                          icon: const Icon(Icons.videocam),
                                          onPressed: () {
                                            // TODO: URLを開く
                                          },
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 8),
                    ],

                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('お気に入り'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        if (isAuthenticated) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('お気に入り機能は準備中です')),
                          );
                        } else {
                          _showLoginPrompt(context);
                        }
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('閲覧履歴'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        if (isAuthenticated) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('履歴機能は準備中です')),
                          );
                        } else {
                          _showLoginPrompt(context);
                        }
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('設定'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('設定機能は準備中です')),
                        );
                      },
                    ),
                    const Divider(),

                    // 認証状態に応じたアクション
                    if (isAuthenticated) ...[
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text(
                          'ログアウト',
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          _showLogoutDialog(context, authProvider);
                        },
                      ),
                    ] else ...[
                      // ログイン促進
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Card(
                          color: Colors.blue[50],
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.info_outline,
                                  color: Colors.blue,
                                  size: 32,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'アカウントを作成すると',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '・プランの保存\n・お気に入り機能\n・投稿機能\nが利用できます',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(height: 1.5),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text('ログイン・新規登録'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLoginPrompt(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('この機能を使用するにはログインが必要です'),
        action: SnackBarAction(
          label: 'ログイン',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthProvider authProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ログアウト'),
          content: const Text('ログアウトしますか？'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await authProvider.signOut();
              },
              child: const Text('ログアウト'),
            ),
          ],
        );
      },
    );
  }
}