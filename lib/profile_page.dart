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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => showMsg("القائمة"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () => showMsg("التنبيهات"),
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.black),
            onPressed: () => showMsg("تعديل الملف"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 3),
              ),
              child: Center(
                child: Text("م", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 8),
            Text("محمد التميمي", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("@m_fb2", style: TextStyle(color: Colors.black54)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("153 متابع"),
                Text("4217 متابعون"),
                Text("106 الف اعجاب"),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFollowing = !isFollowing;
                        });
                        showMsg(isFollowing ? "تمت المتابعة" : "تم الغاء المتابعة");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isFollowing ? Colors.grey[200] : Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            isFollowing ? "Following" : "Follow",
                            style: TextStyle(
                              color: isFollowing ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => showMsg("سجل المشاهدة"),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text("سجل المشاهدة")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => showMsg("ستوري سفر"), child: Text("سفر")),
                GestureDetector(onTap: () => showMsg("ستوري طعام"), child: Text("طعام")),
                GestureDetector(onTap: () => showMsg("ستوري ازياء"), child: Text("ازياء")),
                GestureDetector(onTap: () => showMsg("ستوري يوميات"), child: Text("يوميات")),
                GestureDetector(onTap: () => showMsg("ستوري رياضة"), child: Text("رياضة")),
              ],
            ),
            SizedBox(height: 12),
            Divider(),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              children: [
                GestureDetector(onTap: () => showMsg("تشغيل فيديو 1"), child: Container(color: Colors.red, child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)))),
                GestureDetector(onTap: () => showMsg("تشغيل فيديو 2"), child: Container(color: Colors.pink, child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)))),
                GestureDetector(onTap: () => showMsg("تشغيل فيديو 3"), child: Container(color: Colors.purple, child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)))),
                GestureDetector(onTap: () => showMsg("تشغيل فيديو 4"), child: Container(color: Colors.blue, child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)))),
                GestureDetector(onTap: () => showMsg("تشغيل فيديو 5"), child: Container(color: Colors.orange, child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)))),
                GestureDetector(onTap: () => showMsg("تشغيل فيديو 6"), child: Container(color: Colors.teal, child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
