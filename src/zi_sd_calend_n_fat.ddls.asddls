@AbapCatalog.sqlViewName: 'ZISDCALENDNFAT'
@EndUserText.label: 'Saldo de Itens'
define view ZI_SD_CALEND_N_FAT as select from isdslsdocschedln

inner join isdsalesdocitem on isdsalesdocitem.salesdocument = isdslsdocschedln.salesdocument
                                                             and isdsalesdocitem.salesdocumentitem = isdslsdocschedln.salesdocumentitem

                                   left outer join zisdcalendfat on zisdcalendfat.salesdocument = isdslsdocschedln.salesdocument
                                                                and zisdcalendfat.salesdocumentitem = isdslsdocschedln.salesdocumentitem
                                                                and zisdcalendfat.scheduleline = isdslsdocschedln.scheduleline
                                   
                                   //inner join isddocmlprocflow on isddocmlprocflow.precedingdocument = isdslsdocschedln.salesdocument
                                   //                         and isddocmlprocflow.precedingdocumentitem = isdslsdocschedln.salesdocumentitem
                                   //                        and (isddocmlprocflow.subsequentdocumentcategory = 'M' 
                                   //                          or isddocmlprocflow.subsequentdocumentcategory = 'N')
    
{
    key isdslsdocschedln.salesdocument,
    key isdslsdocschedln.salesdocumentitem,
    
    //isddocmlprocflow.subsequentdocumentitem,
    isdslsdocschedln.scheduleline,
    
    max(zisdcalendfat.qtd) as qtd,
    isdsalesdocitem.orderquantity - coalesce(zisdcalendfat.qtd, 0) as saldo
    
} group by isdslsdocschedln.salesdocument, isdslsdocschedln.salesdocumentitem, isdslsdocschedln.scheduleline, isdsalesdocitem.orderquantity, zisdcalendfat.qtd
