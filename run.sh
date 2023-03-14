for bot in $(cat config.json | jq -r 'to_entries[] | "\(.key),\(.value.source)"'); do
  name=$(echo $bot | cut -d',' -f1); \
  source=$(echo $bot | cut -d',' -f2); \
  git clone $source $name; \
  cd $name && pip install --no-cache-dir -r requirements.txt && cd ..; \
done
