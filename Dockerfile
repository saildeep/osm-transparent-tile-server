FROM overv/openstreetmap-tile-server
RUN sed -i 's/\/tile/.\/tile/g' /var/www/html/index.html
ARG BRANCH=transparency-no-labels
RUN cd / \
 && git clone https://github.com/saildeep/openstreetmap-carto.git \
 && cd openstreetmap-carto \
 && git checkout $BRANCH \
 && carto project.mml > /home/renderer/src/openstreetmap-carto/mapnik.xml \
 && cp ./symbols/shields/blank.svg /home/renderer/src/openstreetmap-carto/symbols/shields/blank.svg
EXPOSE 80 5432
