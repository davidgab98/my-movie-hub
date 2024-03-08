extension IntExtension on int {
  String formatDuration() {
    final hours = this ~/ 60; // División entera para obtener las horas
    final remainingMinutes =
        this % 60; // Resto para obtener los minutos restantes
    return '${hours}h ${remainingMinutes}m';
  }
}
