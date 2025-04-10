echo "Current directory: $(pwd)"
ls -l /dashboard.ndjson

# 2. Update import command
curl -X POST "http://kibana:5601/api/saved_objects/_import?overwrite=true" \
  -H "kbn-xsrf: true" \
  --form file=@/dashboard.ndjson