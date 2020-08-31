FROM overv/openstreetmap-tile-server
RUN sed -i 's/\/tile/.\/tile/g' /var/www/html/index.html
ARG BRANCH=transparency-no-labels
RUN cd / 
RUN git clone https://github.com/saildeep/openstreetmap-carto.git \
 && cd openstreetmap-carto 
RUN git checkout $BRANCH
RUN carto project.mml > /home/renderer/src/openstreetmap-carto/mapnik.xml

EXPOSE 80 5432
