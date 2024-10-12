import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../config/items/app_colors.dart';
import '../../config/routes/route_name.dart';

class GridProductItem extends StatelessWidget{
  const GridProductItem({Key? key, required this.id,required this.title,required this.image, }) : super(key: key);

 final String id,title,image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  BorderRadius.circular(30),
      child: GridTile(child: 
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.productDetails,
                            arguments:id, // Passing product ID
);
          },
          child: Image.asset(
                image,
                
          ),
        )
        ,
        footer: GridTileBar(
      title: Text(title,
      textAlign: TextAlign.center,),
      backgroundColor: AppColors.black53,
      leading: IconButton(icon: 
      Icon(Icons.favorite_border), onPressed: (){} ),
      trailing: IconButton(icon: 
      Icon(Icons.shopping_cart), onPressed: (){} ),
        ),
        ),
    );
  }
}