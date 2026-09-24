class HomeState {
  final List<Drive> drivesList;

  HomeState({this.drivesList = const []});

  HomeState copyWith({List<Drive>? drivesList, bool? isLoading}) {
    return HomeState(drivesList: drivesList ?? this.drivesList);
  }
}

/// Storage Drive Model
class Drive {
  final String icon;
  final String title;
  final String size;

  Drive({required this.icon, required this.title, required this.size});
}
