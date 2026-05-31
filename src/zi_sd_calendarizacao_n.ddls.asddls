@AbapCatalog.sqlViewName: 'ZICALEND_N'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds Básica Calendarização'




@ObjectModel.modelCategory: #BUSINESS_OBJECT // definir que ela é um BO
@ObjectModel.compositionRoot: true // definir que ela é uma composição
@ObjectModel.transactionalProcessingEnabled: true // definir que ele pode ser processada com CRUD
@ObjectModel.createEnabled: true // habilitando a criação das entradas
@ObjectModel.updateEnabled: true // habilitando a modificação  das entradas
@ObjectModel.deleteEnabled: true // habilitando a deleção das  entradas
@ObjectModel.writeActivePersistence: 'isdslsdocschedln' // DEFINIR A TABELA QUE VAI SER MANIPULADA

define root view ZI_SD_CALENDARIZACAO_N
  as select from    isdslsdocschedln
    inner join      isdsalesdocitem  on  isdsalesdocitem.salesdocument     = isdslsdocschedln.salesdocument
                                     and isdsalesdocitem.salesdocumentitem = isdslsdocschedln.salesdocumentitem

    inner join      zisdcalendnfat   on  zisdcalendnfat.salesdocument     =  isdslsdocschedln.salesdocument
                                     and zisdcalendnfat.salesdocumentitem =  isdslsdocschedln.salesdocumentitem
                                     and zisdcalendnfat.scheduleline      =  isdslsdocschedln.scheduleline
                                     and zisdcalendnfat.saldo             <> 0

    left outer join zidtdivrem       on  zidtdivrem.precedingdocument      = isdsalesdocitem.salesdocument
                                     and zidtdivrem.precedingdocumentitem  = isdsalesdocitem.salesdocumentitem
                                     and (
                                        zidtdivrem.productavailabilitydate = isdslsdocschedln.deliverydate
                                        or zidtdivrem.deliverydate         = isdslsdocschedln.deliverydate
                                      )

    left outer join isddocmlprocflow on  isddocmlprocflow.precedingdocument            = zidtdivrem.subsequentdocument
                                     and isddocmlprocflow.subsequentdocumentitem       = zidtdivrem.precedingdocumentitem
                                     and (
                                        isddocmlprocflow.subsequentdocumentcategory    = 'M'
                                        or isddocmlprocflow.subsequentdocumentcategory = 'N'
                                      )
    left outer join iledelivdocitem  on  iledelivdocitem.referencesddocument     = isdslsdocschedln.salesdocument
                                     and iledelivdocitem.referencesddocumentitem = isdslsdocschedln.salesdocumentitem // Ajustes

    left outer join isdsalesdoc      on isdsalesdoc.salesdocument = isdslsdocschedln.salesdocument

  //left outer join zisdcalendrem    on  zisdcalendrem.salesdocument     = isdslsdocschedln.salesdocument
  // and zisdcalendrem.salesdocumentitem = isdslsdocschedln.salesdocumentitem

{
      
  key isdslsdocschedln.salesdocument,
  key isdslsdocschedln.salesdocumentitem,
  key isdslsdocschedln.scheduleline,
      isdslsdocschedln.deliverydate,
      iledelivdocitem.deliverydocument, // Remessa
      zidtdivrem.creationdate,
      isdslsdocschedln.delivblockreasonforschedline,
      zidtdivrem.quantityinbaseunit, //Quantidade da remessa
      //isddocmlprocflow.quantityinbaseunit,
      isdsalesdoc.salesdocumenttype, //tipo de documento
      //isddocmlprocflow.subsequentdocumentcategory,

      case
          when zidtdivrem.precedingdocumentitem is not null and //Tem remessa
               isddocmlprocflow.subsequentdocumentcategory is null then //E não tem fatura
              zidtdivrem.quantityinbaseunit //Quantidade da remessa


         when zidtdivrem.precedingdocumentitem is not null and //ajuste saldo faturado zerado
               isddocmlprocflow.subsequentdocumentcategory is not null then //ajuste saldo faturado zerado
               zidtdivrem.quantityinbaseunit //ajuste saldo faturado zerado


          when zidtdivrem.precedingdocumentitem is null then //Não tem remessa
               isdslsdocschedln.confdorderqtybymatlavailcheck //Quantidade confirmada da divisão - como estava!!!


          when isddocmlprocflow.subsequentdocumentcategory = 'M' then
              isdslsdocschedln.schedulelineorderquantity - isddocmlprocflow.quantityinbaseunit
          when isddocmlprocflow.subsequentdocumentcategory = 'N' then
              isdslsdocschedln.schedulelineorderquantity + isddocmlprocflow.quantityinbaseunit

      end  as Saldo,

      case
           when zidtdivrem.quantityinbaseunit = saldo
            and isddocmlprocflow.subsequentdocumentcategory = 'M' then // FATURA
                isdslsdocschedln.confdorderqtybymatlavailcheck -  zidtdivrem.quantityinbaseunit //Quantidade confirmada da divisão - Quantidade da remessa
           when isddocmlprocflow.subsequentdocumentcategory = 'N' then // ESTORNO DE FATURA
                zidtdivrem.quantityinbaseunit * ( -1 )
           else
      saldo - zidtdivrem.quantityinbaseunit

       end as qtd_remanecente

}
where
      isdsalesdocitem.salesdocumentrjcnreason        =  '' //and (zisdcalendnfat.saldo <> 0 or zisdcalendnfat.subsequentdocumentitem is null) //Apenas os não totalmente faturados
  and isdslsdocschedln.confdorderqtybymatlavailcheck <> 0
