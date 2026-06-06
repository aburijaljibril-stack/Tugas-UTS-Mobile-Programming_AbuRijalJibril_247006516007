import 'package:flutter/material.dart';

void main() {
  runApp(const IjalShopApp());
}

// ================= APP =================

class IjalShopApp extends StatelessWidget {
  const IjalShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ijal Shop',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginPage(),
    );
  }
}

// ================= MODEL =================

class Product {
  final String name;
  final String image;
  final int price;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

// ================= CART =================

class CartManager {
  List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  int get totalPrice {
    return items.fold(
      0,
          (total, item) => total + item.price,
    );
  }

  double get averagePrice {
    if (items.isEmpty) return 0;
    return totalPrice / items.length;
  }
}

CartManager cart = CartManager();

List<Map<String, dynamic>> purchaseHistory = [];

// ================= DATA =================

List<Product> products = [
  Product(
    name: "Fitted Tee",
    image:
    "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
    price: 350000,
    description: "Kaos Fitted Tee yang nyaman dan stylish.",
  ),

  Product(
    name: "Casual Jacket",
    image:
    "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f",
    price: 420000,
    description: "Jaket keren untuk sehari-hari.",
  ),

  Product(
    name: "Dry Fit Jacket",
    image:
    "https://images.unsplash.com/photo-1523398002811-999ca8dec234",
    price: 250000,
    description: "Jaket dry fit modern.",
  ),

  Product(
    name: "Jeans Jacket",
    image:
    "https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=1000",
    price: 390000,
    description: "Jaket jeans fashionable.",
  ),
];

// ================= LOGIN =================

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final emailController =
    TextEditingController();

    final passwordController =
    TextEditingController();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                const Icon(
                  Icons.store,
                  size: 100,
                  color: Colors.white,
                ),

                const SizedBox(height: 20),

                const Text(
                  "IJAL SHOP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: emailController,

                  style: const TextStyle(
                    color: Colors.white,
                  ),

                  decoration: InputDecoration(
                    hintText: "Email",

                    hintStyle: const TextStyle(
                      color: Colors.white70,
                    ),

                    filled: true,
                    fillColor: Colors.white24,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                  passwordController,

                  obscureText: true,

                  style: const TextStyle(
                    color: Colors.white,
                  ),

                  decoration: InputDecoration(
                    hintText: "Password",

                    hintStyle: const TextStyle(
                      color: Colors.white70,
                    ),

                    filled: true,
                    fillColor: Colors.white24,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                          const HomePage(),
                        ),
                      );
                    },

                    child: const Text(
                      "LOGIN",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= HOME =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Ijal Shop"),

        actions: [

          IconButton(
            icon:
            const Icon(Icons.history),

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) =>
                  const HistoryPage(),
                ),
              );
            },
          ),

          IconButton(
            icon:
            const Icon(Icons.shopping_cart),

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) =>
                  const CartPage(),
                ),
              );
            },
          )
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(12),

        itemCount: products.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),

        itemBuilder: (context, index) {

          final product = products[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(18),
            ),

            child: Column(
              children: [

                Expanded(
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(
                      top:
                      Radius.circular(18),
                    ),

                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.all(10),

                  child: Column(
                    children: [

                      Text(
                        product.name,
                        style:
                        const TextStyle(
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "Rp ${product.price}",
                        style:
                        const TextStyle(
                          color:
                          Colors.deepPurple,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width:
                        double.infinity,

                        child:
                        ElevatedButton(
                          onPressed: () {

                            cart.addItem(product);

                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${product.name} ditambahkan",
                                ),
                              ),
                            );
                          },

                          child:
                          const Text(
                            "Tambah",
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// ================= CART =================

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() =>
      _CartPageState();
}

class _CartPageState
    extends State<CartPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Keranjang"),
      ),

      body: cart.items.isEmpty
          ? const Center(
        child:
        Text("Keranjang kosong"),
      )
          : Column(
        children: [

          Container(
            margin:
            const EdgeInsets.all(10),

            padding:
            const EdgeInsets.all(15),

            decoration: BoxDecoration(
              color:
              Colors.deepPurple.shade50,

              borderRadius:
              BorderRadius.circular(
                15,
              ),
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                const Text(
                  "Statistik Belanja",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Total: Rp ${cart.totalPrice}",
                ),

                Text(
                  "Rata-rata: Rp ${cart.averagePrice.toStringAsFixed(0)}",
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount:
              cart.items.length,

              itemBuilder:
                  (context, index) {

                final item =
                cart.items[index];

                return ListTile(
                  leading:
                  Image.network(
                    item.image,
                    width: 60,
                  ),

                  title:
                  Text(item.name),

                  subtitle:
                  Text(
                    "Rp ${item.price}",
                  ),

                  trailing:
                  IconButton(
                    icon:
                    const Icon(Icons.delete),

                    onPressed: () {

                      setState(() {
                        cart.removeItem(
                          index,
                        );
                      });
                    },
                  ),
                );
              },
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.all(20),

            child: SizedBox(
              width:
              double.infinity,
              height: 50,

              child:
              ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) =>
                      const CheckoutPage(),
                    ),
                  );
                },

                child:
                const Text(
                  "CHECKOUT",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ================= CHECKOUT =================

class CheckoutPage
    extends StatefulWidget {

  const CheckoutPage({
    super.key,
  });

  @override
  State<CheckoutPage>
  createState() =>
      _CheckoutPageState();
}

class _CheckoutPageState
    extends State<CheckoutPage> {

  String paymentMethod = "COD";

  final TextEditingController
  alamatController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Checkout"),
      ),

      body: Padding(
        padding:
        const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const Text(
                "Alamat Pengiriman",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller:
                alamatController,

                maxLines: 3,

                decoration:
                InputDecoration(
                  labelText:
                  "Alamat Tujuan",

                  hintText:
                  "Masukkan alamat lengkap",

                  border:
                  OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Metode Pembayaran",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              RadioListTile(
                title:
                const Text("COD"),

                value: "COD",

                groupValue:
                paymentMethod,

                onChanged: (value) {

                  setState(() {
                    paymentMethod =
                    value!;
                  });
                },
              ),

              RadioListTile(
                title:
                const Text("Transfer"),

                value:
                "Transfer",

                groupValue:
                paymentMethod,

                onChanged: (value) {

                  setState(() {
                    paymentMethod =
                    value!;
                  });
                },
              ),

              RadioListTile(
                title:
                const Text("E-Wallet"),

                value:
                "E-Wallet",

                groupValue:
                paymentMethod,

                onChanged: (value) {

                  setState(() {
                    paymentMethod =
                    value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              Text(
                "Total Bayar: Rp ${cart.totalPrice}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight:
                  FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width:
                double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {

                    purchaseHistory.add({
                      "items":
                      List.from(
                        cart.items,
                      ),

                      "total":
                      cart.totalPrice,

                      "payment":
                      paymentMethod,

                      "alamat":
                      alamatController.text,
                    });

                    showDialog(
                      context: context,
                      barrierDismissible: false,

                      builder: (_) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(25),
                        ),

                        child: Padding(
                          padding:
                          const EdgeInsets.all(25),

                          child: Column(
                            mainAxisSize:
                            MainAxisSize.min,

                            children: [

                              Container(
                                width: 90,
                                height: 90,

                                decoration:
                                BoxDecoration(
                                  color:
                                  Colors.green.shade100,
                                  shape:
                                  BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.check,
                                  color:
                                  Colors.green,
                                  size: 60,
                                ),
                              ),

                              const SizedBox(
                                  height: 20),

                              const Text(
                                "Pembayaran Berhasil!",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              const SizedBox(
                                  height: 10),

                              Text(
                                "Metode Pembayaran:\n$paymentMethod",
                                textAlign:
                                TextAlign.center,

                                style:
                                const TextStyle(
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(
                                  height: 10),

                              Text(
                                "Alamat:\n${alamatController.text}",
                                textAlign:
                                TextAlign.center,

                                style:
                                const TextStyle(
                                  color:
                                  Colors.grey,
                                ),
                              ),

                              const SizedBox(
                                  height: 25),

                              SizedBox(
                                width:
                                double.infinity,
                                height: 50,

                                child:
                                ElevatedButton(
                                  style:
                                  ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Colors.deepPurple,

                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                  ),

                                  onPressed:
                                      () {

                                    cart.items.clear();

                                    Navigator.pushAndRemoveUntil(
                                      context,

                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                        const HomePage(),
                                      ),

                                          (route) =>
                                      false,
                                    );
                                  },

                                  child:
                                  const Text(
                                    "SELESAI",

                                    style:
                                    TextStyle(
                                      color:
                                      Colors.white,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },

                  child:
                  const Text(
                    "BAYAR SEKARANG",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ================= HISTORY =================

class HistoryPage
    extends StatelessWidget {

  const HistoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
        const Text(
          "Histori Pembelian",
        ),
      ),

      body:
      purchaseHistory.isEmpty
          ? const Center(
        child: Text(
          "Belum ada histori pembelian",
        ),
      )
          : ListView.builder(
        itemCount:
        purchaseHistory.length,

        itemBuilder:
            (context, index) {

          final history =
          purchaseHistory[index];

          final List items =
          history["items"];

          return Card(
            margin:
            const EdgeInsets.all(
                12),

            child: Padding(
              padding:
              const EdgeInsets
                  .all(15),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [

                  Text(
                    "Metode: ${history["payment"]}",
                    style:
                    const TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Alamat: ${history["alamat"]}",
                  ),

                  const SizedBox(
                      height: 10),

                  Text(
                    "Total: Rp ${history["total"]}",
                    style:
                    const TextStyle(
                      color:
                      Colors.deepPurple,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height: 10),

                  Column(
                    children: items
                        .map(
                          (item) {

                        return ListTile(
                          leading:
                          Image.network(
                            item.image,
                            width: 50,
                          ),

                          title:
                          Text(
                            item.name,
                          ),

                          subtitle:
                          Text(
                            "Rp ${item.price}",
                          ),
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}