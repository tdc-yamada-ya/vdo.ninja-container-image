FROM alpine/git:v2.32.0 as clone

WORKDIR /nodecg

RUN git clone https://github.com/steveseguin/vdo.ninja.git -b v19.4 --depth 1 /vdo.ninja

FROM nginx:1.21.4-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=clone /vdo.ninja/ /vdo.ninja/

# VDO.Ninja web port
EXPOSE 80
