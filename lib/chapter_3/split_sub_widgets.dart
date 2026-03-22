// Widget cha
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hồ sơ cá nhân')),
      body: const Column(
        children: [ProfileHeader(), ProfileStats(), ProfileActions()],
      ),
    );
  }
}

// Widget con 1
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Row(
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nguyễn Văn A', style: TextStyle(fontSize: 20)),
              Text('Flutter Developer'),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget con 2
class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStat('Bài viết', '25'),
        _buildStat('Người theo dõi', '1.2K'),
        _buildStat('Đang theo dõi', '180'),
      ],
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }
}

// Widget con 3
class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Theo dõi')),
          OutlinedButton(onPressed: () {}, child: const Text('Nhắn tin')),
        ],
      ),
    );
  }
}
