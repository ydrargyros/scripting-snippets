# Get cluster health
curl -X GET "localhost:9200/_cat/health?v=true&pretty"
curl -X GET "localhost:9200/_cluster/health?filter_path=status,*_shards&pretty"

# Get shards info
curl -X GET "localhost:9200/_cat/shards?v=true&pretty"

# Delete an index
curl -k -X DELETE "localhost:9200/zeebe-record-dev_*/" -H 'Content-Type: application/json'

# Change watermarks
curl -X PUT "localhost:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.disk.watermark.low": "90%",
    "cluster.routing.allocation.disk.watermark.high": "95%",
    "cluster.routing.allocation.disk.watermark.flood_stage": "97%",
    "cluster.routing.allocation.disk.watermark.flood_stage.frozen": "97%"
  }
}
'

# Change the readonly index deletion mode
curl -X PUT "localhost:9200/*/_settings?expand_wildcards=all&pretty" -H 'Content-Type: application/json' -d'
{
  "index.blocks.read_only_allow_delete": null
}
'

# Change the default number of replicas
curl -k -X PUT "localhost:9200/_settings
{
  "index.number_of_replicas": 0
}" -H 'Content-Type: application/json'



curl -u elastic:iVPEON8HIhxu1Pzhnyir --cacert /etc/elasticsearch/certs/http_ca.crt "https://127.0.0.1:9200/_cat/nodes?v&pretty"
