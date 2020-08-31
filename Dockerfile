FROM overv/openstreetmap-tile-server

RUN cd / \
 && git clone https://github.com/saildeep/openstreetmap-carto.git \
 && cd openstreetmap-carto \
 && git checkout transparency-no-labels \
 && carto project.mml > /home/renderer/src/openstreetmap-carto/mapnik.xml \
 && sed -i 's/\/tile/.\/tile/g' /var/www/html/index.html
EXPOSE 80 5432
