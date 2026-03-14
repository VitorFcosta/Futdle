import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:futdle/game_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Pacote que esconde nossa chave
import 'firebase_options.dart'; // Arquivo gerado pelo FlutterFire


void main() async {
  // Garante que o Flutter está pronto antes de chamar pacotes assíncronos
  WidgetsFlutterBinding.ensureInitialized();
  
  // Carrega o arquivo .env pra memória logo quando o app abre
  await dotenv.load(fileName: ".env");

  // Inicializa o Firebase conectando com o seu projeto na nuvem
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MeuAppDeTeste());
}

class MeuAppDeTeste extends StatefulWidget {
  const MeuAppDeTeste({super.key});

  @override
  State<MeuAppDeTeste> createState() => _MeuAppDeTesteState();
}

class _MeuAppDeTesteState extends State<MeuAppDeTeste> {
  // Variável que diz para a tela se o botão está carregando ou não
  bool _isLoading = false;

  void _sortearJogador() async {
    setState(() {
      _isLoading = true; // Ativar a "bolinha girando"
    });

    try {
       print('Buscando dados na API...');
       final manager = GameManager();
       await manager.randonplayer();

       // Se chegou aqui e não caiu no catch, é porque deu tudo certo!
       if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text('Jogador sorteado com sucesso! Salvo no banco.'),
             backgroundColor: Colors.green,
           ),
         );
       }
    } catch (e) {
       // Se o GameManager der um throw Exception(), nós capturamos aqui
       if (mounted) {
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text(e.toString().replaceAll('Exception: ', '')), // Limpa a string pro usuario
             backgroundColor: Colors.red,
           ),
         );
       }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // Desativar a bolinha e voltar pro botão
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste FutDle: Melhorado'),
          backgroundColor: Colors.green[700],
        ),
        body: Center(
          child: _isLoading 
            ? const CircularProgressIndicator(color: Colors.green,) // Bolinha de carregamento
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.black,
                ),
                onPressed: _sortearJogador, // Chama nossa nova função
                child: const Text(
                  'Puxar Jogador e Salvar no Firebase',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
        ),
      ),
    );
  }
}