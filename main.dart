import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    MapScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void HeightandDistance ()
  {
    print("Change the unit for height and distance");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tides near me'),
          actions: [
            IconButton( icon: Icon(
              Icons.more_horiz_outlined
            ),
            onPressed: HeightandDistance,)
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> statesInIndia = [
    'Andhra Pradesh',
    'Goa',
    'Gujarat',
    'Karnataka',
    'Kerala',
    'Maharashtra',
    'Odisha',
    'Tamil Nadu',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Lakshadweep',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statesInIndia.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(statesInIndia[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PortScreen(state: statesInIndia[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> statesInIndia = [
    'Andhra Pradesh',
    'Goa',
    'Gujarat',
    'Karnataka',
    'Kerala',
    'Maharashtra',
    'Odisha',
    'Tamil Nadu',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Lakshadweep',
  ];

  List<String> allPorts = [
    'Deendayal Port',
    'Vadinar',
    'Okha',
    'Porbandar',
    'Apollo Bandar',
    'JNPT',
    'Marmagao',
    'Karwar',
    'New Mangalore',
    'Cochin',
    'Kavaratti',
    'Minicoy',
    'Kannioya Kumari',
    'Tuticorin',
    'Rameshwaram',
    'Naggapatinam',
    'Cuddalore',
    'Chennai',
    'Kamarajar Port',
    'Krishnapatnam',
    'Machilipatnam',
    'Kakinada',
    'Vishakhapatnam',
    'Paradip',
    'Haldia',
    'Roychak',
    'Garden Beach',
    'Port Blair',
    'Aerial Bay',
    'Nancowry',
    'Campbell Bay',
    // Add more ports as needed
  ];

  List<String> filteredPorts = [];

  void filterPorts(String searchTerm) {
    setState(() {
      filteredPorts = allPorts
          .where((port) => port.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredPorts = allPorts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              filterPorts(value);
            },
            decoration: InputDecoration(
              labelText: 'Search Ports',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredPorts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(filteredPorts[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionScreen(
                        portName: filteredPorts[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Map Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PortScreen extends StatelessWidget {
  final String state;

  PortScreen({required this.state});

  final List<String> portsInAndhraPradesh = [
    'Krishnapatnam',
    'Machilipatnam',
    'Kakinada',
    'Vishakhapatnam'
  ];

  final List<String> portsInGujarat = [
    'Deendayal Port',
    'Vadinar',
    'Okha',
    'Porbandar',

  ];

  final List<String> portsInKerala = [
    'Cochin Port',

  ];

  final List<String> portsInGoa = [
    'Marmagao',
  ];

  final List<String> portsInKarnataka = [
    'Karwar',
    'New Mangalore',
  ];

  final List<String> portsInLakshadweep = [
    'Kavaratti',
    'Minicoy',
  ];

  final List<String> portsInTamilNadu = [
    'Kanniya Kumari',
    'Tuticorin',
    'Rameshwaram',
    'Naggapatinam',
    'Cuddalore',
    'Chennai',
    'Kamarajar Port',
  ];

  final List<String> portsInOdisha= [
    'Paradip',
  ];

  final List<String> portsInWestBengal = [
    'Haldia',
    'Roychak',
    'Garden Beach',
    'Port Blair',
    'Aerial Bay',
  ];

  final List<String> portsInAndamanandNicobarIslands = [
    'Nancowry',
    'Campbell Bay',
  ];

  final List<String> portsInMaharashtra = [
    'Apollo Bandar',
    'JNPT',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> ports;
    switch (state) {
      case 'Andhra Pradesh':
        ports = portsInAndhraPradesh;
        break;
      case 'Gujarat':
        ports = portsInGujarat;
        break;
      case 'Kerala':
        ports = portsInKerala;
        break;
      case 'Goa':
        ports = portsInGoa;
        break;
      case 'Karnataka':
        ports = portsInKarnataka;
        break;
      case 'Lakshadweep':
        ports = portsInLakshadweep;
        break;
      case 'Tamil Nadu':
        ports = portsInTamilNadu;
        break;
      case 'Odisha':
        ports = portsInOdisha;
        break;
      case 'West Bengal':
        ports = portsInWestBengal;
        break;
      case 'Andaman and Nicobar Islands':
        ports = portsInAndamanandNicobarIslands;
        break;
      case 'Maharashtra':
        ports = portsInMaharashtra;
        break;
      default:
        ports = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ports in $state'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ports.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(ports[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionScreen(
                          portName: ports[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionScreen extends StatelessWidget {
  final String portName;

  DescriptionScreen({required this.portName});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual port descriptions
    final Map<String, String> portDescriptions = {
      'Deendayal Port' : 'Description of Deendayal Port',
      'Vadinar' : 'Description of Vadinar',
      'Okha' : 'Description of Okha',
      'Porbandar' : 'Description of Porbandar',
      'Apollo Bandar' : 'Description of Apollo Bandar',
      'JNPT' : 'Description of JNPT',
      'Marmagao' : 'Description of Marmagao',
      'Karwar' : 'Description of Karwar',
      'New Mangalore' : 'Description of New Mangalore',
      'Cochin' : 'Description of Cochin',
      'Kavaratti' : 'Description of Kavaratti',
      'Minicoy' : 'Description of Minicoy',
      'Kannioya Kumari' : 'Description of Kannioya Kumari',
      'Tuticorin' : 'Description of Tuticorin',
      'Rameshwaram' : 'Description of Rameshwaram',
      'Naggapatinam' : 'Description of Naggapatinam',
      'Cuddalore' : 'Description of Cuddalore',
      'Chennai' : 'Description of Chennai',
      'Kamarajar Port' : 'Description of Kamarajar Port',
      'Krishnapatnam' : 'Description of Krishnapatnam',
      'Machilipatnam' : 'Description of Machilipatnam',
      'Kakinada' : 'Description of Kakinada',
      'Vishakhapatnam' : 'Description of Vishakhapatnam',
      'Paradip' : 'Description of Paradip',
      'Haldia' : 'Description of Haldia',
      'Roychak' : 'Description of Roychak',
      'Garden Beach' : 'Description of Garden Beach',
      'Port Blair' : 'Description of Port Blair',
      'Aerial Bay' : 'Description of Vadinar',
      'Nancowry' : 'Description of Nancowry',
      'Campbell Bay' : 'Description of Campbell Bay',
      // Add more port descriptions as needed
    };


    final String description = portDescriptions[portName] ?? 'No description available';



    return Scaffold(
      appBar: AppBar(
        title: Text(portName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(description),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon( Icons.access_time),
            label: 'Now',),
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_month),
            label: 'Weekly',),
          BottomNavigationBarItem(
            icon: Icon( Icons.map),
            label: 'Map',),

        ],
      ),


    );
  }
}

