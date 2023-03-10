import 'package:flutter/material.dart';

List Genero = ["Masculino","Femenino"];
final Nombre = TextEditingController();
final AnoA = TextEditingController();
final AnoN = TextEditingController();



class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  String _GenE = Genero.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular la Edad",
            style: TextStyle(color: Colors.black, fontSize: 30)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Nombre.text = "";
            AnoN.text = "";
            AnoA.text = "";
          }, icon: Icon(Icons.recycling))
        ],
      ),

      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(0),
              child: Image(image: AssetImage('/Messi.png'),height: 150,width: 150,),
          ),

          Padding(padding: EdgeInsets.all(5),
            child:
            //Campo de texto del nombre
            TextField(decoration: InputDecoration(icon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
                labelText: "Escribe tu Nombre:"), controller: Nombre,),
            //Campo de texto de mes año de nacimiento
          ),

          Padding(padding: EdgeInsets.all(5), child:
          TextField(
            decoration: InputDecoration(icon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(),
                labelText: "Año de nacimiento:"), controller: AnoN,),
          ),

          Padding(padding: EdgeInsets.all(5), child:
          TextField(
            decoration: InputDecoration(icon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(),
                labelText: "Año actual: ",), controller: AnoA,),
          ),

          Padding(padding: EdgeInsets.all(10), child:
          Text("Elige tu sexo: ", style: TextStyle(color: Colors.cyan, fontSize: 30),)
          ),

          Padding(padding: EdgeInsets.all(10), child:
          Center(
              child: DropdownButtonFormField(decoration: InputDecoration(icon: Icon(Icons.account_box),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),),
                value: _GenE,
                borderRadius: BorderRadius.circular(5),
                items: Genero.map((name)
                {
                  return DropdownMenuItem(
                    child: Text(name),
                    value: name,

                  );
                }).toList(), onChanged: (value) {
                setState(() {
                  _GenE = value.toString();
                });
              },
              )
          ),
          ),

          SizedBox(height: 30, width: 110, child:
          ElevatedButton(onPressed: () {
            Calcular(AnoN.text, AnoA.text);
          }, child: Text("Calcular",style: TextStyle(fontSize: 20),),),
          )


        ],
      ),


    );
  }

  void Calcular(String text, String text2) {
    int AA = int.parse(AnoA.text);
    int AN = int.parse(AnoN.text);
    int E = AA - AN;

    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("RESULTADO"),
            content: Text("\nHola ${Cambiar(Nombre.text)}"
                "\nTu genero es: ${_GenE}"
                "\nY tu edad es de: ${E} años"),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop(); //Quita el alertDialog
              }, child: Text("OK"))

            ],
          ); //AlertDialog
        }); //ShowDialog



  }
 String Cambiar(String S){
    new Text(Nombre.text,
      style: TextStyle(
        color: Colors.blue,
      ),
    );
    return Nombre.text;
  }
}
