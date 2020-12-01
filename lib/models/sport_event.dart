class SportEvent {
  final DateTime scheduled;
  final int homeScore;
  final int awayScore;
  final String winnerId;
  final String matchStatus;

  SportEvent({
    this.scheduled,
    this.homeScore,
    this.awayScore,
    this.winnerId,
    this.matchStatus
  });
}