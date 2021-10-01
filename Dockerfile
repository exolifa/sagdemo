version: "3"

services:
    db12:
      container_name: adabasdb_12
      image: store/softwareag/adabas-ce:7.0.0
      environment:
        ACCEPT_EULA: Y
        ADADBID: 12
        ADA_DB_CREATION: demodb
      ports:
        - "60012:60001"
        - "8190:8190"
        - "8191:8191"
      networks:
        - sagnet
      volumes:
        - adabasdata12:/data:z
        - licenses:/opt/softwareag/common/conf:z
      restart: unless-stopped
    db13:
      container_name: adabasdb_13
      image: store/softwareag/adabas-ce:7.0.0
      environment:
        ACCEPT_EULA: Y
        ADADBID: 13
        ADA_DB_CREATION: demodb
      ports:
        - "60013:60001"
        - "8890:8190"
        - "8891:8191"
      networks:
        - sagnet
      volumes:
        - adabasdata13:/data:z
        - licenses:/opt/softwareag/common/conf:z
      restart: unless-stopped
    adabasmanager:
      container_name: adabasmanager
      image: store/softwareag/adabasmanager-ce:8.6.0
      volumes:
        - config:/opt/softwareag/AdabasManager/config
      environment:
        - ACCEPT_EULA=Y
      ports:
        - 8083:8083
        - 4990:4990
      networks:
        - sagnet
      restart: unless-stopped
    natural:    
      container_name: natural
      image: store/softwareag/natural-ce:9.1.3
      environment:
        - ACCEPT_EULA=Y      
      volumes:
        - fuser:/opt/softwareag/Natural/fuser
      networks:
        - sagnet
networks:
    sagnet:
      driver: bridge
volumes:
  adabasdata12:  
  adabasdata13:   
  licenses:
  config:
  fuser:
