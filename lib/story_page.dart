import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final String title;
  final Color color;
  const StoryPage({super.key, required this.title, required this.color});
  @override
  State<StoryPage> createState() => _StoryState();
}
class _StoryState extends State<StoryPage> {
  bool liked = false;
  int likes = 120;
  int views = 350;
  final TextEditingController replyC = TextEditingController();
  void toggleLike() { setState(() { liked = !liked; likes += liked ? 1 : -1; }); }
  void sendReply() {
    if (replyC.text.trim().isEmpty) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم ارسال رد على ستوريك: ' + replyC.text), backgroundColor: Colors.red));
    replyC.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)), title: Row(children: [CircleAvatar(backgroundColor: widget.color, child: const Text('م', style: TextStyle(color: Colors.white))), const SizedBox(width: 10), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('محمد التميمي', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)), Text(widget.title, style: const TextStyle(color: Colors.grey, fontSize: 12))])]), actions: [IconButton(icon: const Icon(Icons.more_horiz, color: Colors.white), onPressed: () {})]),
      body: Column(children: [
        Expanded(child: Container(color: widget.color, alignment: Alignment.center, child: Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)))),
        Padding(padding: const EdgeInsets.all(12), child: Row(children: [GestureDetector(onTap: toggleLike, child: Row(children: [Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.red : Colors.white, size: 28), const SizedBox(width: 6), Text('$likes اعجاب', style: const TextStyle(color: Colors.white))])), const SizedBox(width: 20), Row(children: [const Icon(Icons.visibility, color: Colors.white, size: 24), const SizedBox(width: 6), Text('$views مشاهدة', style: const TextStyle(color: Colors.white))])])),
        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(12)), margin: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('رد على ستوريك', style: TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(height: 8), Row(children: [Expanded(child: TextField(controller: replyC, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(hintText: 'رد على ستوريك...', hintStyle: TextStyle(color: Colors.grey), border: InputBorder.none))), IconButton(icon: const Icon(Icons.send, color: Colors.red), onPressed: sendReply)])])),
      ]),
    );
  }
}
