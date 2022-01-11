import 'package:app_manejadores_estado/pages/pagina1_page.dart';
import 'package:app_manejadores_estado/pages/pagina2_page.dart';
import 'package:app_manejadores_estado/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // El multiprovider para tener varios providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuarioService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page(),
        },
      ),
    );
  }
}