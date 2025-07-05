# 02 - Estudo: Services - Expondo Aplicações

Este estudo demonstra como usar um objeto `Service` para expor uma aplicação que está rodando em Pods gerenciados por um `Deployment`.

### Objetivo

- Entender o papel de um `Service` como um ponto de acesso estável e balanceador de carga para Pods.
- Aprender a usar o tipo `NodePort` para acessar uma aplicação de fora do cluster em um ambiente de desenvolvimento local (Kind).
- Compreender a ligação crucial entre o `selector` de um Service e os `labels` dos Pods.

---

### Passos para Execução e Verificação

1.  **Inicie o cluster Kind**, caso ele não esteja rodando:
    ```bash
    kind create cluster
    ```

2.  **Aplique o `Deployment`** do laboratório anterior para ter a aplicação rodando. O Kubernetes buscará o arquivo na pasta vizinha:
    ```bash
    kubectl apply -f ../01-deployment-lifecycle/deployment.yaml
    ```

3.  **Aplique o `Service`** que acabamos de criar para expor a aplicação:
    ```bash
    kubectl apply -f service.yaml
    ```

4.  **Verifique o Service** para confirmar sua criação e ver a porta alocada:
    ```bash
    kubectl get service meu-app-nginx-service
    ```
    A saída esperada será algo como:
    ```
    NAME                    TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
    meu-app-nginx-service   NodePort   10.96.146.121   <none>        80:30007/TCP   15s
    ```
    A parte `80:30007/TCP` confirma que a porta 80 do serviço está mapeada para a porta `30007` do nó.

5.  **Acesse a Aplicação**: Abra seu navegador e acesse o endereço do nó (`localhost` no Kind) na porta `NodePort`:
    **http://localhost:30007**

    Você deverá ver a página de boas-vindas do NGINX, confirmando que o serviço está funcionando e roteando o tráfego corretamente para os Pods. 🎉

<p align="center"><img src="./welcometongnix.png" width="600"/></p>

---

### Limpeza do Ambiente

Ao final do estudo, remova os recursos criados para manter o cluster limpo:

```bash
kubectl delete -f service.yaml
kubectl delete -f ../01-deployment-lifecycle/deployment.yaml
```

