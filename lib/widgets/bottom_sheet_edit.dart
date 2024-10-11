import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/alert_dialog_modal_deleted.dart';
import 'package:flutter_application_1/widgets/alert_dialog_modal_edited.dart';
import 'package:flutter_application_1/widgets/decoration_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_field.dart';
import 'package:flutter_application_1/utils/clear_controller.dart';
import 'package:flutter_application_1/utils/variaveis.dart';

class BottomSheetEdit extends StatelessWidget {
  const BottomSheetEdit(
      {super.key,
      required this.callBackFunctionEdit,
      required this.index,
      required this.callBackFunctionDelete});
  final int index;
  final Function(int index) callBackFunctionEdit;
  final Function(int index) callBackFunctionDelete;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
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
                    type: "",
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                      text: "Insira a url da imagem",
                      textReturn: "Imagem",
                      controller: Variaveis.urlEditingController,
                      type: "img"),
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
                              callBackFunctionEdit(index);
                              return showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialogModalEdited();
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomElevatedButton(
                          text: "Excluir",
                          color: const Color(0xFFF44336),
                          function: () {
                            try {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialogDeleted(
                                      callBackFunctionDelete: () {
                                        callBackFunctionDelete(index);
                                        Navigator.popAndPushNamed(context, "/");
                                      },
                                    );
                                  });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Não foi possivel excluir o item: $e"),
                                ),
                              );
                            }
                          },
                        ),
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
