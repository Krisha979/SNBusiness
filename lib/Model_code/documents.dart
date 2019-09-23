class Document {
  int documentId;
  int fileTypeId;
  String documentURL;
  String fileName;
  String docDate;
  String expiryDate;
  int organizationId;
  String dateCreated;
  bool deleted;
  String rowstamp;

  Document(
      {this.documentId,
      this.fileTypeId,
      this.documentURL,
      this.fileName,
      this.docDate,
      this.expiryDate,
      this.organizationId,
      this.dateCreated,
      this.deleted,
      this.rowstamp});

  Document.fromJson(Map<String, dynamic> json) {
    documentId = json['documentId'];
    fileTypeId = json['fileTypeId'];
    documentURL = json['documentURL'];
    fileName = json['fileName'];
    docDate = json['docDate'];
    expiryDate = json['expiryDate'];
    organizationId = json['organizationId'];
    dateCreated = json['dateCreated'];
    deleted = json['deleted'];
    rowstamp = json['rowstamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['documentId'] = this.documentId;
    data['fileTypeId'] = this.fileTypeId;
    data['documentURL'] = this.documentURL;
    data['fileName'] = this.fileName;
    data['docDate'] = this.docDate;
    data['expiryDate'] = this.expiryDate;
    data['organizationId'] = this.organizationId;
    data['dateCreated'] = this.dateCreated;
    data['deleted'] = this.deleted;
    data['rowstamp'] = this.rowstamp;
    return data;
  }
}