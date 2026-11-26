import 'package:flutter/material.dart';
void main() { runApp(const LuxyApp()); }

class LuxyApp extends StatelessWidget {
  const LuxyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black), home: const LoginScreen());
  }
}

// شاشة الدخول
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('LUXY', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold, letterSpacing: 4)),
          const SizedBox(height: 8),
          const Text('شاهد، انشر، استمتع', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 40),
          TextField(decoration: InputDecoration(hintText: 'رقم الهاتف أو الإيميل', filled: true, fillColor: Colors.grey[900], border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
          const SizedBox(height: 12),
          TextField(obscureText: true, decoration: InputDecoration(hintText: 'كلمة السر', filled: true, fillColor: Colors.grey[900], border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ReelsScreen())); }, child: const Text('دخول', style: TextStyle(color: Colors.white, fontSize: 18)))),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: OutlinedButton(style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ReelsScreen())); }, child: const Text('دخول بحساب گوگل', style: TextStyle(color: Colors.white)))),
          const SizedBox(height: 16),
          const Text('ما عندك حساب؟ انشاء حساب جديد', style: TextStyle(color: Colors.grey)),
        ]),
      ),
    );
  }
}

// بيانات الريل
class Reel {
  final String name; final String username; final String desc; final Color color; bool liked; int likes; final List<String> comments;
  Reel({required this.name, required this.username, required this.desc, required this.color, this.liked = false, required this.likes, required this.comments});
}

// شاشة الريلز
class ReelsScreen extends StatefulWidget { const ReelsScreen({super.key}); @override State<ReelsScreen> createState() => _ReelsScreenState(); }
class _ReelsScreenState extends State<ReelsScreen> {
  final List<Reel> reels = [
    Reel(name: 'بارو', username: '@baro', desc: 'أول فيديو بلوكسي 🔥 #لوكسي #عراق', color: Colors.deepPurple, likes: 1240, comments: ['عاشت ايدك', 'وين هالمكان؟']),
    Reel(name: 'سارة', username: '@sara', desc: 'يومياتي بالمحمودية ❤️', color: Colors.teal, likes: 890, comments: ['حلوو', 'استمري']),
    Reel(name: 'علي', username: '@ali', desc: 'تحدي جديد! منو يكدر يسويها؟', color: Colors.orange, likes: 2100, comments: ['اني اكدر', 'قوي']),
  ];
  void openComments(Reel reel) {
    final ctrl = TextEditingController();
    showModalBottomSheet(context: context, backgroundColor: Colors.grey[900], shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))), builder: (_) => StatefulBuilder(builder: (ctx, setStateSheet) => Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom), child: Column(children: [
      const Padding(padding: EdgeInsets.all(12), child: Text('التعليقات', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
      Expanded(child: ListView.builder(itemCount: reel.comments.length, itemBuilder: (_, i) => ListTile(leading: const CircleAvatar(child: Icon(Icons.person)), title: Text(reel.comments[i])))),
      Padding(padding: const EdgeInsets.all(8), child: Row(children: [Expanded(child: TextField(controller: ctrl, decoration: InputDecoration(hintText: 'اكتب تعليق...', filled: true, fillColor: Colors.black, border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))))), IconButton(icon: const Icon(Icons.send, color: Colors.red), onPressed: () { if (ctrl.text.isNotEmpty) { setStateSheet(() { reel.comments.add(ctrl.text); }); setState(() {}); ctrl.clear(); } })])),
    ]))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PageView.builder(scrollDirection: Axis.vertical, itemCount: reels.length, itemBuilder: (context, index) {
      final r = reels[index];
      return Stack(children: [
        Container(color: r.color, child: const Center(child: Icon(Icons.play_circle_fill, size: 80, color: Colors.white70))),
        Positioned(right: 12, bottom: 90, child: Column(children: [
          Stack(alignment: Alignment.bottomCenter, children: [CircleAvatar(radius: 26, backgroundColor: Colors.white, child: Text(r.name[0], style: const TextStyle(fontSize: 24, color: Colors.black))), Positioned(bottom: 0, child: Container(decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle), child: const Icon(Icons.add, size: 16, color: Colors.white)))]),
          const SizedBox(height: 18),
          IconButton(onPressed: () { setState(() { r.liked = !r.liked; r.likes += r.liked ? 1 : -1; }); }, icon: Icon(r.liked ? Icons.favorite : Icons.favorite_border, color: r.liked ? Colors.red : Colors.white, size: 32)),
          Text('${r.likes}', style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 12),
          IconButton(onPressed: () => openComments(r), icon: const Icon(Icons.comment, color: Colors.white, size: 30)),
          Text('${r.comments.length}', style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 12),
          const Icon(Icons.share, color: Colors.white, size: 28),
          const Text('مشاركة', style: TextStyle(color: Colors.white, fontSize: 11)),
        ])),
        Positioned(left: 12, right: 70, bottom: 20, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(r.username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 6),
          Text(r.desc, style: const TextStyle(color: Colors.white)),
        ])),
        Positioned(top: 50, left: 0, right: 0, child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Text('متابعة  |  ', style: TextStyle(color: Colors.grey)), Text('لك  ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]))),
      ]);
    }));
  }
}
