class Imagetype {
  String fileType;
  Imagetype(this.fileType);
  static List<Imagetype> getFileType(){
  return <Imagetype>[
  Imagetype ('vat'),
  Imagetype ('invoice'),
  Imagetype ('expenditure'),
  Imagetype ('bill'),
  ];
}
}