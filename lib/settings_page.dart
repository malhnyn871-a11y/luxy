import 'package:flutter/material.dart';
import 'privacy_page.dart';
import 'account_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('الإعدادات', style: TextStyle(color: Colors.white)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        children: [
          _item(context, Icons.person, 'الحساب', const AccountPage()),
          _item(context, Icons.security, 'الأمان', const AccountPage()),
          _item(context, Icons.lock, 'الخصوصية', const PrivacyPage()),
          _item(context, Icons.notifications, 'الإشعارات', const _SimplePage(title: 'الإشعارات')),
          _item(context, Icons.language, 'اللغة', const _SimplePage(title: 'اللغة')),
          _item(context, Icons.dark_mode, 'المظهر', const _SimplePage(title: 'المظهر')),
          _item(context, Icons.storage, 'التخزين والبيانات', const _SimplePage(title: 'التخزين والبيانات')),
          _item(context, Icons.help, 'المساعدة', const _SimplePage(title: 'المساعدة')),
          _item(context, Icons.info, 'حول التطبيق', const _SimplePage(title: 'حول التطبيق')),
          _item(context, Icons.switch_account, 'تبديل الحساب', const _SimplePage(title: 'تبديل الحساب')),
          _item(context, Icons.logout, 'تسجيل الخروج', const _SimplePage(title: 'تسجيل الخروج'), isRed: true),
        ],
      ),
    );
  }
  Widget _item(BuildContext context, IconData icon, String title, Widget? page, {bool isRed = false}) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : Colors.white),
      title: Text(title, style: TextStyle(color: isRed ? Colors.red : Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        }
      },
    );
  }
}


class _SimplePage extends StatelessWidget {
  final String title;
  const _SimplePage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text(title, style: const TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))),
      body: Center(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20))),
    );
  }
}
