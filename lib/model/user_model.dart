class UserModel{
  late String userId,email,name,pic;

  UserModel({required this.userId,required this.email,required this.name,required this.pic});


  //here the data came as json and i save it in my variables
  UserModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null){
      return;
    }
    userId=map['userId'];   //the data in the map which equal to userId
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }
  toJson(){
    return{
      'userId' : userId,
      'email' : email,
      'name' : name,
      'pic' : pic,
    };

    //A toJson() method, which converts a User instance into a map (json).
  }


}