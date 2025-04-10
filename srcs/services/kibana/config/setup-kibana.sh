#!/bin/sh

# Wait for Kibana to be fully ready
until curl -sSf -X GET --head http://kibana:5601/api/status | grep -q "HTTP/1.1 200 OK"; do
  echo "Waiting for Kibana..."
  sleep 5
done

# Create index pattern if not exists
if ! curl -s -f -X GET "http://kibana:5601/api/saved_objects/index-pattern/nginx-*" >/dev/null; then
  curl -X POST "http://kibana:5601/api/saved_objects/index-pattern/nginx-*" \
    -H "kbn-xsrf: true" \
    -H "Content-Type: application/json" \
    -d '{
      "attributes": {
        "title": "nginx-*",
        "timeFieldName": "@timestamp"
      }
    }'
fi

# Import dashboard with retries
for i in $(seq 1 5); do
  if curl -X POST "http://kibana:5601/api/saved_objects/_import?overwrite=true" \
    -H "kbn-xsrf: true" \
    --form file=@/usr/share/kibana/nginx-dashboard.ndjson; then
    echo "Dashboard imported successfully"
    exit 0
  fi
  echo "Retrying dashboard import ($i/5)..."
  sleep 10
done

echo "Failed to import dashboard after 5 attempts"
exit 1