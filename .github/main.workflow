workflow "Fission CD" {
  on = "push"
  resolves = [
    "FissionCD",
#    "Push image to Registry",
  ]
}

#action "Docker Registry Login" {
#  uses = "actions/docker/login@master"
#  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
#}

#action "Build Docker Image" {
#  uses = "docker://docker:stable"
#  needs = ["Docker Registry Login"]
#  args = ["build", "-t", "vishalbiyani/fission-action", "."]
#}

#action "Push image to Registry" {
#  uses = "docker://docker:stable"
#  needs = ["Build Docker Image"]
#  args = "push vishalbiyani/fission-action"
#}

action "FissionCD" {
  uses = "docker://vishalbiyani/fission-action:7"
#  needs = ["Push image to Registry"]
  secrets = ["CERTIFICATE_AUTHORITY", "SERVER_ADDRESS", "USER_TOKEN"]
}
