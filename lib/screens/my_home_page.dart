import 'package:firethree/screens/providers/random_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text("FindNum Game")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
                ),
              itemBuilder: (context, i){
                return InkWell(
                  child: Container(
                    color: context.watch<RandomProvider>().onTap[i] ? Colors.red.withOpacity(0.3) : Colors.red,
                    alignment: Alignment.center,
                    child: Text("${context.watch<RandomProvider>().randoms[i]}", style: TextStyle(color: context.watch<RandomProvider>().isVisible == true ? Colors.white : Colors.red, fontSize: 30),),
                  ),
                  onTap: (){
                    context.read<RandomProvider>().delete(i);
                  },
                );
              },
              itemCount: context.watch<RandomProvider>().randoms.length
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Text("Start"),
        backgroundColor: Colors.red,
        
        onPressed: (){
          context.read<RandomProvider>().showRandoms();
          context.read<RandomProvider>().randomize();
        },)
    );
    
  }

}