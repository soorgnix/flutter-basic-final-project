import 'package:flutter/material.dart';
import 'package:tugasakhir_pemula/model/resto_menu.dart';

class DetailScreen extends StatelessWidget {
  final RestoMenu restoMenu;
  const DetailScreen({Key? key, required this.restoMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return DetailWebpage(restoMenu: restoMenu, maxWidth: constraints.maxWidth);
        } else {
          return DetailContent(restoMenu: restoMenu);
        }

      }
    );
  }
}

class DetailContent extends StatelessWidget {
  final RestoMenu restoMenu;

  const DetailContent({Key? key, required this.restoMenu}) : super (key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(restoMenu.name),
        backgroundColor: Colors.blue,
      ),
      body: Column (
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: Image.asset(
                    restoMenu.picLocation,
                    fit: BoxFit.cover,
                  )
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
          Card ( 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    restoMenu.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rp. ${restoMenu.price}',                                    
                    textAlign: TextAlign.center,
                  )
                ]
              )
            )
          )
        ]
      ),
    );
  }
}

class DetailWebpage extends StatelessWidget {
  final RestoMenu restoMenu;
  final double maxWidth;

  const DetailWebpage({Key? key, required this.restoMenu, required this.maxWidth}) : super (key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(restoMenu.name),
        backgroundColor: Colors.blue,
      ),
      body: Center (
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Row (                        
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), 
                    child: Image.asset(
                      restoMenu.picLocation,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Card (                 
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column (                    
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            restoMenu.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20
                            ),
                          ),
                          Text(
                            'Rp. ${restoMenu.price}',                                    
                            textAlign: TextAlign.center,
                          )
                        ]
                      )
                    )
                  )
                )
              ]
            ),
          ],
        )
      )
    );
  }
}