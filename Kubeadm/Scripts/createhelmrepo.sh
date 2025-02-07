mkdir -p ~/local-helm-repo
helm pull prometheus-community/prometheus  -d ~/local-helm-repo
helm pull prometheus/prometheus  -d ~/local-helm-repo
helm pull grafana/grafana -d ~/local-helm-repo
helm pull open-telemetry/opentelemetry-collector -d ~/local-helm-repo
helm pull prometheus-msteams/prometheus-msteams -d ~/local-helm-repo
helm pull jaegertracing/jaeger  -d ~/local-helm-repo
helm pull bitnami/nginx -d ~/local-helm-repo
helm pull ingress-nginx/ingress-nginx -d ~/local-helm-repo
helm pull confluentinc/confluent-for-kubernetes -d ~/local-helm-repo
helm repo index ~/local-helm-repo --url http://<ip address>:8080/
cd ~/local-helm-repo
python3 -m http.server 8080 &