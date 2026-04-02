FROM nginx:1.27-alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy website files
COPY index.html /usr/share/nginx/html/index.html

# Custom nginx config for SPA / single-page site
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Non-root user for security
RUN addgroup -S webgroup && adduser -S webuser -G webgroup \
    && chown -R webuser:webgroup /usr/share/nginx/html \
    && chown -R webuser:webgroup /var/cache/nginx \
    && touch /var/run/nginx.pid \
    && chown webuser:webgroup /var/run/nginx.pid

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
