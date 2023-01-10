FROM python:3.7-alpine

WORKDIR /usr/src/app

# download usermod and groupmod
RUN apk --no-cache add shadow runuser

# initialize user as needed
RUN adduser -Du 1001 -s /bin/sh abc

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Add crontab file in the cron directory
COPY crontab /etc/cron.d/update-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/update-cron

# Apply cron job
RUN crontab /etc/cron.d/update-cron

# install packages
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# copy shell scripts
COPY *.sh ./

# Fix permissions
RUN chmod +x *.sh

# copy python script last
COPY main.py ./

# Run the command on container startup
CMD ./setup.sh && ./update.sh && crond && tail -f /var/log/cron.log