# Laa fee calculator user interface

LAA Fee Calculator User Interface
A simple Ruby on Rails application that makes a call to the fee calculator API

## Notes regarding Cloud

To build the image on an M1 Mac, cross-compiled to run on x86/linux:

```bash
docker buildx build --platform=linux/amd64 -t fcui-amd64 .
```

To get the ECR authentication details:

```bash
cloud-platform decode-secret -n laa-fee-calculator-ui-dev -s ecr-repo-laa-fee-calculator-ui-dev
```

Tag the build:

```bash
docker tag fcui 754256621582.dkr.ecr.eu-west-2.amazonaws.com/laa-clair-taskforce/laa-fee-calculator-ui-dev-ecr:1.0
```

And push:

```bash
docker push 754256621582.dkr.ecr.eu-west-2.amazonaws.com/laa-clair-taskforce/laa-fee-calculator-ui-dev-ecr:1.0
```

Get the new image deployed by editing `.k8s/dev/deployment.yaml` to include the
new image name and then:

```bash
kubectl -n laa-fee-calculator-ui-dev apply -f .k8s/dev/deployment.yaml
```
