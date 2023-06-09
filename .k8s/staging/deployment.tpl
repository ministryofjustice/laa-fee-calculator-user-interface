apiVersion: apps/v1
kind: Deployment
metadata:
  name: laa-fee-calculator-ui
  namespace: laa-fee-calculator-ui-staging
spec:
  replicas: 1
  selector:
    matchLabels:
      app: laa-fee-calculator-ui
  template:
    metadata:
      labels:
        app: laa-fee-calculator-ui
    spec:
      containers:
      - name: laa-fee-calculator-ui-app
        image: ${ECR_URL}:${IMAGE_TAG}
        ports:
        - containerPort: 3000
