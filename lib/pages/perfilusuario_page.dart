import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Usuario'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text('Perfil Usuario'),
            )
          ],
        ),
      ),
    );
  }
}
