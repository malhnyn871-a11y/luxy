import 'package:flutter/material.dart';

class LuxyProfilePage extends StatefulWidget {
  LuxyProfilePage({super.key});
  @override
  State<LuxyProfilePage> createState() => _LuxyProfilePageState();
}

class _LuxyProfilePageState extends State<LuxyProfilePage> {
  bool isFollowing = false;

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 1)),
    );
  }

  Widget highlightImg(String label, String sub, String img) {
    return GestureDetector(
      onTap: () => showMsg("ستوري $label"),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            Text(sub, style: TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget videoCard(String img, String views) {
    return GestureDetector(
      onTap: () => showMsg("تشغيل فيديو $views"),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(img, fit: BoxFit.cover),
          Positioned(
            bottom: 6,
            left: 6,
            child: Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.white, size: 14),
                Text(views, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            bottom: 6,
            right: 6,
            child: Text("0:32", style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => showMsg("رجوع")),
        title: Text("Luxy", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.add, color: Colors.black), onPressed: () => showMsg("اضافة")),
          IconButton(icon: Icon(Icons.more_horiz, color: Colors.black), onPressed: () => showMsg("القائمة")),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage("https://picsum.photos/300/300?random=99"), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
            Text("Muhammad Al-Tamimi", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("@m_fb2", style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => showMsg("المتابعون"), child: Column(children: [Text("1.2M", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text("Followers", style: TextStyle(color: Colors.grey))])),
                GestureDetector(onTap: () => showMsg("المتابعون"), child: Column(children: [Text("842", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text("Following", style: TextStyle(color: Colors.grey))])),
                GestureDetector(onTap: () => showMsg("الاعجابات"), child: Column(children: [Text("5.6M", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text("Likes", style: TextStyle(color: Colors.grey))])),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() { isFollowing = !isFollowing; });
                        showMsg(isFollowing ? "تمت المتابعة" : "تم الغاء المتابعة");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(color: isFollowing ? Colors.grey[200] : Colors.red, borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text(isFollowing ? "Following" : "Follow", style: TextStyle(color: isFollowing ? Colors.black : Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => showMsg("الرسائل"),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text("Message", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("مبدع محتوى | سفر واسلوب حياة", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text("Sharing my moments & lifestyle daily", style: TextStyle(fontSize: 14)),
                  Text("Dubai - UAE", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 85,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  highlightImg("سفر", "Travel", "https://picsum.photos/200/200?random=11"),
                  highlightImg("طعام", "Food", "https://picsum.photos/200/200?random=12"),
                  highlightImg("أزياء", "Fashion", "https://picsum.photos/200/200?random=13"),
                  highlightImg("يوميات", "Daily", "https://picsum.photos/200/200?random=14"),
                  highlightImg("رياضة", "Sports", "https://picsum.photos/200/200?random=15"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.grid_on, color: Colors.red),
                Icon(Icons.video_library_outlined, color: Colors.grey),
                Icon(Icons.bookmark_border, color: Colors.grey),
              ],
            ),
            Divider(),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.75,
              children: [
                videoCard("https://picsum.photos/300/400?random=21", "12.4K"),
                videoCard("https://picsum.photos/300/400?random=22", "88.2K"),
                videoCard("https://picsum.photos/300/400?random=23", "34.1K"),
                videoCard("https://picsum.photos/300/400?random=24", "102K"),
                videoCard("https://picsum.photos/300/400?random=25", "56.7K"),
                videoCard("https://picsum.photos/300/400?random=26", "45.3K"),
                videoCard("https://picsum.photos/300/400?random=27", "23.9K"),
                videoCard("https://picsum.photos/300/400?random=28", "76.5K"),
                videoCard("https://picsum.photos/300/400?random=29", "64.0K"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
