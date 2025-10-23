import 'package:flutter/material.dart';

// Classe principal da tela de medicamentos
class MedicamentosPage extends StatefulWidget {
  const MedicamentosPage({super.key});

  @override
  State<MedicamentosPage> createState() => _MedicamentosPageState();
}

// Classe responsável pela lógica e estado da tela
class _MedicamentosPageState extends State<MedicamentosPage> {
  // Controladores para os campos de texto
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController horarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo da tela

      appBar: AppBar(
        title: const Text("CuidMed - Controle de Medicações"),
        backgroundColor: const Color.fromARGB(255, 65, 145, 170),
      ),

      // Centraliza o conteúdo no meio da tela
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(30), // Espaçamento interno
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 215, 243, 246), // Cor do container
            borderRadius: BorderRadius.circular(25), // Bordas arredondadas
            boxShadow: const [
              // Sombra ao redor da caixa
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),

          // Organiza os elementos verticalmente
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo para o nome do medicamento
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome do medicamento:",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.medication), // Ícone de remédio
                ),
              ),
              const SizedBox(height: 15),

              // Campo para o horário de uso
              TextFormField(
                controller: horarioController,
                decoration: const InputDecoration(
                  labelText: "Horário de uso:",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.access_time), // Ícone de relógio
                ),
              ),
              const SizedBox(height: 25),

              // Botão de salvar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 65, 145, 170),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                // Função do botão
                onPressed: () {
                  // Verifica se algum campo está vazio
                  if (nomeController.text.isEmpty || horarioController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Preencha todos os campos!"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else {
                    // Mostra mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Medicamento ${nomeController.text} cadastrado com sucesso!",
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // Limpa os campos após salvar
                    nomeController.clear();
                    horarioController.clear();
                  }
                },

                // Texto do botão
                child: const Text(
                  "Salvar",
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
