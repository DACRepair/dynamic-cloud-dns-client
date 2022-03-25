FROM python:3.10-alpine

ENV DCDNS_ZONE=example-com
# the DNS hostname to update, e.g. your.host.com
ENV DCDNS_HOST=test.example.com
# the URL of your deployed cloud function
ENV DCDNS_FUNCTION_URL=https://us-central1-<project-name>.cloudfunctions.net/updateHost
# the token you created in the settings file of the cloud function
ENV DCDNS_TOKEN=<secretToken>
# the frequency in seconds to check for IP address changes
ENV DCDNS_FREQUENCY=300
# update ipv4 address
ENV DCDNS_IPV4=YES
# update ipv6 address
ENV DCDNS_IPV6=YES

WORKDIR /app

COPY requirements.txt .
COPY dynamic_cloud_dns_client.py .

RUN pip3 install -r requirements.txt

CMD ['python3', 'dynamic_cloud_dns_client.py']
