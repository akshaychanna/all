from elasticsearch import Elasticsearch
es = Elasticsearch(HOST="http://localhost",PORT=9200)
res = es.search(index="first",body = {
   "size": 1,
   	"query": {
     	"bool": {
     		"must":[
     			{
     			"match_all": {}
     			}
     		]
     	}
     }
    }
)

print res