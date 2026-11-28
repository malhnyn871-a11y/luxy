import 'package:flutter/material.dart';
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  State<EditProfilePage> createState() => _EditState();
}
class _EditState extends State<EditProfilePage> {
  final nameC = TextEditingController(text: 'محمد التميمي');
  final userC = TextEditingController(text: '@m_fb2');
  final bioC = TextEditingController(text: 'تابعني راح اشوفك هواي شغلات حلوة كوميدي، تحشيش، الشهر الأول');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('تعديل الملف الشخصي', style: TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
        Container(padding: const EdgeInsets.all(3), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 2)), child: const CircleAvatar(radius: 40, backgroundColor: Colors.red, child: Text('م', style: TextStyle(color: Colors.white, fontSize: 32)))),
        const SizedBox(height: 10),
        const Text('تغيير الصورة', style: TextStyle(color: Colors.red)),
        const SizedBox(height: 20),
        _field('الاسم', nameC),
        const SizedBox(height: 15),
        _field('اسم المستخدم', userC),
        const SizedBox(height: 15),
        _field('النبذة', bioC, maxLines: 3),
        const SizedBox(height: 20),
        SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ التعديل'), backgroundColor: Colors.red)); Navigator.pop(context); }, child: const Text('حفظ', style: TextStyle(color: Colors.white)))),
      ])),
    );
  }
  Widget _field(String label, TextEditingController c, {int maxLines = 1}) {
    return TextField(controller: c, maxLines: maxLines, style: const TextStyle(color: Colors.white), decoration: InputDecoration(labelText: label, labelStyle: const TextStyle(color: Colors.grey), enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)), focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red))));
  }
}
