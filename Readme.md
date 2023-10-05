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

