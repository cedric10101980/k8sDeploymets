MATCH (n:Attribute {type: 'SYSTEM'})
DELETE n;

CREATE(a:Attribute {id:   apoc.create.uuid(), name: 'StatusFlag', dataType: 'CHARACTER',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                               localdatetime(), updatedOn:
                               localdatetime()}),
      (b:Attribute {id:   apoc.create.uuid(), name: 'Notes', dataType: 'STRING',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                               localdatetime(), updatedOn:
                               localdatetime()}),
      (c:Attribute {id:   apoc.create.uuid(), name: 'NuisanceTimeStamp', dataType: 'DATETIME',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                               localdatetime(), updatedOn:
                               localdatetime()}),
      (d:Attribute {id:   apoc.create.uuid(), name: 'LastAttemptTime', dataType: 'DATETIME',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                               localdatetime(), updatedOn:
                               localdatetime()}),

      (e:Attribute {id:   apoc.create.uuid(), name: 'LastAddress', dataType: 'STRING',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                               localdatetime(), updatedOn:
                               localdatetime()}),
      (f:Attribute {id:   apoc.create.uuid(), name: 'HandledBy', dataType: 'STRING',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                               localdatetime(), updatedOn:
                               localdatetime()}),
      (g:Attribute {id:   apoc.create.uuid(), name: 'Id', dataType: 'STRING',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                                localdatetime(), updatedOn:
                                localdatetime()}),
      (h:Attribute {id:   apoc.create.uuid(), name: 'CreatedOn', dataType: 'DATETIME',
                         type: 'SYSTEM',importEditAllowed:false, createdOn:
                                localdatetime(), updatedOn:
                                localdatetime()}),
      (i:Attribute {id:   apoc.create.uuid(), name: 'UpdatedOn', dataType: 'DATETIME',
                          type: 'SYSTEM',importEditAllowed:false, createdOn:
                                localdatetime(), updatedOn:
                                localdatetime()}),
       (j:Attribute {id:   apoc.create.uuid(), name: 'LastCompletionCode', dataType: 'STRING',
                          type: 'SYSTEM',importEditAllowed:false, createdOn:
                                localdatetime(), updatedOn:
                                localdatetime()});