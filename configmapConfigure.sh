#!/bin/bash

# Namespace to process
NAMESPACE="$1"

# Variable to replace (source string)
OLD_VALUE="$2"

# New value to replace with
NEW_VALUE="$3"

# Check if required arguments are provided
if [ -z "$NAMESPACE" ] || [ -z "$OLD_VALUE" ] || [ -z "$NEW_VALUE" ]; then
  echo "Usage: $0 <namespace> <old_value> <new_value>"
  exit 1
fi

# Export all configmaps in YAML format
kubectl get configmaps -n "$NAMESPACE" -o yaml > configmaps.yaml

# Process each configmap and replace the variable
sed -i "s/$OLD_VALUE/$NEW_VALUE/g" configmaps.yaml

# Apply the modified configmaps (dry-run by default)
kubectl apply -n "$NAMESPACE" -f configmaps.yaml --dry-run=client

# Confirmation before actual application
echo "This script will modify configmaps in namespace '$NAMESPACE'."
echo "It will replace '$OLD_VALUE' with '$NEW_VALUE' (dry-run mode currently)."
echo "Are you sure you want to proceed? (y/N)"

read -r confirmation

if [[ "$confirmation" =~ ^([Yy])$ ]]; then
  # Remove the dry-run flag to apply changes
  kubectl apply -n "$NAMESPACE" -f configmaps.yaml
  echo "Configmaps in namespace '$NAMESPACE' have been updated."
else
  echo "Aborting. No changes applied."
  # Clean up the temporary file
  rm configmaps.yaml
fi