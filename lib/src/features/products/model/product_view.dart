// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // SqfEntityFormGenerator
// // **************************************************************************

// part of 'product.dart';

// class ProductAdd extends StatefulWidget {
//   ProductAdd(this._products);
//   final dynamic _products;
//   @override
//   State<StatefulWidget> createState() => ProductAddState(_products as Product);
// }

// class ProductAddState extends State {
//   ProductAddState(this.products);
//   Product products;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController txtName = TextEditingController();
//   final TextEditingController txtQuantity = TextEditingController();
//   final TextEditingController txtSelling_price = TextEditingController();
//   final TextEditingController txtCost_price = TextEditingController();
//   final TextEditingController txtImageUrl = TextEditingController();

//   @override
//   void initState() {
//     txtName.text = products.name == null ? '' : products.name.toString();
//     txtQuantity.text =
//         products.quantity == null ? '' : products.quantity.toString();
//     txtSelling_price.text =
//         products.selling_price == null ? '' : products.selling_price.toString();
//     txtCost_price.text =
//         products.cost_price == null ? '' : products.cost_price.toString();
//     txtImageUrl.text =
//         products.imageUrl == null ? '' : products.imageUrl.toString();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: (products.id == null)
//             ? Text('Add a new products')
//             : Text('Edit products'),
//       ),
//       body: Container(
//         alignment: Alignment.topCenter,
//         width: double.infinity,
//         height: double.infinity,
//         child: SingleChildScrollView(
//           child: Padding(
//               padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     buildRowName(),
//                     buildRowQuantity(),
//                     buildRowSelling_price(),
//                     buildRowCost_price(),
//                     buildRowImageUrl(),
//                     TextButton(
//                       child: saveButton(),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // If the form is valid, display a Snackbar.
//                           save();
//                           /* Scaffold.of(context).showSnackBar(SnackBar(
//                               duration: Duration(seconds: 2),
//                               content: Text('Processing Data')));
//                            */
//                         }
//                       },
//                     )
//                   ],
//                 ),
//               )),
//         ),
//       ),
//     );
//   }

//   Widget buildRowName() {
//     return TextFormField(
//       controller: txtName,
//       decoration: InputDecoration(labelText: 'Name'),
//     );
//   }

//   Widget buildRowQuantity() {
//     return TextFormField(
//       validator: (value) {
//         if (value!.isNotEmpty && int.tryParse(value) == null) {
//           return 'Please Enter valid number';
//         }

//         return null;
//       },
//       controller: txtQuantity,
//       decoration: InputDecoration(labelText: 'Quantity'),
//     );
//   }

//   Widget buildRowSelling_price() {
//     return TextFormField(
//       validator: (value) {
//         if (value!.isNotEmpty && double.tryParse(value) == null) {
//           return 'Please Enter valid number';
//         }

//         return null;
//       },
//       controller: txtSelling_price,
//       decoration: InputDecoration(labelText: 'Selling_price'),
//     );
//   }

//   Widget buildRowCost_price() {
//     return TextFormField(
//       validator: (value) {
//         if (value!.isNotEmpty && double.tryParse(value) == null) {
//           return 'Please Enter valid number';
//         }

//         return null;
//       },
//       controller: txtCost_price,
//       decoration: InputDecoration(labelText: 'Cost_price'),
//     );
//   }

//   Widget buildRowImageUrl() {
//     return TextFormField(
//       controller: txtImageUrl,
//       decoration: InputDecoration(labelText: 'ImageUrl'),
//     );
//   }

//   Container saveButton() {
//     return Container(
//       padding: const EdgeInsets.all(7.0),
//       decoration: BoxDecoration(
//           color: Color.fromRGBO(95, 66, 119, 1.0),
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(5.0)),
//       child: Text(
//         'Save',
//         style: TextStyle(color: Colors.white, fontSize: 20),
//       ),
//     );
//   }

//   void save() async {
//     products
//       ..name = txtName.text
//       ..quantity = int.tryParse(txtQuantity.text)
//       ..selling_price = double.tryParse(txtSelling_price.text)
//       ..cost_price = double.tryParse(txtCost_price.text)
//       ..imageUrl = txtImageUrl.text;
//     await products.save();
//     if (products.saveResult!.success) {
//       Navigator.pop(context, true);
//     } else {
//       UITools(context).alertDialog(products.saveResult.toString(),
//           title: 'save Product Failed!', callBack: () {});
//     }
//   }
// }
