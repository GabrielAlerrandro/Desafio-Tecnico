import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/decoration_elevated_button.dart';
import 'package:flutter_application_1/components/decoration_form_modal.dart';
import 'package:flutter_application_1/widgets/custom_text_field.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

class ContainerAdd extends StatelessWidget {
  const ContainerAdd({super.key, required this.callBackFunctionAdd});
  final VoidCallback callBackFunctionAdd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: Variaveis.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                CustomTextFormField(
                  text: "Digite o nome do corte",
                  textReturn: "nome",
                  controller: Variaveis.nameEditingController,
                  type: "",
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                    text: "Digite a descrição do corte",
                    textReturn: "descrição",
                    controller: Variaveis.descriptionEditingController,
                    type: ""),
                const SizedBox(height: 8),
                CustomTextFormField(
                  text: "Insira a url da imagem",
                  textReturn: "Imagem",
                  controller: Variaveis.urlEditingController,
                  type: "img",
                ),
                const SizedBox(height: 8),
                TextFormField(
                    style: const TextStyle(color: Colors.white70),
                    controller: Variaveis.textEditingController,
                    decoration: formDecoration(label: "ID"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "a id não pode ser vazio";
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomElevatedButtom(
                          text: "Cancelar",
                          color: const Color(0xFF2D3243),
                          function: () {
                            Navigator.pop(context);
                            clearController();
                          }),
                    ),
                    CustomElevatedButtom(
                      text: "Salvar",
                      color: const Color(0xFF256EFF),
                      function: () {
                        callBackFunctionAdd();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
