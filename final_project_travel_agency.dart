import 'dart:io';
List <travel_agency> trips= [travel_agency()];
int num_of_trips=0;

void main(List<String> arguments)
{

  while (true)
  { print("************************************************************************");
  print("choose the operation you want: ");
  print(" 1:add trip                      2:edit trip     3:delete trip     4:view trip  ");
  print(' 5:search trip with price        6:reverse       7:discount        8:display last 10 trips ');
  print(' 9:view passengers              10:exit  ');
  print("************************************************************************");

  trips.sort((a, b) => a.id.compareTo(b.id)); // to sort data by id

  var user_choice = int.parse(stdin.readLineSync()!);
  if (user_choice == 1)
  {
    trips.add(travel_agency().add_trip());
    trips[num_of_trips+1].date="${trips[num_of_trips+1].day.toString()}-${trips[num_of_trips+1].month.toString().padLeft(2,'0')}-${trips[num_of_trips+1].year.toString().padLeft(2,'0')}";
    num_of_trips++;

  }

  else if(user_choice==2)
  {
    print("enter the id of the trip you want to edit: ");
    var trip_id= int.parse(stdin.readLineSync()!);

    for(int i=0;i<trips.length;i++)
    {
      if (trip_id == trips[i].id)
        trips[i].edit_trip(i);
    }
  }

  else if(user_choice==3)
  {
    print("enter the id of the trip you want to delete : ");
    var trip_id= int.parse(stdin.readLineSync()!);

    for(int i=0;i<trips.length;i++)
    {
      if (trip_id == trips[i].id)
      {
        trips[i].delete_trip(i);
        num_of_trips--;
      }
    }
  }

  else if(user_choice==4)
  {

    if(num_of_trips==0) {print("not available trips ");}
    else{travel_agency().view_trips();}

  }

  else if(user_choice==5)
  {
    print("enter the price of the trip you want : ");
    var price= int.parse(stdin.readLineSync()!);

    for(int i=0;i<trips.length;i++)
    {
      if (price == trips[i].price)
      {travel_agency().search_trip(i);
      }

    }
  }

  else if(user_choice==6)
  {
    print("enter the id of the trip you want to reserve: ");
    var trip_id= int.parse(stdin.readLineSync()!);

    for(int i=0;i<trips.length;i++)
    {
      if (trip_id == trips[i].id)
        trips[i].reverve_trip(i);
    }



  }

  else if(user_choice==7)
  {
    travel_agency().discount();
  }

  else if(user_choice==8)
  {
    travel_agency().display();
  }

  else if(user_choice==9)
  {
    travel_agency().passengers_in_all_trips();
  }

  else if(user_choice==10)
  {
    print('ended!');
    break;
  }

  }

}

class travel_agency {

  late int  id=0;
  late String ? location;
  late int ? passenger_limit;
  late int  reserved_tickets_number=0;
  late int ? day;
  late int ? month;
  late int ? year;
  String  date="";
  int  price=0;
  late List<String> passenger_name=[];

  travel_agency({
    id,
    this.location,
    this.passenger_limit,
    reserved_tickets_number,
    this.day,
    this.month,
    this.year,
    date,
    price,
    passenger_name
  }) {}


  travel_agency add_trip()
  {
    print(' id: ');
    id = int.parse(stdin.readLineSync()!);

    print(' location: ');
    location = stdin.readLineSync();

    print(' passenger_limit: ');
    passenger_limit = int.parse(stdin.readLineSync()!);

    print(' date: ');

    print(' day: ');
    day = int.parse(stdin.readLineSync()!);
    print(' month: ');
    month = int.parse(stdin.readLineSync()!);
    print(' year: ');
    year = int.parse(stdin.readLineSync()!);

    print('price: ');
    price = int.parse(stdin.readLineSync()!);

    print('added!');
    return this ;
  }

  void edit_trip(int i)
  {
    print(' id: ');
    trips[i].id = int.parse(stdin.readLineSync()!);
    print(' location: ');
    trips[i].location = stdin.readLineSync();
    print(' passenger_limit: ');
    trips[i].passenger_limit = int.parse(stdin.readLineSync()!);
    print(' day: ');
    trips[i].day = int.parse(stdin.readLineSync()!);
    print(' month: ');
    trips[i].month = int.parse(stdin.readLineSync()!);
    print(' year: ');
    trips[i].year = int.parse(stdin.readLineSync()!);

    trips[i].date="${trips[i].day.toString()}-${trips[i].month.toString().padLeft(2,'0')}-${trips[i].year.toString().padLeft(2,'0')}";


    print('price: ');
    trips[i].price = int.parse(stdin.readLineSync()!);

    print('edited!');
  }

  void delete_trip(int i)
  {
    trips.removeAt(i);
    print("deleted!");
  }

  void view_trips()
  {
    print("the available trips are : ");
    for(int i=1;i<trips.length;i++)
    {
      print('id: ${trips[i].id}   ' + 'location: ${trips[i].location}  ' + 'passenger_limit: ${trips[i].passenger_limit}    ' + 'reserved_tickets_number: ${trips[i].reserved_tickets_number}     '+ 'date: ${trips[i].date}    '   + 'price: ${trips[i].price} LE');

    }


  }

  void search_trip(int i)
  {
    print('id: ${trips[i].id}   ' + 'location: ${trips[i].location}  ' + 'passenger_limit: ${trips[i].passenger_limit}    ' + 'reserved_tickets_number: ${trips[i].reserved_tickets_number}     '+ 'date: ${trips[i].date}    '   + 'price: ${trips[i].price} LE');

  }

  void reverve_trip(int i)
  {
    if(trips[i].passenger_limit==trips[i].reserved_tickets_number)
    {
      print(" sorry,this trip is complete ");
    }
    else
    {
      print("what is your name");
      trips[i].passenger_name.add(stdin.readLineSync()!);
      reserved_tickets_number++;
      print("reserved!" + " your trip number: (${trips[i].id}) , your ticket number: (${trips[i].reserved_tickets_number})");
    }


  }

  void discount()
  { print("available offers : ") ;
  for(int i=1;i<trips.length;i++)
  {
    if(trips[i].price >= 10000)

    {print("trip_number:${trips[i].id}     " + "  trip price before discount:${trips[i].price}L.E    " + "    trip price after discount:${(trips[i].price)-(trips[i].price)*.2}L.E ");
    }

  }
  }

  void display()
  {
    int count = 0;
    print("the latest 10 trips are : ");
    for (int i =trips.length-1; i > 0; i--) {
      print('id: ${trips[i].id}   ' + 'location: ${trips[i].location}  ' + 'passenger_limit: ${trips[i].passenger_limit}    ' + 'reserved_tickets_number: ${trips[i].reserved_tickets_number}     '+ 'date: ${trips[i].date}    '   + 'price: ${trips[i].price} LE');
      count++;
      if(count==10) {break;}

    }
  }

  void passengers_in_all_trips()
  { print("the passenger in all trips are:");
  for(int i=1;i<trips.length;i++)
  {print("passengers in trip(${trips[i].id}) are :");
  for(int j=0;j<trips[i].passenger_name.length;j++)
  {
    print(trips[i].passenger_name[j]);
  }
  }
  }



}