import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STEM Prasmul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PRASETIYA MULYA'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  void _showAlert(BuildContext context, String menuName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Informasi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text('$menuName clicked'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Image.asset(
              'assets/images/prasmul-logo-white.png',
              height: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: const Color(0xFF424242),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(0),
                  ),
                ),
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'PROGRAMS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              _showAlert(context, 'Programs');
                            },
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'ADMISSION',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              _showAlert(context, 'Admission');
                            },
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'PEOPLE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              _showAlert(context, 'People');
                            },
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'LABORATORY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              _showAlert(context, 'Laboratory');
                            },
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'CAMPUS LIFE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              _showAlert(context, 'Campus Life');
                            },
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'OFFICE & SERVICES',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              _showAlert(context, 'Office & Services');
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Section
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/images/logo_upm_biru.png',
                  width: 250,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            
            // Vision Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'VISION',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'A globally recognized School for STEMpreneur Education and Research',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            
            // Mission Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MISSION',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Provide quality STEM education and research for nurturing the holistic citizen graduates through:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '1. Collaborative learning by enterprising involving interdisciplinary catalytic projects',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '2. Innovative and impactful research to the society',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            
            // Contact Footer Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: Colors.black87,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo_upm_biru.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'BSD City Kavling Edutown I.1',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'Jl. BSD Raya Utama, BSD City 15339',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'Kabupaten Tangerang, Indonesia',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tel. (021) 304-50-500',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

