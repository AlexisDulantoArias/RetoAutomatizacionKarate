# Reto de Automatización QA - Backend

Crear una suite de pruebas automatizadas para la API de Usuarios de ServeRest (https://serverest.dev/) utilizando Karate DSL.

## Instrucciones de configuración y ejecución

Tener instalado Maven y Java jdk, de preferencia jdk 17 para este proyecto.

Clonar el proyecto 💻

```bash
  git clone https://github.com/AlexisDulantoArias/RetoAutomatizacionKarate
```
## Ejecutar prueba

Para ejecutar la prueba completa, ejecutar el TestRunner ubicado en src/test/java/karate/runner/TestRunner o ejecutar el siguiente comando 🏃‍♂️

```bash
  mvn test
```

### Ejecutar el feature de listar usuarios

Ejecutar el feature completo de listar usuarios

```bash
  mvn test -Dkarate.options="--tags @allListUsers"
```

Ejecutar el escenario de listar usuarios
```bash
  mvn test -Dkarate.options="--tags @listRegisteredUsers"
```

### Ejecutar el feature de registrar usuario

Ejecutar el feature completo de registrar usuario

```bash
  mvn test -Dkarate.options="--tags @allRegisterUser"
```

Ejecutar el escenario de registrar usuario correctamente

```bash
  mvn test -Dkarate.options="--tags @registerUser"
```

Ejecutar el escenario de registrar usuario con correo ya registrado

```bash
  mvn test -Dkarate.options="--tags @registerUserError"
```

Ejecutar el escenario de registrar usuario con campo nombre vacio

```bash
  mvn test -Dkarate.options="--tags @registerUserWithoutName"
```

Ejecutar el escenario de registrar usuario con campo email vacio

```bash
  mvn test -Dkarate.options="--tags @registerUserWithoutEmail"
```

Ejecutar el escenario de registrar usuario con campo password vacio

```bash
  mvn test -Dkarate.options="--tags @registerUserWithoutPassword"
```

Ejecutar el escenario de registrar usuario con campo administrador vacio

```bash
  mvn test -Dkarate.options="--tags @registerUserWithoutAdmin"
```

### Ejecutar el feature de buscar usuarios por ID

Ejecutar el feature completo de buscar usuarios por ID

```bash
  mvn test -Dkarate.options="--tags @allFindUsersById"
```

Ejecutar el escenario de buscar usuario por ID

```bash
  mvn test -Dkarate.options="--tags @findUserById"
```

Ejecutar el escenario de buscar usuario con ID no existente

```bash
  mvn test -Dkarate.options="--tags @findUserWithNotExistentId"
```

Ejecutar el escenario de buscar usuario con ID con longitud incorrecta

```bash
  mvn test -Dkarate.options="--tags @findUserWithWrongLongId"
```

### Ejecutar el feature de actualizar usuario

Ejecutar el feature completo de actualizar usuario

```bash
  mvn test -Dkarate.options="--tags @allEditUser"
```

Ejecutar el escenario de actualizar usuario

```bash
  mvn test -Dkarate.options="--tags @editUser"
```

Ejecutar el escenario de actualizar usuario con ID no existente

```bash
  mvn test -Dkarate.options="--tags @editUserWithoutId"
```

Ejecutar el escenario de actualizar usuario con email ya registrado

```bash
  mvn test -Dkarate.options="--tags @editUserWithRegisteredEmail"
```

### Ejecutar el feature de eliminar usuario

Ejecutar el feature completo de eliminar usuario

```bash
  mvn test -Dkarate.options="--tags @allDeleteUser"
```

Ejecutar el escenario de eliminar usuario

```bash
  mvn test -Dkarate.options="--tags @deleteUser"
```
## FAQ

#### ¿Cómo puedo ver el reporte generado por KarateDSL al ejecutar cualquier comando de prueba?

Al ejecutar cualquier comando, el enlace al reporte no se adjunta automáticamente. Para acceder a él, debes revisar el archivo que se generará automáticamente en la carpeta "target/karate-reports/*.html".
>>>>>>> 24b88c4 (Subida al repositorio automatización de Karate DSL)
