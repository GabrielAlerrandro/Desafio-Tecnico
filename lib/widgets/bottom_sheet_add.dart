import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/alert_dialog_saved.dart';
import 'package:flutter_application_1/widgets/decoration_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_field.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

class BottomSheetAdd extends StatelessWidget {
  const BottomSheetAdd({super.key, required this.callBackFunctionAdd});
  final VoidCallback callBackFunctionAdd;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
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
                    text: "Digite o nome do item",
                    textReturn: "nome",
                    controller: Variaveis.nameEditingController,
                    type: "",
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                      text: "Digite a descrição do item",
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomElevatedButton(
                            text: "Cancelar",
                            color: const Color(Variaveis.greyColor),
                            function: () {
                              Navigator.popAndPushNamed(context, "/");
                              clearController();
                            }),
                      ),
                      CustomElevatedButton(
                        text: "Salvar",
                        color: const Color(Variaveis.blueColor),
                        function: () {
                          try {
                            if (Variaveis.formKey.currentState?.validate() ??
                                false) {
                              callBackFunctionAdd();
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialogSaved();
                                },
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Não foi possivel salvar o item: $e"),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
