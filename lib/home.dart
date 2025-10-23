import 'package:flutter/material.dart';
import 'package:flutter_application_1/medicamentos.dart'; // Importa a próxima tela (Medicamentos)

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // Título que aparece na AppBar

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controladores para capturar o texto digitado nos campos
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold é a estrutura básica de uma tela no Flutter
      appBar: AppBar(
        title: Text(widget.title), // Exibe o título definido no static.dart
        backgroundColor: const Color.fromARGB(255, 65, 145, 170),
      ),

      body: Center(
        // Centraliza todo o conteúdo na tela
        child: Container(
          // Cria uma caixa com cor e bordas arredondadas
          width: 400, // Largura do container
          height: 300, // Altura do container
          padding: const EdgeInsets.all(40.0), // Espaçamento interno
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 215, 243, 246), // Cor de fundo do container
            borderRadius: BorderRadius.circular(25), // Bordas arredondadas
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza os itens verticalmente
            children: [
              // Campo de entrada de e-mail
              TextFormField(
                controller: emailController, // Controlador que guarda o texto
                decoration: const InputDecoration(
                  labelText: "Digite seu email:",
                  border: OutlineInputBorder(), // Coloca borda no campo
                  icon: Icon(Icons.mail), // Ícone de e-mail
                ),
              ),
              const SizedBox(height: 15), // Espaçamento entre os campos

              // Campo de entrada de senha
              TextFormField(
                controller: senhaController,
                obscureText: true, // Oculta o texto (para senhas)
                decoration: const InputDecoration(
                  labelText: "Digite sua senha:",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.key), // Ícone de chave
                ),
              ),
              const SizedBox(height: 30),

              // Botão para fazer login
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 65, 145, 170),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                // Função executada quando o botão é clicado
                onPressed: () {
                  // Verifica se algum campo está vazio
                  if (emailController.text.isEmpty ||
                      senhaController.text.isEmpty) {
                    // Mostra uma mensagem de erro
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Preencha todos os campos!"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else {
                    // Se os campos estiverem preenchidos, vai para a próxima tela
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicamentosPage(),
                      ),
                    );
                  }
                },

                // Texto do botão
                child: const Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
