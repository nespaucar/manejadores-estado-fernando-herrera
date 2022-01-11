import 'package:app_manejadores_estado/bloc/usuario/usuario_cubit.dart';
import 'package:app_manejadores_estado/pages/pagina1_page.dart';
import 'package:app_manejadores_estado/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Muy parecido al Provider solo
        BlocProvider(
          create: (_) => UsuarioCubit(),
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