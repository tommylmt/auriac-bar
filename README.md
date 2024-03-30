# Festival des ruelles - Choreography on tip

Hello Yann,

Le script est là !!!

Il faudra surement le modifier un peu pour le bouton poussoir, j'ai écrit en mode local pour pouvoir tester et en mode *"production"* si on peut dire ;).

Pour le faire fonctionner c'est **easy**.
Il te suffit d'avoir installé Docker sur le Raspberry et de pull via : 

```bash
$ docker pull ghcr.io/tommylmt/auriac:latest 
```

Ensuite pour lancer : 

```bash 
docker run -e "KEY_CODE='a'" -e "DOWN_VOLUME=10%" -d ghcr.io/tommylmt/auriac
```
