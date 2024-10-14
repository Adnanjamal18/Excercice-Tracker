


enum Category{
cardio,
gymnastics,
Strengthtraining,
Aerobic
}

class Excercise {
Excercise({
required this.categories, 
required this.goaltime,
required this.excercisename});
final String excercisename;
final double goaltime;
final Category categories;
}
