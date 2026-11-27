import 'package:flutter/material.dart';

void main() {
  runApp(const LuxyApp());
}

class LuxyApp extends StatelessWidget {
  const LuxyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('LUXY', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('شاهد - انشر - استمتع'),
            const SizedBox(height: 30),
            TextField(decoration: InputDecoration(hintText: 'الايميل', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(obscureText: true, decoration: InputDecoration(hintText: 'كلمة السر', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainNav()));
                },
                child: const Text('دخول', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
              },
              child: const Text('انشاء حساب جديد', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('انشاء حساب')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: 'الاسم', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(decoration: InputDecoration(hintText: 'الايميل', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(obscureText: true, decoration: InputDecoration(hintText: 'كلمة السر', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainNav()));
                },
                child: const Text('انشاء الحساب', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int idx = 0;
  final pages = [
    const ReelsScreen(),
    const DiscoverScreen(),
    const UploadScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            idx = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'اكتشاف'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'رفع'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'الرسائل'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});
  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  int likes1 = 1240;
  bool liked1 = false;
  int likes2 = 890;
  bool liked2 = false;
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        _reel('بارو', '@baro', 'اول فيديو بلوكسي', Colors.deepPurple, likes1, liked1, () {
          setState(() {
            liked1 = !liked1;
            if (liked1) {
              likes1++;
            } else {
              likes1--;
            }
          });
        }),
        _reel('سارة', '@sara', 'يومياتي', Colors.teal, likes2, liked2, () {
          setState(() {
            liked2 = !liked2;
            if (liked2) {
              likes2++;
            } else {
              likes2--;
            }
          });
        }),
      ],
    );
  }

  Widget _reel(String name, String user, String desc, Color color, int likes, bool liked, VoidCallback onLike) {
    return Stack(
      children: [
        Container(
          color: color,
          child: const Center(
            child: Icon(Icons.play_circle_fill, size: 80, color: Colors.white60),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 90,
          child: Column(
            children: [
              CircleAvatar(radius: 27, child: Text(name[0])),
              const SizedBox(height: 18),
              IconButton(
                onPressed: onLike,
                icon: Icon(liked ? Icons.favorite : Icons.favorite, color: liked ? Colors.red : Colors.white, size: 44),
              ),
              Text('$likes', style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 12),
              IconButton(onPressed: () { showCommentsSheet(context); }, icon: Stack(alignment: Alignment.center, children: [const Icon(Icons.chat_bubble, color: Colors.white, size: 38), Row(mainAxisSize: MainAxisSize.min, children: [Container(width: 4, height: 4, decoration: const BoxDecoration(color: Color(0xFF555555), shape: BoxShape.circle)), const SizedBox(width: 2), Container(width: 4, height: 4, decoration: const BoxDecoration(color: Color(0xFF555555), shape: BoxShape.circle)), const SizedBox(width: 2), Container(width: 4, height: 4, decoration: const BoxDecoration(color: Color(0xFF555555), shape: BoxShape.circle))])])),
              const Text('تعليق', style: TextStyle(color: Colors.white, fontSize: 11)),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
              const SaveButton(),
              IconButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('مشاركة'))); }, icon: const Icon(Icons.reply, color: Colors.white, size: 44)),
              const Text('مشاركة', style: TextStyle(color: Colors.white, fontSize: 11)),
            ],
          ),
        ),
        Positioned(
          left: 12,
          right: 75,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 6),
              Text(desc, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اكتشاف')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: 12,
        itemBuilder: (context, i) {
          return Container(
            color: Colors.primaries[i % Colors.primaries.length],
            child: Center(
              child: Text('ريل ${i + 1}', style: const TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('رفع فيديو')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(16)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.video_library, size: 60, color: Colors.grey),
                  SizedBox(height: 10),
                  Text('اختر فيديو او سجل جديد', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(decoration: InputDecoration(hintText: 'اكتب وصف الفيديو', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Text('نشر', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرسائل')),
      body: ListView(
        children: const [
          ListTile(leading: CircleAvatar(child: Text('س')), title: Text('سارة'), subtitle: Text('هلو شلونك؟')),
          ListTile(leading: CircleAvatar(child: Text('ع')), title: Text('علي'), subtitle: Text('شفت الفيديو الجديد؟')),
          ListTile(leading: CircleAvatar(child: Text('ل')), title: Text('لوكسي'), subtitle: Text('اهلا بيك بلوكسي')),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('@baro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(3), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE11D2E), width: 2.5)), child: const CircleAvatar(radius: 55, backgroundColor: Colors.white, child: Text('B', style: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 10),
          const Text('بارو', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('@baro', style: TextStyle(color: Colors.grey)),
            const Text('CONTENT_CREATOR', style: TextStyle(color: Colors.white70, fontSize: 13)),
            const SizedBox(height: 4),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [Text('12', style: TextStyle(fontWeight: FontWeight.bold)), Text('متابعة')]),
              Column(children: [Text('1.2K', style: TextStyle(fontWeight: FontWeight.bold)), Text('متابع')]),
              Column(children: [Text('5.4K', style: TextStyle(fontWeight: FontWeight.bold)), Text('اعجاب')]),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            child: const Text('تعديل الملف', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          const LuxyProfileTabs(),
            Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 6),
              itemCount: 6,
              itemBuilder: (context, i) {
                return Container(
                  color: Colors.primaries[i % Colors.primaries.length],
                  child: Center(
                    child: Text('فيديو ${i + 1}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notif = true;
  bool dark = true;
  String lang = 'العربية';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الاعدادات')),
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.person), title: Text('ادارة الحساب'), subtitle: Text('الاسم، الايميل، رقم الهاتف')),
          ListTile(leading: Icon(Icons.lock), title: Text('الخصوصية والامان'), subtitle: Text('كلمة السر، التحقق بخطوتين')),
          SwitchListTile(
            title: const Text('التنبيهات'),
            subtitle: const Text('تنبيهات اللايك والتعليق'),
            value: notif,
            activeColor: Colors.red,
            onChanged: (v) {
              setState(() {
                notif = v;
              });
            },
          ),
          SwitchListTile(
            title: const Text('الوضع الليلي'),
            value: dark,
            activeColor: Colors.red,
            onChanged: (v) {
              setState(() {
                dark = v;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('اللغة'),
            subtitle: Text(lang),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('اختر اللغة'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('العربية'),
                          onTap: () {
                            setState(() {
                              lang = 'العربية';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('English'),
                          onTap: () {
                            setState(() {
                              lang = 'English';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          ListTile(leading: Icon(Icons.info), title: Text('حول لوكسي'), subtitle: Text('النسخة 1.0.0')),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                },
                child: const Text('تسجيل الخروج', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SaveButton extends StatefulWidget {
  const SaveButton({super.key});
  @override State<SaveButton> createState() => _SaveButtonState();
}
class _SaveButtonState extends State<SaveButton> {
  bool saved = false;
  int count = 35;
  @override Widget build(BuildContext context) {
    return Column(children: [IconButton(onPressed: () { setState(() { saved = !saved; count += saved ? 1 : -1; }); }, icon: Icon(saved ? Icons.bookmark : Icons.bookmark, color: saved ? Colors.yellow : Colors.white, size: 44)), Text('$count', style: const TextStyle(color: Colors.white)), const Text('حفظ', style: TextStyle(color: Colors.white, fontSize: 11))]);
  }
}



void showCommentsSheet(BuildContext context) {
  List<Map<String, dynamic>> comments = [{'name': 'سارة', 'text': 'عاشت ايدك', 'time': 'قبل 10 دقائق', 'likes': 12, 'liked': false}];
  TextEditingController ctrl = TextEditingController();
  showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.grey[900], shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))), builder: (ctx) {
    return StatefulBuilder(builder: (ctx2, setState) {
      return Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(ctx2).viewInsets.bottom, left: 16, right: 16, top: 16), child: Column(mainAxisSize: MainAxisSize.min, children: [Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10))), const SizedBox(height: 12), const Text('التعليقات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)), const SizedBox(height: 12), SizedBox(height: 250, child: ListView.builder(itemCount: comments.length, itemBuilder: (c, i) { return ListTile(leading: CircleAvatar(child: Text(comments[i]['name'][0])), title: Text(comments[i]['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(comments[i]['text'], style: const TextStyle(color: Colors.white)), const SizedBox(height: 4), Row(children: [Text(comments[i]['time'], style: const TextStyle(color: Colors.white54, fontSize: 11)), const SizedBox(width: 12), GestureDetector(onTap: () { setState(() { ctrl.text = '@${comments[i]['name']} '; }); }, child: const Text('رد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)))])]), trailing: GestureDetector(onTap: () { setState(() { comments[i]['liked'] = !comments[i]['liked']; comments[i]['likes'] += comments[i]['liked'] ? 1 : -1; }); }, child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.favorite, color: comments[i]['liked'] ? Colors.red : Colors.white, size: 18), Text('${comments[i]['likes']}', style: const TextStyle(color: Colors.white, fontSize: 11))]))); })), const SizedBox(height: 8), Row(children: [Expanded(child: TextField(controller: ctrl, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(hintText: 'اكتب تعليق...', hintStyle: TextStyle(color: Colors.white54), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25)))))), const SizedBox(width: 8), GestureDetector(onTap: () { if (ctrl.text.trim().isNotEmpty) { setState(() { comments.add({'name': 'انت', 'text': ctrl.text.trim(), 'time': 'الآن', 'likes': 0, 'liked': false}); ctrl.clear(); }); } }, child: Container(padding: const EdgeInsets.all(12), decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle), child: const Icon(Icons.send, color: Colors.white, size: 20)))])]));
    });
  });
}






class LuxyProfileTabs extends StatefulWidget {
  const LuxyProfileTabs({super.key});
  @override State<LuxyProfileTabs> createState() => _LuxyProfileTabsState();
}
class _LuxyProfileTabsState extends State<LuxyProfileTabs> {
  int selected = 0;
  final List<Map<String, dynamic>> tabs = [
    {'icon': Icons.grid_on, 'label': 'فيديوهات'},
    {'icon': Icons.favorite, 'label': 'لايكات'},
    {'icon': Icons.bookmark, 'label': 'محفوظات'},
    {'icon': Icons.lock, 'label': 'خاص'},
    {'icon': Icons.repeat, 'label': 'إعادة'},
  ];
  @override Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: const Color(0xFF111111), borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.white12, width: 0.5)), child: Row(children: List.generate(tabs.length, (i) {
      bool active = selected == i;
      return Expanded(child: GestureDetector(onTap: () { setState(() { selected = i; }); }, child: Container(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2), decoration: BoxDecoration(color: active ? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(26)), child: Column(mainAxisSize: MainAxisSize.min, children: [Row(mainAxisSize: MainAxisSize.min, children: [Icon(tabs[i]['icon'], color: active ? Colors.black : Colors.white, size: 16), const SizedBox(width: 3), Text(tabs[i]['label'], style: TextStyle(color: active ? Colors.black : Colors.white, fontWeight: FontWeight.bold, fontSize: 11))]), if (active) Container(margin: const EdgeInsets.only(top: 4), width: 5, height: 5, decoration: const BoxDecoration(color: Color(0xFFE11D2E), shape: BoxShape.circle))]))));
    })));
  }
}
