@echo on
docker run --rm -it -v %cd%:/opt/app swift:4.0 bash
