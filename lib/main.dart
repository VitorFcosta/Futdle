import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:futdle/game_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MainAppTest());
}

class MainAppTest extends StatelessWidget {
  const MainAppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.jetBrainsMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class FutdleHomePage extends StatefulWidget {
  const FutdleHomePage({super.key});

  @override
  State<FutdleHomePage> createState() => _FutdleHomePageState();
}

class _FutdleHomePageState extends State<FutdleHomePage> {
  bool _isLoading = false;
  final GameManager _gameManager = GameManager();

  void _drawPlayer() async {
    setState(() {
      _isLoading = true;
    });

    try {
       print('Buscando dados na API...');
       await _gameManager.randomPlayer();

       if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text('Jogador sorteado com sucesso! Salvo no banco.'),
             backgroundColor: Colors.green,
           ),
         );
       }
    } catch (e) {
       if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text(e.toString()), 
             backgroundColor: Colors.red,
           ),
         );
       }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste FutDle: Melhorado'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: _isLoading 
          ? const CircularProgressIndicator(color: Colors.green,)
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.black,
              ),
              onPressed: _drawPlayer,
              child: const Text(
                'Puxar Jogador e Salvar no Firebase',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
      ),
    );
  }
}