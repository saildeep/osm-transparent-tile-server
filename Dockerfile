FROM overv/openstreetmap-tile-server

RUN cd / \
 && git clone https://github.com/saildeep/openstreetmap-carto.git \
 && cd openstreetmap-carto \
 && git checkout transparency \
 && carto project.mml > /home/renderer/src/openstreetmap-carto/mapnik.xml

EXPOSE 80 5432
