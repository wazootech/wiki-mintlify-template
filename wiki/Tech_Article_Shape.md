---
type: sh:NodeShape
sh:targetClass: schema:TechArticle
sh:property:
  - sh:path: schema:headline
    sh:name: title
    sh:datatype: xsd:string
    sh:minCount: 1
    sh:maxCount: 1
    sh:message: "TechArticle must have exactly one title."
  - sh:path: schema:description
    sh:datatype: xsd:string
    sh:minCount: 1
    sh:message: "TechArticle must have a description."
---
