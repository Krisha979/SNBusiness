class MeetingInfo {
  int meetingId;
  DateTime meetingTime;
  String agenda;
  String location;
  int statusId;
  int organizationId;
  String reminderTime;
  int createdBy;
  DateTime dateCreated;
  String rowstamp;
  bool deleted;
  String fullName;
  String statusName;

  MeetingInfo(
      {this.meetingId,
      this.meetingTime,
      this.agenda,
      this.location,
      this.statusId,
      this.organizationId,
      this.reminderTime,
      this.createdBy,
      this.dateCreated,
      this.rowstamp,
      this.deleted,
      this.fullName,
      this.statusName});

  MeetingInfo.fromJson(Map<String, dynamic> json) {
    meetingId = json['meetingId'];
    meetingTime = json['meetingTime'];
    agenda = json['agenda'];
    location = json['location'];
    statusId = json['statusId'];
    organizationId = json['organizationId'];
    reminderTime = json['reminderTime'];
    createdBy = json['createdBy'];
    dateCreated = json['dateCreated'];
    rowstamp = json['rowstamp'];
    deleted = json['deleted'];
    fullName = json['fullName'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meetingId'] = this.meetingId;
    data['meetingTime'] = this.meetingTime;
    data['agenda'] = this.agenda;
    data['location'] = this.location;
    data['statusId'] = this.statusId;
    data['organizationId'] = this.organizationId;
    data['reminderTime'] = this.reminderTime;
    data['createdBy'] = this.createdBy;
    data['dateCreated'] = this.dateCreated;
    data['rowstamp'] = this.rowstamp;
    data['deleted'] = this.deleted;
    data['fullName'] = this.fullName;
    data['statusName'] = this.statusName;
    return data;
  }
  
}
/*
class MeetingDet {
  final List<MeetingInfo> results;
  final String error;

  MeetingDet(this.results, this.error);

  MeetingDet.fromJson(Map<String, dynamic> json)
      : results =
            (json["results"] as List).map((i) => new MeetingInfo.fromJson(i)).toList(),
        error = "";

  MeetingDet.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
*/
