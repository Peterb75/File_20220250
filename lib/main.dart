import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      showSemanticsDebugger: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                label: 'Recents',
                icon: Icon(CupertinoIcons.clock_solid),
              ),
              BottomNavigationBarItem(
                label: 'Shared',
                icon: Icon(CupertinoIcons.folder_badge_person_crop),
              ),
              BottomNavigationBarItem(
                label: 'Browse',
                icon: Icon(CupertinoIcons.folder),
              ),
            ],
          ),
          tabBuilder: (context, index) => CupertinoTabView(
            builder: (context) => pages[index],
          ),
        ),
      ),
    );
  }
}

final List<Widget> pages = [
  const PageOne(),
  const PageTwo(),
  const PageThree(),
];

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool? isChecked = true;
  bool? isChecked1 = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.grey[100], // Fondo gris claro
      child: ListView(
        children: [
          // Icono en la esquina superior derecha
          Container(
            alignment: Alignment.topRight,
            child: const Icon(
              CupertinoIcons.ellipsis,
              color: Colors.grey,
            ),
          ),

          // Barra de búsqueda con ícono de micrófono
          Stack(
            alignment: Alignment.centerRight,
            children: [
              CupertinoSearchTextField(
                placeholder: 'Search',
                placeholderStyle: TextStyle(color: Colors.grey),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onSubmitted: (String value) {
                  print('Searched for: $value');
                },
              ),
              Positioned(
                right: 8.0,
                child: Icon(
                  CupertinoIcons.mic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          // Sección de Favoritos con ícono de flecha hacia abajo
          CupertinoListSection(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favorites', style: TextStyle(fontSize: 20.0, color: Colors.black)),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: CupertinoColors.activeBlue,
                ),
              ],
            ),
            children: const <CupertinoListTile>[
              CupertinoListTile(
                title: Text('IcloudDrive'),
                leading: Icon(
                  CupertinoIcons.cloud,
                  color: CupertinoColors.systemBlue,
                ),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('On My iPhone'),
                leading: Icon(
                  CupertinoIcons.device_phone_portrait,
                  color: CupertinoColors.systemBlue,
                ),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('Drive'),
                leading: Icon(
                  CupertinoIcons.device_phone_portrait,
                  color: CupertinoColors.systemBlue,
                ),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('pCloud'),
                leading: Icon(
                  CupertinoIcons.device_phone_portrait,
                  color: CupertinoColors.systemBlue,
                ),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('Recently Deleted'),
                leading: Icon(
                  CupertinoIcons.trash,
                  color: CupertinoColors.systemBlue,
                ),
                trailing: CupertinoListTileChevron(),
              ),
            ],
          ),

          // Sección de Favoritos con ícono de flecha hacia abajo
          CupertinoListSection(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favorites', style: TextStyle(fontSize: 20.0, color: Colors.black)),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: CupertinoColors.activeBlue,
                ),
              ],
            ),
            children: const <CupertinoListTile>[
              CupertinoListTile(
                title: Text('IcloudDrive'),
                leading: Icon(
                  CupertinoIcons.cloud,
                  color: CupertinoColors.systemBlue,
                ),
                trailing: CupertinoListTileChevron(),
              ),
            ],
          ),

          // Sección de Favoritos con íconos de Checkbox
          CupertinoListSection(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favorites', style: TextStyle(fontSize: 20.0, color: Colors.black)),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: CupertinoColors.activeBlue,
                ),
              ],
            ),
            children: <CupertinoListTile>[
              CupertinoListTile(
                title: Text('IcloudDrive'),
                leading: CupertinoCheckbox(
                  tristate: true,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text('IcloudDrive'),
                leading: CupertinoCheckbox(
                  tristate: true,
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value ?? false;
                    });
                  },
                ),
                trailing: CupertinoListTileChevron(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pagina 2'),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pagina 3'),
    );
  }
}
