import 'package:flutter/material.dart';
class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});
  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}
class _PrivacyPageState extends State<PrivacyPage> {
  bool isPrivate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('الخصوصية', style: TextStyle(color: Colors.white)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('حساب خاص', style: TextStyle(color: Colors.white)),
            subtitle: const Text('بس المتابعين اللي توافق عليهم يشوفون محتواك', style: TextStyle(color: Colors.grey)),
            value: isPrivate,
            activeColor: Colors.red,
            onChanged: (v) => setState(() => isPrivate = v),
          ),
          _row('من يستطيع رؤية فيديوهاتي', 'الجميع'),
          _row('من يستطيع مراسلتي', 'الجميع'),
          _row('الحسابات المحظورة', ''),
          _row('من يستطيع التعليق', 'الجميع'),
        ],
      ),
    );
  }
  Widget _row(String title, String sub) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: sub.isEmpty ? null : Text(sub, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {},
    );
  }
}
