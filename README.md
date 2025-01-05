# Concourse metadata-resource
Simple concourse resource which saves build metadata to a file which may be used by tasks.

## Usage Example
The pipeline below shows how to use this resource to print the bulid metadata from within a task (by default the metadata environment variables are only made available to resources during gets and puts).
```
resource_types:
  - name: build-env
    type: registry-image
    source:
      repository: ghcr.io/ardavanhashemzadeh/metadata-resource
      tag: main

resources:
  - name: build-env
    type: build-env

jobs:
  - name: testing
    plan:
      - get: build-env
      - task: fail
        config:
          inputs:
            - name: build-env
          platform: linux
          image_resource:
            type: docker-image
            source:
              repository: busybox
          run:
            path: sh
            args:
              - -exc
              - |
                tail +1 build-env/*
```
