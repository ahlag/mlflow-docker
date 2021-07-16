FROM python:3.8.0

COPY ./requirements.txt ./requirements.txt

ENV AWS_ACCESS_KEY_ID ${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY ${AWS_SECRET_ACCESS_KEY}
ENV BUCKET ${BUCKET}
ENV USERNAME ${USERNAME}
ENV PASSWORD ${PASSWORD}
ENV HOST ${HOST}
ENV PORT ${PORT}
ENV DATABASE ${DATABASE}

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    python3 python3-pip python3-setuptools python3-pandas supervisor gettext-base nginx apache2-utils python3-psycopg2 \
    && pip3 install wheel \
    && pip3 install -r requirements.txt \
    && apt-get remove --purge --auto-remove -y ca-certificates && rm -rf /var/lib/apt/lists/*

# WWW (nginx)
RUN addgroup -gid 1000 www \
    && adduser -uid 1000 -H -D -s /bin/sh -G www www

COPY nginx.conf.template /app/nginx.conf.template

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./entry-point.sh /app/entry-point.sh

COPY ./webserver.sh /app/webserver.sh

EXPOSE 80

CMD /bin/bash /app/entry-point.sh
