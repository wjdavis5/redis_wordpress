FROM redis:5
COPY redis-sentinel.conf /usr/local/etc/redis/redis-sentinel.conf
COPY redis-cluster.conf /usr/local/etc/redis/redis-cluster.conf
#sentinel
EXPOSE 26379
#cluster primary
EXPOSE 6379
#cluster replica
EXPOSE 6380 
#CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]