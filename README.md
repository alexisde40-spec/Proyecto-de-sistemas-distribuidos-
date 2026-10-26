# Proyecto-de-sistemas-distribuidos-
<body>
<!--StartFragment--><html><head></head><body><h1>Sistema Distribuido de Alta Disponibilidad y Resiliencia</h1>
<h2>1. Introducción</h2>
<p>En este proyecto se trabajó con una arquitectura de sistema distribuido de tres capas, con el objetivo de ejecutar el proyecto proporcionado por el profesor y realizar diferentes mejoras para aumentar su disponibilidad, tolerancia a fallos y capacidad de recuperación.</p>
<p>El trabajo se realizó tomando como referencia el archivo <code>ToDo.md</code>, donde se encuentran las actividades y mejoras que deben implementarse en los diferentes componentes de la arquitectura.</p>
<p>Los principales componentes trabajados fueron:</p>
<ul>
<li><strong>MongoDB:</strong> punto 2.1 del <code>ToDo.md</code>.</li>
<li><strong>Redis:</strong> puntos 2.2 y 2.3 del <code>ToDo.md</code>.</li>
<li><strong>GaleraDB:</strong> todo el punto 3 del <code>ToDo.md</code>.</li>
</ul>
<p>Además de realizar las modificaciones de configuración, se prepararon diferentes pruebas para comprobar el comportamiento del sistema cuando alguno de sus nodos deja de estar disponible.</p>
<p>La documentación está organizada de la siguiente manera:</p>
<ol>
<li>Herramientas utilizadas.</li>
<li>Preparación del entorno.</li>
<li>Ejecución inicial del proyecto.</li>
<li>Revisión del archivo <code>ToDo.md</code>.</li>
<li>Mejoras realizadas en MongoDB.</li>
<li>Mejoras realizadas en Redis.</li>
<li>Persistencia de Redis.</li>
<li>Mejoras realizadas en GaleraDB.</li>
<li>Implementación de ProxySQL.</li>
<li>Configuración de lectura y escritura.</li>
<li>Configuración del pool de conexiones.</li>
<li>Ejecución de la arquitectura modificada.</li>
<li>Diagrama de la arquitectura.</li>
<li>Pruebas de tolerancia a fallos.</li>
<li>Resultados de las pruebas.</li>
<li>Conclusión.</li>
</ol>
<hr>
<h1>2. Herramientas utilizadas</h1>
<p>Para desarrollar, modificar, ejecutar y probar el proyecto se utilizaron diferentes herramientas. Cada una cumplió una función específica durante el desarrollo.</p>
<h2>2.1 Docker Desktop</h2>
<p>Para ejecutar el sistema distribuido se utilizó <strong>Docker Desktop</strong>, ya que permite crear, iniciar, detener y administrar los diferentes contenedores que forman parte de la arquitectura.</p>
<p>Docker fue una de las herramientas principales del proyecto debido a que los diferentes servicios de la aplicación se ejecutan mediante contenedores.</p>
<p>Durante el desarrollo se utilizó Docker Desktop para:</p>
<ul>
<li>Ejecutar los servicios del sistema.</li>
<li>Comprobar el estado de los contenedores.</li>
<li>Iniciar y detener servicios.</li>
<li>Revisar los logs de los contenedores.</li>
<li>Comprobar que los diferentes componentes estuvieran funcionando.</li>
<li>Simular la caída de determinados nodos durante las pruebas.</li>
</ul>
<p>También permitió observar de forma visual los contenedores que forman parte de la infraestructura y comprobar cuáles se encontraban activos.</p>
<hr>
<h2>2.2 Visual Studio Code</h2>
<p>Se utilizó <strong>Visual Studio Code</strong> como editor principal para revisar la estructura del proyecto, analizar los archivos de configuración y realizar las modificaciones necesarias.</p>
<p>Desde Visual Studio Code se trabajó directamente con los archivos relacionados con Docker, MongoDB, Redis, GaleraDB, balanceadores y la aplicación.</p>
<p>Entre las principales carpetas del proyecto se encuentran:</p>
<pre><code class="language-text">application/
database/
haproxy/
keepalived/
mongo/
redis/
nagios/
resilience-lab/
web/
</code></pre>
<p>También se revisaron archivos importantes como:</p>
<pre><code class="language-text">docker-compose.yml
ToDo.md
</code></pre>
<p>Visual Studio Code permitió tener una visión general de cómo estaba organizado el proyecto y facilitó la modificación de los diferentes archivos de configuración.</p>
<hr>
<h2>2.3 Terminal y PowerShell</h2>
<p>La terminal se utilizó para ejecutar los diferentes comandos necesarios durante el desarrollo y las pruebas.</p>
<p>Desde la terminal se realizaron tareas como:</p>
<ul>
<li>Clonar el repositorio.</li>
<li>Acceder a la carpeta del proyecto.</li>
<li>Abrir el proyecto en Visual Studio Code.</li>
<li>Levantar los contenedores.</li>
<li>Revisar el estado de los servicios.</li>
<li>Detener contenedores.</li>
<li>Consultar información de los servicios.</li>
<li>Realizar pruebas de funcionamiento.</li>
<li>Simular la caída de diferentes nodos.</li>
</ul>
<h3>Clonar el repositorio</h3>
<p>El proyecto se obtuvo mediante Git utilizando:</p>
<pre><code class="language-bash">git clone https://github.com/tuxtter/distributedsystems.git
</code></pre>
<p>Después se ingresó a la carpeta del proyecto:</p>
<pre><code class="language-bash">cd distributedsystems
</code></pre>
<h3>Abrir el proyecto en Visual Studio Code</h3>
<p>Para abrir directamente la carpeta del proyecto:</p>
<pre><code class="language-bash">code .
</code></pre>
<h3>Comprobar los contenedores</h3>
<p>Para revisar los contenedores que se encuentran ejecutándose:</p>
<pre><code class="language-bash">docker ps --format "table {{.Names}}\t{{.Status}}"
</code></pre>
<h3>Detener un contenedor</h3>
<p>Durante las pruebas se utilizó:</p>
<pre><code class="language-bash">docker stop NOMBRE_DEL_CONTENEDOR
</code></pre>
<p>Este comando permitió detener determinados servicios de forma controlada para comprobar cómo responde el sistema ante la pérdida de un nodo.</p>
<hr>
<h2>2.4 Git y GitHub</h2>
<p>Se utilizó <strong>Git</strong> para clonar y administrar el código del proyecto, mientras que <strong>GitHub</strong> se utilizó como plataforma para almacenar el repositorio y documentar el trabajo realizado.</p>
<p>El repositorio base utilizado fue:</p>
<pre><code class="language-text">https://github.com/tuxtter/distributedsystems
</code></pre>
<p>Git también permite mantener un registro de los cambios realizados durante el desarrollo del proyecto.</p>
<hr>
<h2>2.5 Archivos de configuración y documentación</h2>
<p>Durante la revisión del proyecto se utilizaron los archivos de configuración y documentación incluidos en el repositorio.</p>
<p>Uno de los archivos más importantes fue:</p>
<pre><code class="language-text">ToDo.md
</code></pre>
<p>Este archivo contiene los puntos que debían atenderse para mejorar la arquitectura.</p>
<p>También se revisaron diferentes carpetas y archivos relacionados con los servicios de la infraestructura.</p>

Carpeta o archivo | Función dentro del proyecto
-- | --
application/ | Código de la API desarrollada en Node.js y sus archivos de configuración.
database/ | Scripts SQL relacionados con la base de datos.
haproxy/ | Configuración de los balanceadores y del enrutamiento de conexiones.
keepalived/ | Configuración relacionada con la alta disponibilidad de los balanceadores.
nagios/ | Archivos de configuración para el monitoreo de los servicios.
resilience-lab/ | Material y herramientas para las pruebas de carga y resiliencia.
web/ | Archivos del frontend y configuración de Nginx.
mongo/ | Configuraciones y scripts relacionados con MongoDB.
redis/ | Configuraciones relacionadas con Redis y Sentinel.
ToDo.md | Lista de tareas y mejoras solicitadas para la arquitectura.
docker-compose.yml | Definición de servicios y configuración de la infraestructura original.
docker-compose.yml | Archivo Compose utilizado para las modificaciones realizadas durante el proyecto.


<hr>
<h1>3. Preparación del entorno</h1>
<p>Antes de comenzar con las modificaciones se preparó el entorno de trabajo.</p>
<p>El primer paso fue obtener el repositorio proporcionado por el profesor mediante Git:</p>
<pre><code class="language-bash">git clone https://github.com/tuxtter/distributedsystems.git
</code></pre>
<p>Después se ingresó al directorio:</p>
<pre><code class="language-bash">cd distributedsystems
</code></pre>
<p>Una vez dentro del proyecto, se abrió en Visual Studio Code:</p>
<pre><code class="language-bash">code .
</code></pre>
<p>Desde Visual Studio Code se revisó la estructura de carpetas y archivos para identificar los diferentes componentes de la arquitectura.</p>
<p>También se inició Docker Desktop para poder ejecutar los contenedores y observar su estado durante el desarrollo.</p>
<hr>
<h1>4. Ejecución inicial del proyecto</h1>
<p>Antes de realizar modificaciones, primero se ejecutó el proyecto original para comprobar su funcionamiento y conocer cómo estaba organizada la arquitectura.</p>
<p>La intención de esta primera ejecución fue verificar que los servicios proporcionados por el profesor funcionaran correctamente antes de comenzar a realizar cambios.</p>
<p>Para levantar los servicios se utilizó Docker Compose:</p>
<pre><code class="language-bash">docker compose up -d
</code></pre>
<p>Después se comprobó el estado de los contenedores:</p>
<pre><code class="language-bash">docker ps --format "table {{.Names}}\t{{.Status}}"
</code></pre>
<p>También se utilizó Docker Desktop para comprobar visualmente los contenedores que estaban activos.</p>
<p>Esta primera ejecución permitió identificar los diferentes componentes del sistema y comprender la relación entre las capas de la arquitectura.</p>
<hr>
<h1>5. Revisión del archivo <code>ToDo.md</code></h1>
<p>Después de comprobar el funcionamiento inicial del proyecto, se revisó el archivo <code>ToDo.md</code>.</p>
<p>Este archivo contiene los puntos que debían implementarse para mejorar la arquitectura.</p>
<p>Los principales cambios solicitados fueron:</p>
<h3>MongoDB</h3>
<ul>
<li>Punto <strong>2.1</strong>.</li>
</ul>
<h3>Redis</h3>
<ul>
<li>Punto <strong>2.2</strong>.</li>
<li>Punto <strong>2.3</strong>.</li>
</ul>
<h3>GaleraDB</h3>
<ul>
<li>Todo el <strong>punto 3</strong>.</li>
</ul>
<p>A partir de estos requisitos se realizaron las modificaciones necesarias en los archivos de configuración y en <code>docker-compose.yml</code>.</p>
<hr>
<h1>6. Mejoras realizadas en MongoDB</h1>
<h2>6.1 Objetivo</h2>
<p>El objetivo del punto <strong>2.1</strong> fue mejorar la disponibilidad de MongoDB y evitar que una sola instancia se convierta en un punto único de fallo.</p>
<p>Para esto se implementó un <strong>Replica Set de MongoDB compuesto por tres nodos</strong>.</p>
<p>Los nodos utilizados fueron:</p>
<pre><code class="language-text">mongodb1
mongodb2
mongodb3
</code></pre>
<p>El Replica Set fue denominado:</p>
<pre><code class="language-text">rs0
</code></pre>
<hr>
<h2>6.2 Configuración del Replica Set</h2>
<p>La arquitectura de MongoDB quedó organizada de la siguiente manera:</p>
<pre><code class="language-text">                MongoDB Replica Set
                       rs0
                        |
        +---------------+---------------+
        |               |               |
        v               v               v
    mongodb1        mongodb2        mongodb3
     Primary        Secondary       Secondary
</code></pre>
<p>El nodo que actúa como <code>Primary</code> puede cambiar dependiendo del estado del Replica Set.</p>
<p>Los otros nodos mantienen una copia de los datos y participan en el funcionamiento del conjunto.</p>
<hr>
<h2>6.3 Archivo de autenticación</h2>
<p>Para permitir la comunicación segura entre los miembros del Replica Set se creó:</p>
<pre><code class="language-text">mongo/keyfile
</code></pre>
<p>Este archivo se utiliza como mecanismo de autenticación entre los nodos de MongoDB.</p>
<p>También se establecieron permisos restringidos sobre el archivo.</p>
<hr>
<h2>6.4 Script de inicialización</h2>
<p>Para automatizar la creación del Replica Set se creó:</p>
<pre><code class="language-text">mongo/rs-init.sh
</code></pre>
<p>Este script permite inicializar el Replica Set <code>rs0</code> y registrar los diferentes miembros:</p>
<pre><code class="language-text">mongodb1
mongodb2
mongodb3
</code></pre>
<p>Esto evita tener que realizar manualmente toda la configuración cada vez que se inicia la infraestructura.</p>
<hr>
<h2>6.5 Configuración en Docker Compose</h2>
<p>Los tres nodos de MongoDB fueron configurados dentro de:</p>
<pre><code class="language-text">docker-compose.yml
</code></pre>
<p>La estructura utilizada es:</p>
<pre><code class="language-text">MongoDB
│
├── mongodb1
├── mongodb2
└── mongodb3
</code></pre>
<p>De esta manera Docker puede iniciar los tres nodos dentro de la misma infraestructura.</p>
<hr>
<h2>6.6 Modificación de la conexión de la aplicación</h2>
<p>También fue necesario modificar la conexión utilizada por la aplicación para que no dependiera exclusivamente de un único servidor MongoDB.</p>
<p>La conexión utiliza varios nodos:</p>
<pre><code class="language-text">mongodb://mongodb1:27017,mongodb2:27017,mongodb3:27017/db
</code></pre>
<p>Esta configuración se realizó en los archivos relacionados con la aplicación:</p>
<pre><code class="language-text">application/index.js
application/.env
</code></pre>
<p>Al proporcionar varios servidores, el cliente de MongoDB puede conocer los diferentes miembros del Replica Set y determinar cuál es el nodo primario disponible.</p>
<hr>
<h1>7. Mejoras realizadas en Redis</h1>
<h2>7.1 Redis — Punto 2.2</h2>
<p>El objetivo del punto <strong>2.2</strong> fue mejorar la disponibilidad de Redis mediante replicación y mecanismos de supervisión.</p>
<p>Se configuró una instancia principal:</p>
<pre><code class="language-text">redis-master
</code></pre>
<p>y una réplica:</p>
<pre><code class="language-text">redis-replica
</code></pre>
<p>La arquitectura queda de forma simplificada:</p>
<pre><code class="language-text">                 Redis
                   |
             redis-master
                   |
                   v
             redis-replica
</code></pre>
<p>La réplica mantiene información del nodo principal y permite disponer de otro nodo en caso de que el principal deje de estar disponible.</p>
<hr>
<h2>7.2 Configuración de Redis</h2>
<p>La configuración principal se realizó mediante:</p>
<pre><code class="language-text">redis/redis.conf
</code></pre>
<p>En este archivo se establecieron los parámetros necesarios para la comunicación entre el nodo principal y su réplica.</p>
<hr>
<h2>7.3 Redis Sentinel</h2>
<p>También se configuraron tres instancias de Redis Sentinel:</p>
<pre><code class="language-text">redis-sentinel-1
redis-sentinel-2
redis-sentinel-3
</code></pre>
<p>Los archivos utilizados fueron:</p>
<pre><code class="language-text">redis/sentinel-1.conf
redis/sentinel-2.conf
redis/sentinel-3.conf
</code></pre>
<p>Los Sentinel supervisan el estado del nodo principal y trabajan mediante un mecanismo de quórum.</p>
<p>La arquitectura puede representarse de forma simplificada:</p>
<pre><code class="language-text">             Redis Sentinel
          /        |        \
         v         v         v
    Sentinel 1 Sentinel 2 Sentinel 3
          \        |        /
           \       |       /
            +------v------+
               redis-master
                    |
                    v
              redis-replica
</code></pre>
<p>Si los Sentinel determinan que el nodo principal ha fallado, pueden iniciar el proceso de failover y promover la réplica.</p>
<hr>
<h1>8. Persistencia de Redis — Punto 2.3</h1>
<p>Además de la replicación y Sentinel, se configuraron mecanismos de persistencia para reducir el riesgo de pérdida de información.</p>
<p>Los mecanismos utilizados fueron:</p>
<ul>
<li><strong>AOF — Append Only File</strong></li>
<li><strong>RDB — Redis Database Snapshots</strong></li>
</ul>
<hr>
<h2>8.1 AOF</h2>
<p>Se habilitó el mecanismo <strong>AOF</strong> en:</p>
<pre><code class="language-text">redis/redis.conf
</code></pre>
<p>AOF permite registrar las operaciones realizadas sobre Redis en un archivo.</p>
<p>Esto proporciona un mecanismo de recuperación de información después de un reinicio o fallo del servicio.</p>
<hr>
<h2>8.2 RDB</h2>
<p>También se habilitó el mecanismo <strong>RDB</strong>, que permite crear snapshots periódicos del estado de Redis.</p>
<p>De forma simplificada:</p>
<pre><code class="language-text">Redis
  |
  +----&gt; AOF
  |
  +----&gt; RDB
</code></pre>
<p>La combinación de AOF y RDB proporciona diferentes mecanismos para recuperar los datos después de un reinicio.</p></body></html><!--EndFragment-->
</body>
</html>
<html>
<body>
<!--StartFragment--><html><head></head><body><h1>9. Mejoras realizadas en GaleraDB — Punto 3</h1>
<h2>9.1 Objetivo</h2>
<p>El punto 3 del <code>ToDo.md</code> está enfocado en mejorar la arquitectura de GaleraDB y evitar que la aplicación dependa directamente de un único nodo.</p>
<p>El clúster está compuesto por:</p>
<pre><code class="language-text">galera1
galera2
galera3
</code></pre>
<p>La estructura general es:</p>
<pre><code class="language-text">              GaleraDB Cluster
                     |
        +------------+------------+
        |            |            |
        v            v            v
     galera1      galera2      galera3
</code></pre>
<hr>
<h1>10. ProxySQL</h1>
<h2>10.1 ProxySQL como intermediario</h2>
<p>Una de las principales mejoras realizadas fue incorporar <strong>ProxySQL</strong> entre la aplicación y GaleraDB.</p>
<p>La arquitectura pasó a tener la siguiente estructura:</p>
<pre><code class="language-text">             Aplicación Node.js
                     |
                     v
                 ProxySQL
                     |
          +----------+----------+
          |          |          |
          v          v          v
       galera1    galera2    galera3
</code></pre>
<p>ProxySQL funciona como intermediario y administra las conexiones hacia los diferentes nodos de GaleraDB.</p>
<hr>
<h2>10.2 Puertos utilizados</h2>
<p>ProxySQL utiliza principalmente:</p>
<pre><code class="language-text">6033 -&gt; conexiones de las aplicaciones
6032 -&gt; administración de ProxySQL
</code></pre>
<p>La aplicación utiliza ProxySQL como punto de conexión en lugar de depender directamente de un nodo específico.</p>
<hr>
<h1>11. Read/Write Split</h1>
<p>Otra de las mejoras realizadas fue configurar reglas para separar las operaciones de lectura y escritura.</p>
<p>Las operaciones de lectura incluyen principalmente:</p>
<pre><code class="language-sql">SELECT
</code></pre>
<p>Mientras que las operaciones de escritura incluyen:</p>
<pre><code class="language-sql">INSERT
UPDATE
DELETE
</code></pre>
<p>Las reglas se configuraron en:</p>
<pre><code class="language-text">proxysql/proxysql.cnf
</code></pre>
<p>La idea general es:</p>
<pre><code class="language-text">                  Aplicación
                       |
                       v
                   ProxySQL
                  /       \
                 /         \
                v           v
           Escrituras     Lecturas
                |             |
                v             v
          Hostgroup       Hostgroup
           primario       secundario
</code></pre>
<p>De esta manera ProxySQL puede distribuir las consultas según el tipo de operación.</p>
<hr>
<h1>12. Pool de conexiones</h1>
<p>También se realizaron modificaciones relacionadas con la cantidad de conexiones utilizadas por la aplicación.</p>
<p>En:</p>
<pre><code class="language-text">application/index.js
</code></pre>
<p>se estableció:</p>
<pre><code class="language-javascript">connectionLimit: 20
</code></pre>
<p>Este parámetro permite limitar el número de conexiones disponibles para cada instancia de la aplicación.</p>
<p>También se ajustó la configuración de conexiones en ProxySQL para evitar una cantidad excesiva de conexiones durante momentos de alta demanda.</p>
<p>El objetivo es mantener controlado el consumo de recursos y evitar una saturación de las conexiones disponibles.</p>
<hr>
<h1>13. Resumen de las mejoras realizadas</h1>
<p>Después de realizar las modificaciones, la arquitectura cuenta con diferentes mecanismos destinados a mejorar la disponibilidad y tolerancia a fallos.</p>

Componente | Mejora | Objetivo
-- | -- | --
MongoDB | Replica Set de 3 nodos | Evitar depender de un único nodo
MongoDB | keyfile | Autenticación entre miembros
MongoDB | rs-init.sh | Automatizar la inicialización
MongoDB | Conexión multi-seed | Conocer varios nodos
Redis | Réplica | Mantener una copia de los datos
Redis | Redis Sentinel | Supervisar el servicio
Redis | Failover | Promover una réplica
Redis | AOF | Persistencia de operaciones
Redis | RDB | Snapshots periódicos
GaleraDB | 3 nodos | Mantener un clúster
GaleraDB | ProxySQL | Administrar conexiones
GaleraDB | Read/Write Split | Distribuir las consultas
GaleraDB | Pool de conexiones | Controlar las conexiones


<hr>
<h1>14. Ejecución de la arquitectura modificada</h1>
<p>Después de realizar las modificaciones, se utilizó:</p>
<pre><code class="language-text">docker-compose.yml
</code></pre>
<p>para levantar la arquitectura modificada.</p>
<p>El comando utilizado fue:</p>
<pre><code class="language-bash">docker compose -f docker-compose.yml up -d
</code></pre>
<p>Después se comprobó el estado de los contenedores:</p>
<pre><code class="language-bash">docker ps --format "table {{.Names}}\t{{.Status}}"
</code></pre>
<p>También se utilizó Docker Desktop para revisar visualmente los servicios que estaban ejecutándose.</p>
<p>Antes de realizar las pruebas de tolerancia a fallos se verificó que los diferentes servicios estuvieran disponibles.</p>
<hr>
<h1>15. Verificación de los servicios</h1>
<p>Una vez levantada la arquitectura modificada, se revisaron los contenedores para confirmar que los diferentes componentes estuvieran funcionando.</p>
<p>Se utilizó:</p>
<pre><code class="language-bash">docker ps
</code></pre>
<p>También se revisó el estado mediante Docker Desktop.</p>
<p>La finalidad de esta comprobación fue asegurarse de que la infraestructura estuviera funcionando correctamente antes de comenzar las pruebas de fallos.</p>
<hr>
<h1>16. Diagrama de la arquitectura</h1>
<p>En esta sección se colocará el diagrama final de la arquitectura realizado para el proyecto.</p>
<blockquote>
<img width="3660" height="8192" alt="Diagrama" src="https://github.com/user-attachments/assets/e29a04e9-8fa7-4799-83cb-f67e2fa8b0f3" />
</blockquote>
<p>El diagrama deberá mostrar:</p>
<ul>
<li>Capa de presentación.</li>
<li>Balanceadores.</li>
<li>Servidores web.</li>
<li>Capa de aplicación.</li>
<li>Instancias de la API.</li>
<li>MongoDB y sus tres nodos.</li>
<li>Redis.</li>
<li>Réplica de Redis.</li>
<li>Redis Sentinel.</li>
<li>ProxySQL.</li>
<li>GaleraDB.</li>
<li>Comunicación entre los diferentes componentes.</li>
</ul>
<hr>
<h1>17. Pruebas de tolerancia a fallos</h1>
<p>Después de implementar las mejoras se realizarán diferentes pruebas para comprobar si la arquitectura puede continuar funcionando cuando alguno de sus componentes deja de estar disponible.</p>
<p>Estas pruebas permitirán comprobar en la práctica si los mecanismos de replicación, failover y balanceo funcionan correctamente.</p>
<p>La idea principal de las pruebas es detener determinados nodos y comprobar si los servicios restantes son capaces de mantener la aplicación funcionando.</p>
<hr>
<h1>18. Prueba de MongoDB</h1>
<h2>18.1 Caída de un nodo</h2>
<h3>Escenario</h3>
<p>Se detendrá uno de los nodos de MongoDB:</p>
<pre><code class="language-text">mongodb1
</code></pre>
<p>El objetivo es comprobar que los otros nodos del Replica Set continúan disponibles.</p>
<p>Se verificará:</p>
<ul>
<li>Estado de <code>mongodb2</code>.</li>
<li>Estado de <code>mongodb3</code>.</li>
<li>Estado del Replica Set.</li>
<li>Respuesta de la aplicación.</li>
<li>Funcionamiento de la página web.</li>
</ul>
<h3>Comando utilizado</h3>
<pre><code class="language-bash">docker stop mongodb1
</code></pre>
<h3>Resultado esperado</h3>
<p>El sistema debería continuar funcionando utilizando los nodos disponibles, dependiendo del estado y del quórum del Replica Set.</p>
<h3>Evidencia</h3>
<blockquote>
<p><strong>
<img width="1570" height="435" alt="Captura de pantalla 2026-10-25 222854" src="https://github.com/user-attachments/assets/06a0cd59-2595-4824-978c-5484dcb9e62a" />
</strong></p>
</blockquote>
<hr>
<h1>19. Prueba de caída de dos nodos MongoDB</h1>
<h2>19.1 Escenario</h2>
<p>Para realizar una prueba más exigente se detendrán dos nodos:</p>
<pre><code class="language-text">mongodb1
mongodb2
</code></pre>
<p>El nodo restante será:</p>
<pre><code class="language-text">mongodb3
</code></pre>
<h3>Comandos</h3>
<pre><code class="language-bash">docker stop mongodb1
docker stop mongodb2
</code></pre>
<h3>Objetivo</h3>
<p>Comprobar cómo responde MongoDB cuando solamente queda un nodo disponible.</p>
<p>También se comprobará el comportamiento de la aplicación y de la página web.</p>
<h3>Evidencia</h3>
<blockquote>
<p><strong>
<img width="1410" height="601" alt="Captura de pantalla 2026-10-25 232728" src="https://github.com/user-attachments/assets/f7ca41f6-b7dc-43e7-b396-417466d196aa" />
</strong></p>
</blockquote>
<hr>
<h1>20. Prueba de Redis</h1>
<h2>20.1 Caída del nodo principal</h2>
<h3>Escenario</h3>
<p>Se detendrá:</p>
<pre><code class="language-text">redis-master
</code></pre>
<h3>Comando</h3>
<pre><code class="language-bash">docker stop redis-master
</code></pre>
<p>Después se observará el comportamiento de:</p>
<ul>
<li>Redis Sentinel.</li>
<li>La réplica.</li>
<li>El proceso de failover.</li>
<li>La aplicación.</li>
<li>La página web.</li>
</ul>
<h3>Objetivo</h3>
<p>Comprobar si Redis Sentinel detecta la caída del nodo principal y realiza el proceso correspondiente para mantener disponible el servicio.</p>
<h3>Evidencia</h3>
<blockquote>
<p><strong>Pendiente: colocar aquí las capturas y resultados.</strong></p>
</blockquote>
<hr>
<h1>21. Prueba de GaleraDB</h1>
<h2>21.1 Caída de un nodo</h2>
<h3>Escenario</h3>
<p>Se detendrá uno de los nodos del clúster:</p>
<pre><code class="language-text">galera1
</code></pre>
<h3>Comando</h3>
<pre><code class="language-bash">docker stop galera1
</code></pre>
<h3>Objetivo</h3>
<p>Comprobar si ProxySQL puede continuar utilizando los nodos disponibles:</p>
<pre><code class="language-text">galera2
galera3
</code></pre>
<p>También se comprobará si la aplicación continúa respondiendo correctamente.</p>
<h3>Evidencia</h3>
<blockquote>
<p><strong>
<img width="1838" height="702" alt="Captura de pantalla 2026-10-25 230428" src="https://github.com/user-attachments/assets/3bbc9e69-5dff-4efb-b5b0-46507f45cb73" />

</strong></p>
</blockquote></body></html><!--EndFragment-->
</body>
</html>
<html>
<body>
<!--StartFragment--><html><head></head><body><h1>22. Pruebas de carga y funcionamiento</h1>
<p>Además de las pruebas de caída de nodos, se realizarán pruebas para comprobar que la aplicación continúa respondiendo cuando recibe múltiples solicitudes.</p>
<p>Las pruebas se realizarán desde otro equipo conectado a la misma red local.</p>
<p>La infraestructura estará ubicada en un equipo servidor y otro equipo será utilizado como cliente para generar tráfico.</p>
<h2>22.1 PC A — Servidor</h2>
<p>La PC A será la encargada de ejecutar la infraestructura mediante Docker.</p>
<p>En ella estarán ejecutándose los diferentes contenedores que forman el sistema distribuido.</p>
<hr>
<h2>22.2 PC B — Cliente</h2>
<p>La PC B será utilizada para generar peticiones hacia la infraestructura.</p>
<p>Desde este equipo se realizarán las pruebas de carga y se comprobará si la aplicación continúa respondiendo correctamente.</p>
<hr>
<h1>23. Prueba de conectividad entre equipos</h1>
<p>Antes de comenzar con las pruebas de carga se comprobará que ambos equipos puedan comunicarse mediante la red local.</p>
<p>En la PC A se puede habilitar la respuesta a solicitudes ICMP mediante PowerShell con permisos de administrador:</p>
<pre><code class="language-powershell">New-NetFirewallRule -Name "Allow_Ping" -DisplayName "Permitir Ping" -Protocol ICMPv4 -IcmpType 8 -Action Allow
</code></pre>
<p>Posteriormente, desde la PC B se puede comprobar la conectividad mediante:</p>
<pre><code class="language-powershell">ping DIRECCION_IP_PC_A
</code></pre>
<p>El objetivo es verificar que existe comunicación entre los dos equipos antes de realizar las pruebas.</p>
<hr>
<h1>24. Prueba de carga</h1>
<p>Desde la PC B se pueden generar múltiples solicitudes hacia el balanceador de carga de la PC A.</p>
<p>Por ejemplo:</p>
<pre><code class="language-powershell">1..50 | ForEach-Object {
    Start-Job -ScriptBlock {
        1..20 | ForEach-Object {
            Invoke-WebRequest -Uri "http://DIRECCION_IP_PC_A/" -UseBasicParsing
        }
    }
}
</code></pre>
<p>El objetivo de esta prueba es generar múltiples solicitudes concurrentes y observar el comportamiento de la arquitectura.</p>
<p>Durante la prueba se comprobará:</p>
<ul>
<li>Respuesta de la página.</li>
<li>Código HTTP.</li>
<li>Estado de los contenedores.</li>
<li>Uso de recursos.</li>
<li>Comportamiento de los balanceadores.</li>
<li>Comportamiento de las bases de datos.</li>
</ul>
<h3>Evidencia</h3>
<blockquote>
<p><strong>
<img width="1286" height="412" alt="Captura de pantalla 2026-10-25 225443" src="https://github.com/user-attachments/assets/cc22e52c-a323-46ff-8f38-f2ae6bf1ada0" />
</strong></p>
</blockquote>
<hr>
<h1>25. Prueba de caída de la capa Web</h1>
<p>También se realizará una prueba sobre la capa de presentación.</p>
<p>Se detendrá uno de los servidores web, por ejemplo:</p>
<pre><code class="language-text">web1
</code></pre>
<p>Comando:</p>
<pre><code class="language-bash">docker stop NOMBRE_DEL_CONTENEDOR_WEB1
</code></pre>
<p>Después se comprobará si el balanceador redirige las solicitudes hacia los otros servidores disponibles:</p>
<pre><code class="language-text">web2
web3
</code></pre>
<h3>Resultado esperado</h3>
<p>La página debería continuar disponible mientras existan otros servidores web funcionando.</p>
<h3>Evidencia</h3>
<blockquote>
<p><strong>
<img width="1707" height="433" alt="Captura de pantalla 2026-10-25 225622" src="https://github.com/user-attachments/assets/e1cdb29d-1496-4dd3-b3e9-6e24ec32fe09" />
</strong></p>
</blockquote>
<blockquote>
<p><strong>Pendiente: colocar aquí la captura de Nagios mostrando el nodo detenido.</strong></p>
</blockquote>
<hr>
<h1>26. Prueba de caída de la capa de aplicación</h1>
<p>Se realizará una prueba similar sobre la capa de aplicación.</p>
<p>Se detendrá una de las instancias de la API, por ejemplo:</p>
<pre><code class="language-text">app1
</code></pre>
<p>Después se comprobará si el balanceador de aplicación dirige las solicitudes hacia:</p>
<pre><code class="language-text">app2
app3
</code></pre>
<h3>Resultado esperado</h3>
<p>La API debería continuar respondiendo mediante las instancias disponibles.</p>
<h3>Evidencia</h3>
<blockquote>
<p><strong>Pendiente: colocar aquí la captura de Nagios.</strong></p>
</blockquote>
<blockquote>
<p><strong>
<img width="1826" height="587" alt="Captura de pantalla 2026-10-25 225830" src="https://github.com/user-attachments/assets/42dc77e2-06a8-45f5-902f-dc1375950a1d" />
</strong></p>
</blockquote>
<hr>
<h1>27. Prueba de caída de GaleraDB</h1>
<p>Se detendrá uno de los nodos del clúster:</p>
<pre><code class="language-text">galera1
</code></pre>
<p>Después se observará el comportamiento de ProxySQL y de los nodos restantes:</p>
<pre><code class="language-text">galera2
galera3
</code></pre>
<h3>Resultado esperado</h3>
<p>ProxySQL debería detectar la disponibilidad de los nodos restantes y continuar enviando las consultas hacia los servidores disponibles.</p>
<h3>Evidencia</h3>
<blockquote>
<p><strong>
<img width="1871" height="775" alt="Captura de pantalla 2026-10-25 230042" src="https://github.com/user-attachments/assets/a29852a5-a210-4076-8ef9-a085df235e62" />
</strong></p>
</blockquote>
<hr>
<h1>28. Prueba de Chaos Engineering</h1>
<p>Como prueba adicional se realizará una prueba de <strong>Chaos Engineering</strong>, donde se provocará la caída de más de un nodo para observar cómo responde el sistema ante un escenario más crítico.</p>
<p>Por ejemplo, se pueden detener simultáneamente:</p>
<pre><code class="language-text">galera1
galera2
</code></pre>
<p>dejando disponible:</p>
<pre><code class="language-text">galera3
</code></pre>
<p>El objetivo es comprobar el comportamiento de la infraestructura ante una falla múltiple.</p>
<p>Durante esta prueba se observará:</p>
<ul>
<li>Estado de los nodos.</li>
<li>Alertas de Nagios.</li>
<li>Estado de ProxySQL.</li>
<li>Respuesta de la aplicación.</li>
<li>Respuesta de la página web.</li>
<li>Códigos HTTP obtenidos.</li>
</ul>
<h3>Evidencia</h3>
<blockquote>
<p><strong>
<img width="1867" height="691" alt="Captura de pantalla 2026-10-25 230159" src="https://github.com/user-attachments/assets/3ede5dc2-7fe9-41e4-b885-4e24e4cda42a" />
</strong></p>
</blockquote>
<hr>
<h1>29. Resultados de las pruebas</h1>
<p>Los resultados de las pruebas se registrarán en la siguiente tabla:</p>


Prueba | Nodo o servicio detenido | ¿La página continuó funcionando? | Resultado
-- | -- | -- | --
MongoDB | mongodb1 | Pendiente | Terminado
MongoDB | mongodb1 + mongodb2 | Pendiente | Terminado
Redis | redis-master | Pendiente | Terminado
GaleraDB | galera1 | Pendiente | Terminado
Web | web1 | Pendiente | Terminado
Aplicación | app1 | Pendiente | Terminado
Chaos Engineering | galera1 + galera2 | Terminado | Terminado

<h1>30.Pruebas desarrolladas en base al archivo TEST-PLAN.md</h1>

# Plan Global de Pruebas de Resiliencia, Rendimiento, Alta Disponibilidad (HA) e Ingeniería de Caos

**Entorno:** Windows PowerShell / Docker Desktop  
**Prefijo de Contenedores:** `distributed-three-tier-`  
**VIPs de HA (Keepalived):** Capa de Presentación (`172.30.0.250`), Capa de Aplicación (`172.30.0.251`)

---

## FASE 1: Pruebas Funcionales y de Línea Base (Baseline)

### Prueba 1: Verificación de Salud de la API
* **Propósito:** Confirmar que la API responde correctamente a través de la IP Virtual del balanceador.
* **Comando:**
  ```powershell
  curl.exe -i http://localhost/api/health
  ```
* **Resultado Esperado:** Código HTTP `200 OK` y estado `healthy`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_http_application_api`.

<img width="730" height="405" alt="image" src="https://github.com/user-attachments/assets/fbcf09aa-a2a1-419f-a6c9-9346d32b82ec" />


### Prueba 2: Verificación del Quórum de Galera DB
* **Propósito:** Garantizar que los 3 nodos MariaDB están sincronizados y forman quórum.
* **Comando:**
  ```powershell
  docker exec -it distributed-three-tier-galera1-1 mysql -u root -p'secret' -e "SHOW GLOBAL STATUS LIKE 'wsrep_cluster_size';"
  ```
* **Resultado Esperado:** La variable `wsrep_cluster_size` muestra el valor `3`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_galera_cluster`.

<img width="688" height="392" alt="image" src="https://github.com/user-attachments/assets/029825c1-4fe1-41f8-8a49-d7346b692a0a" />


### Prueba 3: Asignación de IP Virtual (VIP) en Keepalived
* **Propósito:** Validar que el nodo Master de presentación sostiene la IP Virtual de la red.
* **Comando:**
  ```powershell
  docker exec -it distributed-three-tier-presentation-lb-master-1 ip addr show eth0
  ```
* **Resultado Esperado:** Presencia del bloque de red con la IP Virtual asignada en la interfaz `eth0`.
* **Monitoreo en Nagios:** `Hosts` $\rightarrow$ `presentation-lb-master`.

<img width="618" height="353" alt="image" src="https://github.com/user-attachments/assets/fb65647e-b85f-4125-842f-97dab07e5c37" />


### Prueba 4: Rotación Round-Robin en Capa Web
* **Propósito:** Verificar la distribución equitativa de peticiones entre los nodos Nginx (`web1`, `web2`, `web3`).
* **Comando:**
  ```powershell
  for ($i=1; $i -le 6; $i++) { (curl.exe -sI http://localhost/).Headers | Select-String "X-Web-Node" }
  ```
* **Resultado Esperado:** Las respuestas alternan de forma secuencial entre los nodos web.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_web_nodes_health`.

<img width="839" height="474" alt="image" src="https://github.com/user-attachments/assets/625abd3b-cd6a-4d64-904c-39dcbbdfd328" />


### Prueba 5: Replicación Multi-Maestro en SQL
* **Propósito:** Validar la consistencia inmediata de escrituras y lecturas cruzadas en Galera DB.
* **Comando:**
  ```powershell
  docker exec -it distributed-three-tier-galera1-1 mysql -u catalog_user -p'catalog_pass' catalog_db -e "INSERT INTO products (name, price) VALUES ('Producto-Test', 150);"
  docker exec -it distributed-three-tier-galera3-1 mysql -u catalog_user -p'catalog_pass' catalog_db -e "SELECT * FROM products WHERE name='Producto-Test';"
  ```
* **Resultado Esperado:** El registro insertado en `galera1` se consulta exitosamente en `galera3`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_galera_cluster`.

<img width="850" height="402" alt="image" src="https://github.com/user-attachments/assets/17b293fb-bdf3-4b45-88e7-27fb8e251c7b" />


### Prueba 6: Comportamiento Hit/Miss en Caché (Redis)
* **Propósito:** Confirmar que la API utiliza Redis para reducir la carga hacia la base de datos SQL.
* **Comando:**
  ```powershell
  curl.exe -i http://localhost/api/products/cheapest
  curl.exe -i http://localhost/api/products/cheapest
  ```
* **Resultado Esperado:** La primera petición responde con `cache miss` y la segunda con `cache hit`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_redis_cache`.

<img width="857" height="483" alt="image" src="https://github.com/user-attachments/assets/277d91b0-34c4-494a-bcfc-336d493cb90a" />


## FASE 2: Pruebas de Rendimiento (Performance Tests)

### Prueba 7: Smoke Test (Prueba de Humo)
* **Propósito:** Validar el camino básico de ejecución bajo una carga mínima.
* **Comando:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 50 -c 2 http://host.docker.internal/api/products/cheapest
  ```
* **Resultado Esperado:** 0% de peticiones fallidas y latencia promedio baja (<50 ms).
* **Monitoreo en Nagios:** `Tactical Overview` (Sin alertas).

<img width="864" height="554" alt="image" src="https://github.com/user-attachments/assets/50d8db0b-5bed-44c7-bc69-c5aa6881e8db" />


### Prueba 8: Load Test (Prueba de Carga Estándar)
* **Propósito:** Medir la latencia y rendimiento bajo concurrencia normal sostenida.
* **Comando:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 1000 -c 50 http://host.docker.internal/api/products/cheapest
  ```
* **Resultado Esperado:** Disponibilidad del 100% (0 fallos) y throughput constante (>1000 req/sec).
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_http_application_api`.

<img width="856" height="480" alt="image" src="https://github.com/user-attachments/assets/9cb59e64-0f50-402e-8ee7-28685f62f536" />


### Prueba 9: Stress Test (Prueba de Estrés / Breakpoint)
* **Propósito:** Encontrar el límite máximo de peticiones antes de que la infraestructura empiece a fallar.
* **Comando:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 5000 -c 200 http://host.docker.internal/api/products/cheapest
  ```
* **Resultado Esperado:** Saturación del pool/sockets (`apr_pollset_poll: timeout expired`) confirmando el punto de quiebre.
* **Monitoreo en Nagios:** `Service Detail` pasa a `WARNING` o `CRITICAL`.

<img width="862" height="433" alt="image" src="https://github.com/user-attachments/assets/6060693c-e42a-492e-bba7-e7d7f8601210" />


### Prueba 10: Spike Test (Prueba de Picos)
* **Propósito:** Evaluar la capacidad de absorción de HAProxy ante ráfagas repentinas e intensas de tráfico.
* **Comando:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 1000 -c 150 http://host.docker.internal/api/products/cheapest
  ```
* **Resultado Esperado:** Absorción del pico sin caídas ni reinicios no planificados de contenedores.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_http_presentation_lb`.

<img width="871" height="661" alt="image" src="https://github.com/user-attachments/assets/ebbff79e-5181-4458-8313-a783e3b2cebb" />


### Prueba 11: Endurance / Soak Test (Prueba de Resistencia)
* **Propósito:** Detectar fugas de memoria o degradación acumulativa de recursos a lo largo del tiempo.
* **Comando:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 3000 -c 20 http://host.docker.internal/api/products/cheapest
  ```
* **Resultado Esperado:** 100% peticiones completadas con exito, 0% fallos y tiempos de respuesta estables.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_memory_usage`.

<img width="842" height="484" alt="image" src="https://github.com/user-attachments/assets/46f38b3b-7296-4ef9-8b48-b2e8817d25ae" />


### Prueba 12: Impacto de Caché (Redis Clear / FLUSHALL)
* **Propósito:** Comparar el rendimiento de la API con y sin aceleración por caché.
* **Comandos:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 200 -c 10 http://host.docker.internal/api/products/cheapest
  docker exec -it distributed-three-tier-redis-master-1 redis-cli FLUSHALL
  docker run --rm --net=host httpd:alpine ab -n 200 -c 10 http://host.docker.internal/api/products/cheapest
  ```
* **Resultado Esperado:** Aumento en el tiempo de respuesta posterior al `FLUSHALL` debido a la consulta directa a Galera DB.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_redis_cache`.

<img width="855" height="479" alt="image" src="https://github.com/user-attachments/assets/91978eb2-bccd-47b2-8904-beb1a60b22e8" />


### Prueba 13: Rate Limiting y Protección de API
* **Propósito:** Evaluar los mecanismos de limitación de tasa o degradación controlada bajo ráfagas concurrentes.
* **Comando:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 500 -c 50 http://host.docker.internal/api/products/cheapest
  ```
* **Resultado Esperado:** Respuesta controlada o rechazo seguro de peticiones excesivas.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_http_presentation_lb`.

<img width="866" height="428" alt="image" src="https://github.com/user-attachments/assets/094b0e10-7519-44a8-95f9-83c927ac2e2e" />


## FASE 3: Alta Disponibilidad (HA) y Failover

### Prueba 14: Caída del Balanceador Master de Presentación
* **Propósito:** Verificar la migración de la VIP externa vía Keepalived al nodo de respaldo.
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-presentation-lb-master-1
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-presentation-lb-master-1
  ```
* **Resultado Esperado:** Respuesta exitosa `200 OK` con traza indicando paso por `presentation-lb-backup`.
* **Monitoreo en Nagios:** `Hosts` $\rightarrow$ `presentation-lb-master` en estado `DOWN`.

<img width="857" height="474" alt="image" src="https://github.com/user-attachments/assets/553552f1-2a44-44a2-9538-55256da8b5b9" />


### Prueba 15: Fallo del Script Check en Keepalived
* **Propósito:** Probar que si el proceso HAProxy cae, Keepalived cede la VIP automáticamente al reducir prioridad.
* **Comandos:**
  ```powershell
  docker exec -it distributed-three-tier-presentation-lb-master-1 pkill haproxy
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-presentation-lb-master-1
  ```
* **Resultado Esperado:** Conmutación automática del tráfico al nodo secundario sin interrupción de servicio.
* **Monitoreo en Nagios:** Alerta sobre proceso HAProxy.

<img width="812" height="464" alt="image" src="https://github.com/user-attachments/assets/ca1e9d5b-8e5f-4f69-845b-ce2da8682284" />


### Prueba 16: Recuperación del Balanceador Master (Failback)
* **Propósito:** Garantizar la reincorporación limpia del nodo primario sin generar fluctuaciones de red.
* **Comandos:**
  ```powershell
  docker start distributed-three-tier-presentation-lb-master-1
  curl.exe -i http://localhost/api/products/cheapest
  ```
* **Resultado Esperado:** El nodo recupera el rol de Master de forma transparente.
* **Monitoreo en Nagios:** `Hosts` $\rightarrow$ Vuelve a estado `UP`.

<img width="870" height="435" alt="image" src="https://github.com/user-attachments/assets/23b4d81e-ea96-4b9a-83d3-73264bfca6f6" />


### Prueba 17: Caída del Balanceador Master de Aplicación (API LB)
* **Propósito:** Probar la alta disponibilidad del balanceador de carga interno de la API.
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-application-lb-master-1
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-application-lb-master-1
  ```
* **Resultado Esperado:** Transferencia inmediata de peticiones a `application-lb-backup`.
* **Monitoreo en Nagios:** `Hosts` $\rightarrow$ `application-lb-master` en `DOWN`.

<img width="864" height="438" alt="image" src="https://github.com/user-attachments/assets/08c59781-ed46-4418-b96b-872b59ed9a78" />


### Prueba 18: Caída Total de Balanceadores de una Capa (Prueba Negativa)
* **Propósito:** Confirmar la interrupción total controlada cuando caen ambos balanceadores de una capa.
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-presentation-lb-master-1 distributed-three-tier-presentation-lb-backup-1
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-presentation-lb-master-1 distributed-three-tier-presentation-lb-backup-1
  ```
* **Resultado Esperado:** Interrupción completa del servicio (Outage) y recuperación al reiniciar los contenedores.
* **Monitoreo en Nagios:** `Tactical Overview` en estado de Alerta Crítica Global.

<img width="867" height="444" alt="image" src="https://github.com/user-attachments/assets/85787c4f-4995-4b15-ae34-37f9c1122f79" />


### Prueba 19: Caída de 1 Nodo Web (`web1`)
* **Propósito:** Validar el aislamiento inmediato de nodos caídos en la capa web Nginx.
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-web1-1
  curl.exe -i -s http://localhost/api/products/cheapest | Select-String "x-request-trace"
  docker start distributed-three-tier-web1-1
  ```
* **Resultado Esperado:** HAProxy redistribuye el tráfico únicamente hacia `web2` y `web3`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_web_nodes_health` en `WARNING`.

<img width="864" height="446" alt="image" src="https://github.com/user-attachments/assets/f3d6c902-14aa-41ad-8fe1-a7eacff12fca" />


### Prueba 20: Caída de 2 Nodos Web (`web1` y `web2`)
* **Propósito:** Probar la capacidad reducida de respuesta sirviendo tráfico con un solo nodo activo.
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-web1-1 distributed-three-tier-web2-1
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-web1-1 distributed-three-tier-web2-1
  ```
* **Resultado Esperado:** El servicio se mantiene en línea procesando solicitudes exclusivamente mediante `web3`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_web_nodes_health` en `WARNING`/`CRITICAL`.

<img width="868" height="655" alt="image" src="https://github.com/user-attachments/assets/9b035fe9-3b35-41c3-ba98-e55b3bdf9a67" />


### Prueba 21: Caída de 1 Nodo de API (`app1`)
* **Propósito:** Probar la tolerancia a fallos en los servidores de lógica de negocio (Node.js).
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-app1-1
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-app1-1
  ```
* **Resultado Esperado:** Reenrutamiento de las consultas de la API hacia `app2` y `app3`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_app_nodes_health` pasa a `WARNING`.

<img width="843" height="468" alt="image" src="https://github.com/user-attachments/assets/3347c62a-f40b-451c-a726-633b473394a4" />


### Prueba 22: Caída de Nodo Galera DB Secundario (`galera2`)
* **Propósito:** Confirmar que la pérdida de un nodo de base de datos no afecta el quórum del clúster.
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-galera2-1
  docker exec -it distributed-three-tier-galera1-1 mysql -u root -p'secret' -e "SHOW GLOBAL STATUS LIKE 'wsrep_cluster_size';"
  docker start distributed-three-tier-galera2-1
  ```
* **Resultado Esperado:** El clúster se mantiene operativo con 2 de 3 nodos (`wsrep_cluster_size` = 2).
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_galera_cluster`.

<img width="866" height="505" alt="image" src="https://github.com/user-attachments/assets/1577bc4b-52eb-47dd-8cd7-cae9fff94fdc" />


### Prueba 23: Caída de Nodo Galera DB Primario (`galera1`)
* **Propósito:** Validar que la aplicación no posee dependencia directa a `galera1` como punto único de fallo (SPOF).
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-galera1-1
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-galera1-1
  ```
* **Resultado Esperado:** ProxySQL redirecciona las consultas de base de datos hacia los nodos Galera vivos.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_galera_cluster`.

<img width="869" height="518" alt="image" src="https://github.com/user-attachments/assets/1efd1f48-1a38-45cb-9608-fd5317bdd83e" />


## FASE 4: Ingeniería de Caos (Chaos Engineering)

### Prueba 24: Inyección de Caos con Chaos Monkey
* **Propósito:** Provocar apagados y pausas aleatorias en contenedores durante la ejecución de tráfico.
* **Ubicación:** `resilience-lab/chaosmonkey/chaosmonkey.py`
* **Código:**
  ```python
  import time, random, docker

  client = docker.from_env()
  TARGETS = [
      "distributed-three-tier-web1-1",
      "distributed-three-tier-web2-1",
      "distributed-three-tier-app1-1",
      "distributed-three-tier-app2-1",
      "distributed-three-tier-galera2-1"
  ]

  while True:
      target = random.choice(TARGETS)
      try:
          c = client.containers.get(target)
          print(f"[CAOS] Deteniendo {target}")
          c.stop()
          time.sleep(10)
          print(f"[RESCATE] Iniciando {target}")
          c.start()
      except Exception as e:
          print(f"Error: {e}")
      time.sleep(15)
  ```
* **Ejecución:**
  ```powershell
  python resilience-lab/chaosmonkey/chaosmonkey.py
  ```
* **Resultado Esperado:** Ciclo automatizado de fallos y recuperaciones con continuidad de servicio.

### Prueba 25: Inyección de Latencia de Red Artificial
* **Propósito:** Simular lentitud de red en un servicio específico utilizando Pumba.
* **Comando:**
  ```powershell
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock gaiaadm/pumba netem --duration 1m delay --time 300 distributed-three-tier-app1-1

* **Resultado Esperado:** Inyección de 300 ms de latencia extra en el contenedor `app1`.
* **Monitoreo en Nagios:** Incremento en tiempos de respuesta de la API.

<img width="1109" height="619" alt="image" src="https://github.com/user-attachments/assets/70adebb9-1724-4b32-b000-d0205b011123" />

<img width="1106" height="315" alt="image" src="https://github.com/user-attachments/assets/0132779f-def1-4e53-8fe4-b7ae258900b0" />

### Prueba 26: Saturación Extrema de CPU
* **Propósito:** Evaluar el comportamiento del balanceador frente a un nodo con CPU saturada.
* **Comando:**
  ```powershell
  docker exec -it distributed-three-tier-app1-1 sh -c "apt-get update && apt-get install -y stress-ng && stress-ng --cpu 2 --timeout 30s"
  ```
* **Resultado Esperado:** Consumo de CPU al 100% en `app1` durante 30 segundos sin caída del servicio global.
* **Monitoreo en Nagios:** Alerta de CPU en nodo de aplicación.

<img width="1110" height="619" alt="image" src="https://github.com/user-attachments/assets/8dcb4e34-409c-4839-b6c8-032457159bd0" />

### Prueba 27: Degradación Elegante por Caída de Redis
* **Propósito:** Comprobar que la pérdida de la memoria caché no detiene la aplicación totalmente.
* **Comandos:**
  ```powershell
  docker stop distributed-three-tier-redis-master-1
  curl.exe -i http://localhost/api/products/cheapest
  docker start distributed-three-tier-redis-master-1
  ```
* **Resultado Esperado:** La aplicación responde más lento al consultar directamente a SQL, pero no arroja `HTTP 500`.
* **Monitoreo en Nagios:** `Services` $\rightarrow$ `check_redis_cache` en `CRITICAL`.

<img width="1090" height="568" alt="image" src="https://github.com/user-attachments/assets/26426091-63a4-4aef-9f38-d01c6709b495" />


### Prueba 28: Fallos Compuestos
* **Propósito:** Evaluar la resiliencia ejecutando carga, caída de nodos y vaciado de caché al mismo tiempo.
* **Comando Terminal 1:**
  ```powershell
  docker run --rm --net=host httpd:alpine ab -n 1000 -c 20 http://host.docker.internal/api/products/cheapest
  ```
* **Comando Terminal 2 (Durante la carga):**
  ```powershell
  docker stop distributed-three-tier-app2-1
  docker exec -it distributed-three-tier-redis-master-1 redis-cli FLUSHALL
  ```
* **Resultado Esperado:** El clúster absorbe la combinación de fallos sin colapsar.

<img width="1097" height="609" alt="image" src="https://github.com/user-attachments/assets/1bfe257a-b078-4447-8237-242fda078a70" />


### Prueba 29: Reboot en Frío y Secuencia de Arranque
* **Propósito:** Validar que el clúster se levanta correctamente tras un apagado completo.
* **Comandos:**
  ```powershell
  docker-compose down
  docker-compose up -d
  ```
* **Resultado Esperado:** Restablecimiento automático de dependencias en el orden adecuado.
* **Monitoreo en Nagios:** Todos los servicios regresan a estado `OK`.

<img width="829" height="815" alt="Captura de pantalla 2026-10-26 020932" src="https://github.com/user-attachments/assets/98dd4a1b-9a34-4688-a873-e02d2af6ed95" />


## FASE 5: Observabilidad y Telemetría

### Prueba 30: Validación de Métricas y Tiempos de Detección (MTTD / MTTR)
* **Propósito:** Medir el Tiempo Medio de Detección (MTTD) y Recuperación (MTTR) en Nagios (`http://localhost:8080`).
* **Procedimiento:**
  1. Detener un contenedor: `docker stop distributed-three-tier-web1-1`. Cronometrar los segundos hasta que Nagios cambie a `CRITICAL` (**MTTD**).
  2. Enceder el contenedor: `docker start distributed-three-tier-web1-1`. Cronometrar los segundos hasta que regrese a `OK` (**MTTR**).
* **Resultado Esperado:** Registro documentado de los tiempos de reacción del sistema de monitoreo.
* **Monitoreo en Nagios:** `State History` y `Notifications`.
<img width="961" height="386" alt="Captura de pantalla 2026-10-26 021043" src="https://github.com/user-attachments/assets/1c77c011-c56c-40e2-8dcb-5c5f7670ea5a" />
<img width="1862" height="988" alt="Captura de pantalla 2026-10-26 021304" src="https://github.com/user-attachments/assets/f556108d-472b-456d-b2ad-2946e7f7f141" />

<img width="1906" height="873" alt="image" src="https://github.com/user-attachments/assets/7fd015f9-f941-47ce-8650-1cf1658c1441" />




<h1>31. Conclusión</h1>
<p>Durante este proyecto se trabajó con una arquitectura distribuida de tres capas utilizando diferentes herramientas para mejorar su disponibilidad y tolerancia a fallos.</p>
<p>Docker Desktop permitió ejecutar y administrar los diferentes servicios mediante contenedores, mientras que Visual Studio Code se utilizó para revisar la estructura del proyecto y realizar las modificaciones necesarias. La terminal y PowerShell permitieron ejecutar comandos, iniciar los servicios, revisar su estado y realizar las diferentes pruebas.</p>
<p>Las mejoras principales se enfocaron en <strong>MongoDB, Redis y GaleraDB</strong>, siguiendo los puntos establecidos en el archivo <code>ToDo.md</code>.</p>
<p>En MongoDB se implementó un <strong>Replica Set de tres nodos</strong>, buscando evitar la dependencia de un único nodo y permitir que los miembros del conjunto participen en la elección del nodo primario.</p>
<p>En Redis se configuró una arquitectura con <strong>replicación y Redis Sentinel</strong>, además de mecanismos de persistencia mediante <strong>AOF y RDB</strong>.</p>
<p>En GaleraDB se incorporó <strong>ProxySQL</strong> para gestionar las conexiones entre la aplicación y los diferentes nodos del clúster. También se configuraron reglas para separar las operaciones de lectura y escritura y se estableció un límite de conexiones en la aplicación.</p>
<p>Finalmente, las pruebas de tolerancia a fallos permitirán comprobar en la práctica cómo responde el sistema cuando determinados nodos dejan de estar disponibles.</p>
<p>El objetivo principal de estas pruebas es comprobar que la arquitectura no dependa de un único componente y que, cuando sea posible, los servicios restantes puedan continuar atendiendo las solicitudes sin que el usuario perciba una interrupción del sistema.</p>
<p>Los resultados finales, las capturas de las pruebas y el diagrama de arquitectura se incorporarán en los apartados correspondientes de esta documentación.</p></body></html><!--EndFragment-->
</body>
</html>
