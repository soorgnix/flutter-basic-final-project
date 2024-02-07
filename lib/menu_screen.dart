import 'package:flutter/material.dart';
import 'package:tugasakhir_pemula/detail_screen.dart';
import 'package:tugasakhir_pemula/model/resto_menu.dart';
import 'package:tugasakhir_pemula/model/resto_menu_category.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen ({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restoranku'),
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder (
        builder: (BuildContext context, BoxConstraints constraint) {
            return RestoMenuList(maxWidth: constraint.maxWidth);
        },
      )
    );
  }
}

class RestoMenuList extends StatelessWidget {
  final double maxWidth;
  const RestoMenuList ({Key? key, required this.maxWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final RestoMenuCategory restoMenuCategory = restoMenuCategoryList[index];
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [           
            MenuCategoryWidget(categoryName: restoMenuCategory.name),
            ListMenu(restoMenuList: restoMenuCategory.restoMenusInCategory,maxWidth: maxWidth)
          ],
        );
      },
      itemCount: restoMenuCategoryList.length,
    );
  }
}

class MenuCategoryWidget extends StatelessWidget{
  final String categoryName;
  const MenuCategoryWidget({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card (
      child: Padding (
        padding: const EdgeInsets.all(8.0),
        child: 
          Text(
            categoryName,
            textAlign: TextAlign.center,
          ),
      )
    );
  }
}

class ListMenu extends StatelessWidget {
  final List<RestoMenu> restoMenuList;
  final double maxWidth;
  const ListMenu({Key? key, required this.restoMenuList, required this.maxWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (maxWidth > 600) {
      return Card (
        child: Padding (
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: restoMenuList.map((restoMenu) {
                if (restoMenu.isAvailable) {
                  return MenuInkWell(restoMenu: restoMenu, maxWidth: maxWidth);
                } else {
                  return Card(
                    child: MenuRow(restoMenu: restoMenu)                
                  );
                }
              }).toList()
            )
          )
        )
      );
    } else {
      return Card (
        child: Padding (
          padding: const EdgeInsets.all(8.0),
          child: 
            Column(              
              children: restoMenuList.map((restoMenu) {
                if (restoMenu.isAvailable) {
                  return MenuInkWell(restoMenu: restoMenu, maxWidth: maxWidth);
                } else {
                  return Card(
                    child: MenuColumn(restoMenu: restoMenu)
                  );
                }
              }).toList()
            )
        )
      );
    }
  }
}

class MenuInkWell extends StatelessWidget {
  final RestoMenu restoMenu;
  final double maxWidth;
  const MenuInkWell({Key? key, required this.restoMenu, required this.maxWidth}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) {
                return DetailScreen(restoMenu: restoMenu);
              }
            )
          );
        },
        child: maxWidth > 600 ? MenuRow(restoMenu: restoMenu) : MenuColumn(restoMenu: restoMenu)                        
      )
    );
  }
}

class MenuColumn extends StatelessWidget{
  final RestoMenu restoMenu;
  const MenuColumn({Key? key, required this.restoMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Stack (
            children: [
              AspectRatio(
                aspectRatio: 3,
                child: ColorFiltered(
                  colorFilter: restoMenu.isAvailable ? 
                    const ColorFilter.mode(
                      Colors.transparent, 
                      BlendMode.multiply
                    ) : 
                    const ColorFilter.matrix(<double>[
                      0.2126,0.7152,0.0722,0,0,
                      0.2126,0.7152,0.0722,0,0,
                      0.2126,0.7152,0.0722,0,0,
                      0,0,0,1,0,
                    ]),
                  child: Image.asset(
                    restoMenu.picLocation,
                    fit: BoxFit.cover,
                  )
                ),
              ),
              if (!restoMenu.isAvailable) 
                const Positioned.fill(
                  child: Center (
                    child: Text(
                      'Out of Stock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,                        
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    )
                  )
                )
            ],
          )
        ),
        Expanded(
          flex: 5,
          child:Row(
            children: [
              Expanded (
                flex: 2,
                child: Column(                  
                  children: [                      
                    Text(restoMenu.name, textAlign: TextAlign.center,),
                    Text('Rp.${restoMenu.price}', textAlign: TextAlign.center),
                  ]
                ),
              ),
              Expanded (
                flex: 3,
                child: restoMenu.isAvailable ? const OrderMenu() : const SizedBox(height: 10),
              )
            ]
          )
        )
      ]
    );
  }
}

class MenuRow extends StatelessWidget{
  final RestoMenu restoMenu;
  const MenuRow({Key? key, required this.restoMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack( 
          children : [
            ColorFiltered(
              colorFilter: restoMenu.isAvailable ? 
                const ColorFilter.mode(
                  Colors.transparent, 
                  BlendMode.multiply
                ) : 
                const ColorFilter.matrix(<double>[
                  0.2126,0.7152,0.0722,0,0,
                  0.2126,0.7152,0.0722,0,0,
                  0.2126,0.7152,0.0722,0,0,
                  0,0,0,1,0,
                ]),
              child: Image.asset(
                restoMenu.picLocation,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            ),
            if (!restoMenu.isAvailable) 
              const Positioned.fill(
                child: Center(
                  child: Text(
                    'Out of Stock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  )
                )
              )
          ]
        ),
        Column(
          children: [                      
            Text(restoMenu.name),
            Text('Rp.${restoMenu.price}'),
            restoMenu.isAvailable ? const OrderMenu() : const SizedBox(height: 40)
          ]
        ),
      ]
    );
  }
}

class OrderMenu extends StatefulWidget {
  const OrderMenu({Key? key}) : super(key: key);
  
  @override
  State<OrderMenu> createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  int orderNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        IconButton(
          icon: const Icon (
            Icons.remove_circle            
          ),
          onPressed: () {
            setState(() {
              if (orderNumber > 0) {
                orderNumber -= 1;
              }
            });
          }          
        ),
        Text('$orderNumber'),
        IconButton(
          icon: const Icon (
            Icons.add_circle
          ),
          onPressed: () {
            setState(() {
              orderNumber += 1;
            });
          },
        )
      ]
    );
  }
}