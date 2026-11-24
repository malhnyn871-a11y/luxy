import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try { await Firebase.initializeApp(); } catch (_) {}
  runApp(const LuxyApp());
}

class LuxyApp extends StatelessWidget {
  const LuxyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(backgroundColor: Colors.black, body: Center(child: CircularProgressIndicator(color: Colors.red)));
        }
        if (snap.data != null) {
          return Scaffold(backgroundColor: Colors.black, body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('اهلا ${snap.data!.email}', style: const TextStyle(color: Colors.white, fontSize: 18)), const SizedBox(height: 20), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black), onPressed: () async => await FirebaseAuth.instance.signOut(), child: const Text('تسجيل خروج'))])));
        }
        return const LoginScreen();
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final nameC = TextEditingController();
  bool isLogin = true;
  bool loading = false;
  String err = '';

  Future<void> submit() async {
    setState(() { loading = true; err = ''; });
    try {
      if (isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailC.text.trim(), password: passC.text.trim());
      } else {
        final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailC.text.trim(), password: passC.text.trim());
        await cred.user!.updateDisplayName(nameC.text.trim());
      }
    } on FirebaseAuthException catch (e) {
      setState(() { err = e.message ?? 'خطأ بالدخول'; });
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('LUXY', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w900, letterSpacing: 4)),
          Container(margin: const EdgeInsets.only(top: 6, bottom: 30), height: 4, width: 60, color: Colors.red),
          if (!isLogin) TextField(controller: nameC, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(hintText: 'الاسم', hintStyle: TextStyle(color: Colors.white54), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)))),
          TextField(controller: emailC, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(hintText: 'الايميل', hintStyle: TextStyle(color: Colors.white54), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)))),
          TextField(controller: passC, obscureText: true, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(hintText: 'كلمة السر', hintStyle: TextStyle(color: Colors.white54), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)))),
          if (err.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 12), child: Text(err, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red))),
          const SizedBox(height: 24),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)), onPressed: loading ? null : submit, child: Text(loading ? 'جاري...' : (isLogin ? 'دخول' : 'انشاء حساب')))),
          TextButton(onPressed: () => setState(() => isLogin = !isLogin), child: Text(isLogin ? 'ماعندك حساب؟ انشاء حساب' : 'عندك حساب؟ دخول', style: const TextStyle(color: Colors.white70))),
        ]),
      ),
    );
  }
}
