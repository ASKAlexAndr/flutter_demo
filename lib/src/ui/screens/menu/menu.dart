import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/blocs/catalog/catalog_cubit.dart';
import 'package:flutter_demo/src/config/application.dart';
import 'package:flutter_demo/src/config/routes.dart';
import '../../../models/product_model.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => CatalogCubit(Application.catalogRepository),
        child: BlocBuilder<CatalogCubit, CatalogState>(
          builder: (context, state) => buildList(state.catalog),
        ),
      ),
    );
  }

  Widget buildList(CatalogModel catalog) {
    return GridView.builder(
        itemCount: catalog.items.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: SizedBox(
                  child: Hero(
                      tag: catalog.items[index].picture,
                      child: Image.network(
                        catalog.items[index].picture,
                        fit: BoxFit.cover,
                      ))),
              // onTap: () => openProductDetail(catalog.items[index], index),
              onTap: () => Navigator.of(context)
                  .pushNamed(Routes.product, arguments: catalog.items[index]),
            ),
          );
        });
  }
}
// class Menu extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MenuState();
//   }
// }

// class _MenuState extends State<Menu> {
//   @override
//   void initState() {
//     super.initState();
//     // bloc.fetchCatalog();
//   }

//   @override
//   void dispose() {
//     // bloc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         // stream: bloc.catalog,
//         builder: (context, AsyncSnapshot<CatalogModel> snapshot) {
//           if (snapshot.hasData) {
//             return buildList(snapshot);
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }

// }
