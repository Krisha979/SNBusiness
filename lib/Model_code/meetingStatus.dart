class MeetingStatus {
  int statusId;
  int statysTypeId;
  String statusName;
  String dateCreated;
  bool deleted;
  String rowstamp;

  MeetingStatus(
      {this.statusId,
      this.statysTypeId,
      this.statusName,
      this.dateCreated,
      this.deleted,
      this.rowstamp});

  MeetingStatus.fromJson(Map<String, dynamic> json) {
    statusId = json['statusId'];
    statysTypeId = json['statysTypeId'];
    statusName = json['statusName'];
    dateCreated = json['dateCreated'];
    deleted = json['deleted'];
    rowstamp = json['rowstamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusId'] = this.statusId;
    data['statysTypeId'] = this.statysTypeId;
    data['statusName'] = this.statusName;
    data['dateCreated'] = this.dateCreated;
    data['deleted'] = this.deleted;
    data['rowstamp'] = this.rowstamp;
    return data;
  }
}