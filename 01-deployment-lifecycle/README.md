# 01 - Estudo: Ciclo de Vida de um Deployment

Este estudo prático explora o objeto `Deployment`, um dos recursos mais fundamentais do Kubernetes. O objetivo é entender como ele gerencia o ciclo de vida completo de uma aplicação.

---

### **Objetivos do Estudo**

* Entender a **natureza declarativa** do Kubernetes através de um arquivo de manifesto YAML.
* Observar a criação e o gerenciamento de **Pods** por um Deployment.
* Testar a **escalabilidade horizontal** da aplicação, aumentando e diminuindo o número de réplicas.
* Executar uma **atualização de versão sem downtime** (Rolling Update).

---

### **Cenário Proposto**

Vamos implantar um servidor web NGINX e gerenciá-lo através dos seguintes passos:

1.  **Criação**: Implantar a versão `1.27.0` com 2 réplicas.
2.  **Escalabilidade**: Aumentar a capacidade para 5 réplicas.
3.  **Atualização**: Atualizar a imagem para a versão `1.28.0` de forma segura.
4.  **Limpeza**: Remover todos os recursos criados.

---

### **Arquivo de Manifesto (`deployment.yaml`)**

```yaml
# deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: meu-app-nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: meu-app
  template:
    metadata:
      labels:
        app: meu-app
    spec:
      containers:
      - name: nginx-container
        image: nginx:1.27.0
        ports:
        - containerPort: 80
```

---

### **Execução Prática**

#### **Passo 1: Criação Inicial**
```bash
kubectl apply -f deployment.yaml
```
*Para verificar os Pods criados: `kubectl get pods`*

#### **Passo 2: Escalando a Aplicação**
Para escalar de 2 para 5 réplicas:
```bash
kubectl scale deployment meu-app-nginx --replicas=5
```
*Verifique novamente com `kubectl get pods` e você verá 5 Pods rodando.*

#### **Passo 3: Atualizando a Aplicação (Rolling Update)**
1.  Altere o arquivo `deployment.yaml`, mudando a linha `image: nginx:1.27.0` para `image: nginx:1.28.0`.
2.  Aplique a mudança:
```bash
kubectl apply -f deployment.yaml
```
*Para observar a atualização em tempo real, execute em outro terminal: `kubectl get pods -w`*

#### **Passo 4: Limpeza do Ambiente**
Para remover o Deployment e todos os Pods associados:
```bash
kubectl delete -f deployment.yaml
```