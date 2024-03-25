FROM bitnami/minideb:latest
LABEL maintainer="dl_csd-leads@harmonicinc.com"
RUN apt update && apt upgrade -y && apt install -y wget tmux python3 python3-pip vim && wget "https://github.com/tsduck/tsduck/releases/download/v3.37-3670/tsduck_3.37-3670.debian12_amd64.deb" && apt install -y ./tsduck_3.37-3670.debian12_amd64.deb && python3 -m pip  install requests nicegui argparse watchdog --break-system-packages
COPY ui-files/main.py /opt/fireui/main.py
EXPOSE 8080
CMD ["python3", "/opt/fireui/main.py"]
