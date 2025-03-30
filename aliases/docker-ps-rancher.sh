#!/bin/bash

docker ps -a --format="table {{.ID}}\t{{.Names | printf \"%.15s\"}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status | printf \"%.20s\"}}\t{{.Ports}}" | grep -v k8s