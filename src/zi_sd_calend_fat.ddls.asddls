@AbapCatalog.sqlViewName: 'ZISDCALENDFAT'
@EndUserText.label: 'Faturamento dos Itens'
define view ZI_SD_CALEND_FAT as select from isdslsdocschedln

    inner join isddocmlprocflow on isddocmlprocflow.precedingdocument = isdslsdocschedln.salesdocument
                                                            and isddocmlprocflow.precedingdocumentitem = isdslsdocschedln.salesdocumentitem
                                                           and (isddocmlprocflow.subsequentdocumentcategory = 'M' 
                                                             or isddocmlprocflow.subsequentdocumentcategory = 'N')
                                                            and isddocmlprocflow.subsequentdocumentitem = isdslsdocschedln.salesdocumentitem
{
     key isdslsdocschedln.salesdocument,
    key isdslsdocschedln.salesdocumentitem,
    
    //isddocmlprocflow.subsequentdocumentitem,
    isdslsdocschedln.scheduleline,
    
    sum( case
        when isddocmlprocflow.subsequentdocumentcategory = 'M' then
            isddocmlprocflow.quantityinbaseunit
        when isddocmlprocflow.subsequentdocumentcategory = 'N' then
            isddocmlprocflow.quantityinbaseunit * ( -1 )
    end ) as qtd
} group by isdslsdocschedln.salesdocument, isdslsdocschedln.salesdocumentitem, isdslsdocschedln.scheduleline
