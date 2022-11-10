
#!/bin/bash
##
# Script to find a specific service monitor in the User-Defined Project monitoring configuration
##

usage() {
echo "ERROR: Please select a service monitor"
echo ""
echo "Usage: $0 <service-monitor-name>"
echo "Example:"
echo "  ./find-monitor-prometheus.sh back-springboot"
exit 1
}

[[ $# -eq 0 ]] && usage

oc get secret -n openshift-user-workload-monitoring prometheus-user-workload -ojson | jq -r '.data["prometheus.yaml.gz"]' | base64 -d | gunzip | grep $1