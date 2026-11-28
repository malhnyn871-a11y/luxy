import 'package:flutter/material.dart';
class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});
  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}
class _PrivacyPageState extends State<PrivacyPage> {
  bool isPrivate = false;
  String whoSee = 'الجميع';
  String whoMsg = 'الجميع';
  String whoComment = 'الجميع';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('الخصوصية', style: TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))),
      body: ListView(children: [
        SwitchListTile(title: const Text('حساب خاص', style: TextStyle(color: Colors.white)), subtitle: const Text('بس المتابعين اللي توافق عليهم يشوفون محتواك', style: TextStyle(color: Colors.grey)), value: isPrivate, activeColor: Colors.red, onChanged: (v) => setState(() => isPrivate = v)),
        _row(context, 'من يستطيع رؤية فيديوهاتي', whoSee, (v) => setState(() => whoSee = v)),
        _row(context, 'من يستطيع مراسلتي', whoMsg, (v) => setState(() => whoMsg = v)),
        _blocked(context),
        _row(context, 'من يستطيع التعليق', whoComment, (v) => setState(() => whoComment = v)),
      ]),
    );
  }
  Widget _row(BuildContext context, String title, String current, Function(String) onPick) {
    return ListTile(title: Text(title, style: const TextStyle(color: Colors.white)), subtitle: Text(current, style: const TextStyle(color: Colors.grey)), trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey), onTap: () async { final v = await Navigator.push<String>(context, MaterialPageRoute(builder: (_) => _PickPage(title: title, current: current))); if (v != null) onPick(v); });
  }
  Widget _blocked(BuildContext context) {
    return ListTile(title: const Text('الحسابات المحظورة', style: TextStyle(color: Colors.white)), trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey), onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => const _BlockedPage())); });
  }
}

class _PickPage extends StatefulWidget {
  final String title; final String current;
  const _PickPage({required this.title, required this.current});
  @override
  State<_PickPage> createState() => _PickState();
}
class _PickState extends State<_PickPage> {
  late String v;
  @override
  void initState() { super.initState(); v = widget.current; }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text(widget.title, style: const TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context, v))), body: Column(children: [
      for (final o in ['الجميع', 'الأصدقاء', 'أنا فقط'])
        RadioListTile(value: o, groupValue: v, title: Text(o, style: const TextStyle(color: Colors.white)), activeColor: Colors.red, onChanged: (x) => setState(() => v = x as String)),
      Padding(padding: const EdgeInsets.all(20), child: SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () => Navigator.pop(context, v), child: const Text('حفظ', style: TextStyle(color: Colors.white))))),
    ]));
  }
}

class _BlockedPage extends StatelessWidget {
  const _BlockedPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: const Text('الحسابات المحظورة', style: TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))), body: const Center(child: Text('لا توجد حسابات محظورة', style: TextStyle(color: Colors.grey, fontSize: 16))));
  }
}
