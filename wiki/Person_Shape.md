---
type: sh:NodeShape
sh:targetClass: schema:Person
sh:property:
  - sh:path: schema:givenName
    sh:datatype: xsd:string
    sh:minCount: 1
    sh:message: "Person must have a given name."
  - sh:path: schema:familyName
    sh:datatype: xsd:string
    sh:minCount: 1
    sh:message: "Person must have a family name."
  - sh:path: schema:headline
    sh:name: title
    sh:datatype: xsd:string
    sh:minCount: 1
    sh:message: "Person must have a title."
  - sh:path: schema:description
    sh:datatype: xsd:string
    sh:minCount: 1
    sh:message: "Person must have a description."
---
