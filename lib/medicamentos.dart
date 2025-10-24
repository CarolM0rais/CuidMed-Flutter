import 'package:flutter/material.dart'; 

class MedicamentosPage extends StatefulWidget {
  const MedicamentosPage({super.key});

  @override
  State<MedicamentosPage> createState() => _MedicamentosPageState();
}

class _MedicamentosPageState extends State<MedicamentosPage> {
  // Controladores para capturar o texto digitado nos campos
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController horarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura básica da tela
      appBar: AppBar(
        title: const Text("CuidMed - Controle de Medicações"), // Novo título
        backgroundColor: const Color.fromARGB(255, 65, 145, 170),
      ),

      body: Center(
        // Centraliza todo o conteúdo
        child: Container(
          // Mesmo estilo da tela inicial (login)
          width: 400,
          height: 300,
          padding: const EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 215, 243, 246),
            borderRadius: BorderRadius.circular(25),
          ),

          // Mesma estrutura de organização
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de entrada para o nome do medicamento
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome do medicamento:",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.medication), // Ícone trocado
                ),
              ),
              const SizedBox(height: 15),

              // Campo de entrada para o horário
              TextFormField(
                controller: horarioController,
                decoration: const InputDecoration(
                  labelText: "Horário de uso:",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.access_time), // Ícone trocado
                ),
              ),
              const SizedBox(height: 30),

              // Botão para salvar o medicamento
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 65, 145, 170),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                // Função executada ao clicar no botão
                onPressed: () {
                  // Validação dos campos
                  if (nomeController.text.isEmpty ||
                      horarioController.text.isEmpty) {
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
                            "Medicamento ${nomeController.text} cadastrado com sucesso!"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // Limpa os campos depois de salvar
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
