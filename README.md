# Fission Action 🚀

Fission action uses a genric container to build a Github action based workflow for deploying Fission functions to a Kubernetes cluster.

This generic container in future will be extended to be used in other CI/CD tools.

## How to use

This repo has a simple Nodejs function defined with Fission specs. The action in the workflow simply applies the spec on a push event. The action needs three secrets and overall workflow is defined below:

```
workflow "Fission CD" {
  on = "push"
  resolves = ["FissionCD"]
}

action "FissionCD" {
  uses = "docker://vishalbiyani/fission-action:7"
  secrets = ["CERTIFICATE_AUTHORITY", "SERVER_ADDRESS", "USER_TOKEN"]
}
```


## Testing Locally

You can test actions locally with [Act](https://github.com/nektos/act) but this action can not be tested due to [thus issue](https://github.com/nektos/act/issues/53)