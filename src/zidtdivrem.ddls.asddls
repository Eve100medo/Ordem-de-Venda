@AbapCatalog.sqlViewName: 'ZIDTDIVREM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data da divisão de cada remessa'
define view ZI_SD_DTDIVREM as select from isddocmlprocflow
                            join iledelivdoc on iledelivdoc.deliverydocument = isddocmlprocflow.subsequentdocument
                            join iledelivdocitem on iledelivdocitem.deliverydocument = isddocmlprocflow.subsequentdocument
                            and iledelivdocitem.deliverydocumentitem = isddocmlprocflow.subsequentdocumentitem
{
    key isddocmlprocflow.precedingdocument,
    key isddocmlprocflow.precedingdocumentitem,
    
    iledelivdocitem.productavailabilitydate,
    iledelivdoc.deliverydate,
    isddocmlprocflow.subsequentdocument,
    
    max(iledelivdocitem.creationdate) as creationdate,
    max(isddocmlprocflow.quantityinbaseunit) as QUANTITYINBASEUNIT
    
} where isddocmlprocflow.subsequentdocumentcategory = 'J'
  group by isddocmlprocflow.precedingdocument,
           isddocmlprocflow.precedingdocumentitem,
           isddocmlprocflow.subsequentdocument,
           iledelivdocitem.productavailabilitydate,
           iledelivdoc.deliverydate
