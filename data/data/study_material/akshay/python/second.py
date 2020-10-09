from elasticsearch import Elasticsearch
es = Elasticsearch(HOST="http://localhost",PORT=9200)
es.indices.create(index="abc")
es.indices.put_mapping (
	index="abc",
	body=
	{
	"properties":
		{
		"city" : {
				"type":"keyword"
				},
			"avg": {
				"type": "integer"
				}
		}
	}
)
