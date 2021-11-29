import 'package:express/widgets/custom_button.dart';
import 'package:express/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:express/services/auth_service.dart';
import 'package:provider/provider.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final nombreCtrl = TextEditingController();
  final apellidoCtrl = TextEditingController();
  TextInputType keyboardType = TextInputType.text;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Examen Unidad 2',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            CustomInput(
              icono: Icons.person,
              placeHolder: 'Nombre',
              keyboardType: TextInputType.text,
              textController: nombreCtrl,
            ),
            CustomInput(
              icono: Icons.person,
              placeHolder: 'Apellido',
              keyboardType: TextInputType.text,
              textController: apellidoCtrl,
            ),
            //ElevatedButton(onPressed: () {}, child: Text('Iniciar')),
            CustomButton(
                texto: 'Enviar',
                onPressed: authService.autenticando
                    ? () => {}
                    : () async {
                        FocusScope.of(context).unfocus();
                        final loginRes = await authService.login(
                            nombreCtrl.text, apellidoCtrl.text);
                        if (loginRes) {
                          Navigator.pushReplacementNamed(context,
                              'usuarios'); // no permite regresar al login
                        }
                      }),
          ],
        ),
      ),
    );
  }
}
