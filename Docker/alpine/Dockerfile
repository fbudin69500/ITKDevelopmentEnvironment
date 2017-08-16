FROM alpine
MAINTAINER Francois Budin <francois.budin@kitware.com>

RUN echo 'http://nl.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories && \
    echo 'http://dl-2.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories && \
    echo 'http://dl-3.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories && \
    echo 'http://dl-4.alpinelinux.org/alpine/v3.6/main'  >> /etc/apk/repositories && \
    echo 'http://dl-5.alpinelinux.org/alpine/v3.6/main'  >> /etc/apk/repositories && \
    echo 'http://dl-8.alpinelinux.org/alpine/v3.6/main'  >> /etc/apk/repositories
    
RUN echo 'http://nl.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories && \
    echo 'http://dl-2.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories && \
    echo 'http://dl-3.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories && \
    echo 'http://dl-4.alpinelinux.org/alpine/v3.6/community'  >> /etc/apk/repositories && \
    echo 'http://dl-5.alpinelinux.org/alpine/v3.6/community'  >> /etc/apk/repositories && \
    echo 'http://dl-8.alpinelinux.org/alpine/v3.6/community'  >> /etc/apk/repositories
    
RUN apk update
RUN apk add curl gcc g++ wget ca-certificates bzr git openssh-client subversion autoconf cmake make binutils libssl1.0
CMD ["/bin/sh"]
