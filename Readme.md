- Adding sub-chart:
  - Create a `requirements.yml` inside the main folder of the Django helm chart and add the dependencies:
  - Run `helm dep up` in that folder

  - enable it (postgres) in the main values.yaml file by :

  ```
  postgresql: 
  enabled: true
  ```

  - Add DB env variables in `helpers.tpl` :
    

  - Inject the variables above into the deployment using `deployment.yaml` :
    Add key `env` just under `command`:

    ```
    env:
          {{- include "django-demo.db.env" . | nindent 10 }}
    ```


  > TIP: Always dry-run to check for syntax errors

# Deploying the charts:
- Create namespaces
- Move to directory containing namespaces
- Run:  `kubectl create namespace tenant1`
        `helm install tenant1-django-app ./django-demo --namespace tenant1 -f ./tenant1-values.yaml`
                                       &
        `helm install tenant1-postgres-db ./postgres-db --namespace tenant1 -f ./tenant1-values.yaml`

                > for tenant 1 : and the  `-f ./tenant1-values.yaml` is optional


# Add migrations using init-container


## Common error:
*FATAL:  password authentication failed for user "postgres"*
- When you run helm uninstall ... it errs on the side of caution and doesn't delete the storage associated with the database you got when you first ran helm install ....

This means that once you've installed Postgres once via Helm, the secrets will always be the same in subsequent installs, regardless of what the post-installation blurb tells you.

To fix this, you have to manually remove the persistent volume claim (PVC) which will free up the database storage.

```

```