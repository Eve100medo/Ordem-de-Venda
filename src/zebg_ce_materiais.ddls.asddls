@ObjectModel: {
    query: {
        implementedBy: 'ABAP:ZCL_CE_BUSCA_MATERIAIS'
    }

}

@EndUserText.label: 'Busca Materiais'
define custom entity ZEBG_CE_MATERIAIS

{
  key Product : matnr;
  CreationDate: abap.char(8);
  CreatedByUser: abap.char(12);
  CreateTime: tims;
  LastChangeDate: dats;
  ProductType: abap.char(4);
  ProductName: abap.char(40);
  
}
