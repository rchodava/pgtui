export type Column = {
  name: string
  type: string
  query: string
}

export type View = {
  name: string
  columns: Array<Column>
  query: string
  grants: Array<Grant>
  triggers: {
    [triggerName: string]: Trigger
  }
  alterations: Array<TableAlteration>
  owner: string
}

export type Policy = {
  name: string
  query: string
}

export type TableAlteration = {
  query: string
}

export type Grant = {
  query: string
}

export type Trigger = {
  name: string
  functionName: string
  query: string
}

export type PgFunction = {
  name: string
  owner: string
  query: string
}
export type Sequence = {
  name: string
  grants: Array<Grant>
  alterations: Array<TableAlteration>
  owner: string
}

export type Table = {
  name: string
  columns: Array<Column>
  query: string
  policies: {
    [policyName: string]: Policy
  }
  triggers: {
    [triggerName: string]: Trigger
  }
  alterations: Array<TableAlteration>
  sequences: Array<Sequence>
  grants: Array<Grant>
  owner: string
}

export type Schema = {
  name: string
  tables: {
    [tableName: string]: Table
  }
  views: {
    [viewName: string]: View
  }
  functions: {
    [functionName: string]: PgFunction
  }
  grants: Array<Grant>
  owner: string
  _tablelessSequences: { [sequenceName: string]: Sequence }
}

export type Extension = {
  name: string
  query: string
}

export type Database = {
  schemas: {
    [schemaName: string]: Schema
  }
  misc: Array<{ query: string }>
  extensions: Array<Extension>
}
