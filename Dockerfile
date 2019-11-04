FROM openjdk:8-jre-stretch@sha256:81d2e370e28efbe5592517ef15e000f2858c5057f71c30c9783853ef2cc03ede as Base
COPY docker-files /
RUN chmod u+rwx /usr/share/fonts/my_fonts/* \
  && fc-cache -fv \
  && ln -sf /dev/stdout /app/jetty.log
WORKDIR /app
EXPOSE 4040
CMD [ "java","-jar","csim_waybill_print_service_V1.1.4.jar" ]