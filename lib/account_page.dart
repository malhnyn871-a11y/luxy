import 'package:flutter/material.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('الحساب', style: TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))),
      body: Column(children: [
        const SizedBox(height: 20),
        Container(padding: const EdgeInsets.all(3), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 2)), child: const CircleAvatar(radius: 40, backgroundColor: Colors.red, child: Text('م', style: TextStyle(color: Colors.white, fontSize: 32)))),
        const SizedBox(height: 10),
        const Text('محمد التميمي', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const Text('@m_fb2', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
        _row(context, 'تغيير كلمة السر', const _PassPage()),
        _row(context, 'إضافة رقم هاتف', const _PhonePage()),
        _row(context, 'البريد الإلكتروني', const _EmailPage()),
        _row(context, 'حذف الحساب', const _DeletePage(), isRed: true),
        const SizedBox(height: 20),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم الحفظ'), backgroundColor: Colors.red)); }, child: const Text('حفظ', style: TextStyle(color: Colors.white))))),
      ]),
    );
  }
  Widget _row(BuildContext context, String title, Widget page, {bool isRed = false}) {
    return ListTile(title: Text(title, style: TextStyle(color: isRed ? Colors.red : Colors.white)), trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey), onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => page)); });
  }
}

class _Base extends StatelessWidget {
  final String title; final Widget child;
  const _Base({required this.title, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text(title, style: const TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))), body: Padding(padding: const EdgeInsets.all(20), child: child));
  }
}

class _PassPage extends StatelessWidget { const _PassPage(); @override Widget build(BuildContext context) { return _Base(title: 'تغيير كلمة السر', child: Column(children: [const TextField(style: TextStyle(color: Colors.white), obscureText: true, decoration: InputDecoration(labelText: 'كلمة السر القديمة', labelStyle: TextStyle(color: Colors.grey), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)))), const SizedBox(height: 15), const TextField(style: TextStyle(color: Colors.white), obscureText: true, decoration: InputDecoration(labelText: 'كلمة السر الجديدة', labelStyle: TextStyle(color: Colors.grey), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)))), const SizedBox(height: 20), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ كلمة السر'), backgroundColor: Colors.red)); Navigator.pop(context); }, child: const Text('حفظ', style: TextStyle(color: Colors.white))))])); } }

class _PhonePage extends StatelessWidget { const _PhonePage(); @override Widget build(BuildContext context) { return _Base(title: 'إضافة رقم هاتف', child: Column(children: [const TextField(style: TextStyle(color: Colors.white), keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: 'رقم الهاتف', hintText: '0780 000 0000', hintStyle: TextStyle(color: Colors.grey), labelStyle: TextStyle(color: Colors.grey), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)))), const SizedBox(height: 20), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ رقم الهاتف'), backgroundColor: Colors.red)); Navigator.pop(context); }, child: const Text('حفظ', style: TextStyle(color: Colors.white))))])); } }

class _EmailPage extends StatelessWidget { const _EmailPage(); @override Widget build(BuildContext context) { return _Base(title: 'البريد الإلكتروني', child: Column(children: [const TextField(style: TextStyle(color: Colors.white), keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: 'البريد الإلكتروني', hintText: 'example@gmail.com', hintStyle: TextStyle(color: Colors.grey), labelStyle: TextStyle(color: Colors.grey), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)))), const SizedBox(height: 20), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ البريد'), backgroundColor: Colors.red)); Navigator.pop(context); }, child: const Text('حفظ', style: TextStyle(color: Colors.white))))])); } }

class _DeletePage extends StatelessWidget { const _DeletePage(); @override Widget build(BuildContext context) { return _Base(title: 'حذف الحساب', child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('متأكد تريد حذف الحساب؟', style: TextStyle(color: Colors.white, fontSize: 18)), const SizedBox(height: 10), const Text('هذا الإجراء لا يمكن التراجع عنه', style: TextStyle(color: Colors.grey)), const SizedBox(height: 20), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم طلب حذف الحساب'), backgroundColor: Colors.red)); Navigator.pop(context); }, child: const Text('حذف الحساب', style: TextStyle(color: Colors.white))))])); } }
