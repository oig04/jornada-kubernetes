# 00 - Preparação do Ambiente de Desenvolvimento Kubernetes

Este documento detalha os passos necessários para configurar um ambiente de desenvolvimento Kubernetes completo e funcional em uma máquina local.

O objetivo é ter um laboratório que seja rápido, leve e que espelhe de forma fiel os conceitos de um cluster real.

---

### **Pré-requisitos de Ferramentas**

Para seguir este guia, você precisará instalar as seguintes ferramentas de linha de comando:

1.  **Docker Engine**: Para criar e gerenciar contêineres. O Kind utilizará o Docker para simular os nós do cluster.
2.  **kubectl**: A ferramenta oficial para interagir com a API do Kubernetes e gerenciar os recursos do cluster.
3.  **Kind**: A ferramenta que criará o cluster Kubernetes localmente, usando contêineres Docker.

---

### **Passo 1: Instalação do Docker Engine**

O Docker é a fundação do nosso ambiente.

* **Windows e macOS**: A forma mais recomendada é instalar o **[Docker Desktop](https://www.docker.com/products/docker-desktop/)**.
* **Linux**: Siga as instruções oficiais de instalação para a sua distribuição no **[Docker Docs](https://docs.docker.com/engine/install/)**.

**Verificação:**
Para confirmar que o Docker foi instalado corretamente, abra seu terminal e execute:
```bash
docker run hello-world
```
Você deve ver uma mensagem de boas-vindas do Docker.

---

### **Passo 2: Instalação do `kubectl`**

`kubectl` é a nossa interface de comunicação com o cluster.

* Siga as instruções de instalação para o seu sistema operacional na **[documentação oficial do Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl/)**.

**Verificação:**
```bash
kubectl version --client
```
Este comando deve retornar a versão do cliente `kubectl` instalada.

---

### **Passo 3: Instalação do Kind**

Kind vai usar o Docker para criar nosso cluster.

* Siga as instruções de instalação para o seu sistema operacional na **[documentação oficial do Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)**.

**Verificação:**
```bash
kind --version
```

---

### **Passo 4: Criação e Gerenciamento do Cluster**

Com todas as ferramentas prontas, o processo é muito simples.

**Para criar o cluster:**
```bash
kind create cluster
```

**Para verificar se o cluster está no ar:**
```bash
kubectl get nodes
```
A saída deve mostrar um nó com o nome `kind-control-plane` e o status `Ready`.

**Para deletar o cluster ao final dos estudos:**
```bash
kind delete cluster
```