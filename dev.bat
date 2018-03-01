@echo on
docker run --rm -it -p 8080:8080 -v %cd%:/opt/app swift:4.0 bash
