@AbapCatalog.sqlViewName: 'ZEBGBC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Relatório Base Conhecimento'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.modelCategory: #BUSINESS_OBJECT // definir que ela é um BO
@ObjectModel.compositionRoot: true // definir que ela é uma composição
@ObjectModel.transactionalProcessingEnabled: true // definir que ele pode ser processada com CRUD
@ObjectModel.createEnabled: true // habilitando a criação das entradas
@ObjectModel.updateEnabled: true // habilitando a modificação  das entradas
@ObjectModel.deleteEnabled: true // habilitando a deleção das  entradas
@ObjectModel.writeActivePersistence: 'zebg_t_user' // DEFINIR A TABELA QUE VAI SER MANIPULADA



@OData.publish:true
define view ZEBG_BASE_Conhec
  as select from zebg_t_user as _user
  association [0..*] to zebg_t_usertools as _usertools on $projection.Userid = _usertools.userid
{

       @UI: { lineItem: [{position: 10}],
           selectionField: [{ position: 10 }] }  //Filtrar campos e posicionar campos no aplicativo
       @Consumption.valueHelpDefinition: [ { entity: { name : 'ZEBGCDS_USERS_VH', element: 'Userid'} }]    
  key  _user.userid          as Userid,
      @UI: { lineItem: [{position: 20}],
           selectionField: [{ position: 20 }] }
      @Consumption.valueHelpDefinition: [ { entity: { name : 'ZEBGCDS_USERS_VH', element: 'Email'} }]     
       _user.email           as Email,
       @UI.lineItem: [{position: 30}]
       _user.fullname        as Fullname,
      @UI: { lineItem: [{position: 70, label : 'Ferramenta'}],
           selectionField: [{ position: 30 }] }
      @Consumption.valueHelpDefinition: [ { entity: { name : 'ZEBGCDS_TOOLS_VH', element: 'Toolname'} }]  
      @EndUserText.label: 'Nome Ferramenta'   
       _usertools.toolname  as Toolname,
       @UI.lineItem:[{position: 50}]           
       _usertools.knowledge as Knowledge,
       @UI.lineItem: [ { position: 60 }] 
       _usertools.interest  as Interest,
       @UI: { lineItem: [{position: 70, label: 'Treinamento'}], // Para nome do campo 
           selectionField: [{ position: 40 }] }
       @EndUserText.label:'Posso dar Treinamento '    // Para barra de pesquisa (filtro)
       _usertools.training  as Trainning,
       
       _usertools

}
