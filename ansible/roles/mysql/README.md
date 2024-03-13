# Nombre del Rol

Una breve descripción del rol va aquí.

## Requisitos

Cualquier pre-requisito que posiblemente no esté cubierto por Ansible en sí o por el rol debe mencionarse aquí. Por ejemplo, si el rol utiliza el módulo EC2, puede ser buena idea mencionar en esta sección que se requiere el paquete boto.

## Variables del Rol

Aquí debería ir una descripción de las variables que se pueden configurar para este rol, incluyendo cualquier variable que esté en defaults/main.yml, vars/main.yml, y cualquier variable que pueda/deba establecerse a través de parámetros para el rol. También deberían mencionarse aquí cualquier variable que se lea desde otros roles y/o el alcance global (es decir, hostvars, group vars, etc.).

## Dependencias

Debería ir una lista de otros roles alojados en Galaxy, además de cualquier detalle con respecto a los parámetros que puedan necesitar establecerse para otros roles, o variables que se utilicen desde otros roles.

## Ejemplo de Playbook

Incluir un ejemplo de cómo usar tu rol (por ejemplo, con variables pasadas como parámetros) siempre es útil para los usuarios también:

```yaml
- hosts: servidores
  roles:
     - { role: username.rolename, x: 42 }
```

## Licencia

BSD

## Author Information

Una sección opcional para que los autores del rol incluyan información de contacto o un sitio web (no se permite HTML).
