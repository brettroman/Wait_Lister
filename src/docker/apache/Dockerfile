# docker/apache/Dockerfile
FROM httpd:2.4.51

COPY Wait_Lister.apache.conf /usr/local/apache2/conf/Wait_Lister.apache.conf

RUN echo "Include /usr/local/apache2/conf/Wait_Lister.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf