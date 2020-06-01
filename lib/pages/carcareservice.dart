import 'package:final_app/model/user.dart';
import 'package:final_app/service/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../item.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import '../bloc/cartlistBloc.dart';
import '../model/food_item.dart';
class CarCareService extends StatefulWidget {
  @override
  _CarCareServiceState createState() => _CarCareServiceState();
}

class _CarCareServiceState extends State<CarCareService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text(
          'Car Care Service',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          scrollDirection: Axis.vertical,

          children: <Widget>[
            for (var foodItem in carCareService.foodItems)
              Builder(
                builder: (context) {
                  return ItemContainer(foodItem: foodItem);
                },
              )
          ],
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {

  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();


  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }


  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        return GestureDetector(
          onTap: () async{
            await DatabaseService(uid: user.uid).uploadService(foodItem);
            addToCart(foodItem);
            final snackBar = SnackBar(
              content: Text('${foodItem.title} added to Cart'),
              duration: Duration(milliseconds: 550),
            );

            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Items(
            itemName: foodItem.title,
            itemPrice: foodItem.price,
           
            leftAligned: (foodItem.id % 2) == 0 ? true : false,
          ),
        );
      }
    );
  }
}
