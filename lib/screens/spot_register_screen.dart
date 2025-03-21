import 'package:flutter/material.dart';
import 'spot_list_screen.dart'; // スポットリストページ

class SpotRegisterScreen extends StatefulWidget {
  @override
  _SpotRegisterScreenState createState() => _SpotRegisterScreenState();
}

class _SpotRegisterScreenState extends State<SpotRegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _selectedCategory;
  List<String> _categories = ['公園', '飲食店', '美術館'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('スポット登録')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'スポット名'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: '住所'),
            ),
            DropdownButton<String>(
              value: _selectedCategory,
              hint: Text('カテゴリを選択'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items:
                  _categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                // 保存ボタンの処理（仮データ表示など）
                print('スポット名: ${_nameController.text}');
                print('住所: ${_addressController.text}');
                print('カテゴリ: $_selectedCategory');
              },
              child: Text('保存'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // スポットリスト画面への遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpotListScreen(),
                  ), // 遷移先の画面
                );
              },
              child: Text('スポットリストに移動'),
            ),
          ],
        ),
      ),
    );
  }
}
