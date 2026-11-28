import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final String title;
  final Color color;
  const StoryPage({super.key, required this.title, required this.color});
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int likes = 120;
  bool liked = false;
  int views = 350;
  final TextEditingController replyCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() { views = views + 1; });
    });
  }

  void toggleLike() {
    setState(() {
      if (liked) { liked = false; likes = likes - 1; } else { liked = true; likes = likes + 1; }
    });
  }

  void sendReply() {
    if (replyCtrl.text.trim().isEmpty) return;
    final msg = replyCtrl.text.trim();
    replyCtrl.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم ارسال: ' + msg), backgroundColor: Colors.red));
  }

  void showDotsMenu() {
    showModalBottomSheet(context: context, builder: (_) => Container(padding: const EdgeInsets.all(16), child: Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(leading: const Icon(Icons.delete, color: Colors.red), title: const Text('حذف القصة', style: TextStyle(color: Colors.red)), onTap: () { Navigator.pop(context); deleteStory(); }),
      ListTile(leading: const Icon(Icons.close), title: const Text('الغاء'), onTap: () => Navigator.pop(context)),
    ])));
  }

  void deleteStory() {
    showDialog(context: context, builder: (_) => AlertDialog(title: const Text('حذف القصة'), content: Text('هل تريد حذف قصة ' + widget.title + ' ؟'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('الغاء')), TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context, true); }, child: const Text('نعم حذف', style: TextStyle(color: Colors.red)))]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0, leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)), title: Row(children: [CircleAvatar(backgroundColor: Colors.white, child: Text('م', style: TextStyle(color: widget.color, fontWeight: FontWeight.bold)), radius: 22), const SizedBox(width: 8), const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('محمد التميمي', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)), Text('رياضة', style: TextStyle(color: Colors.white70, fontSize: 12))])]), actions: [IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: showDotsMenu)]),
      body: Column(children: [
        Expanded(child: Center(child: Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold)))),
        Container(padding: const EdgeInsets.all(12), color: Colors.black, child: Row(children: [
          GestureDetector(onTap: toggleLike, child: Row(children: [Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.white, size: 32), const SizedBox(width: 6), Text(likes.toString() + ' اعجاب', style: const TextStyle(color: Colors.white, fontSize: 16))])),
          const SizedBox(width: 20),
          Row(children: [const Icon(Icons.visibility, color: Colors.white, size: 30), const SizedBox(width: 6), Text(views.toString() + ' مشاهدة', style: const TextStyle(color: Colors.white, fontSize: 16))]),
        ])),
        Container(padding: const EdgeInsets.all(10), color: Colors.black, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(padding: EdgeInsets.only(bottom: 8, right: 8), child: Text('رد على ستوريك', style: TextStyle(color: Colors.white54, fontSize: 14))),
          Row(children: [
            Expanded(child: TextField(controller: replyCtrl, style: const TextStyle(color: Colors.white), decoration: InputDecoration(hintText: 'رد على ستوريك...', hintStyle: const TextStyle(color: Colors.white54), filled: true, fillColor: Colors.white24, border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)))),
            const SizedBox(width: 8),
            GestureDetector(onTap: sendReply, child: Container(width: 44, height: 44, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle), child: const Icon(Icons.send, color: Colors.white, size: 22))),
          ]),
        ])),
      ]),
    );
  }
}
