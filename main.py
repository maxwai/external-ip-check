from __future__ import annotations

from datetime import datetime

from ipify import get_ip
from ipify.exceptions import ConnectionError, ServiceError

last_known_ip_address_file_name: str = "./appdata/last_ip_address.log"
log_file_name: str = "./appdata/changes.log"

def main():
    old_ip: str | None = None
    try:
        with open(last_known_ip_address_file_name, 'r') as reader:
            old_ip = reader.readline()
    except IOError:
        pass
    try:
        ip: str = get_ip()
    except ConnectionError:
        # If you get here, it means you were unable to reach the ipify service,
        # most likely because of a network error on your end.
        print("Problem contacting IPify")
        return
    except ServiceError:
        # If you get here, it means ipify is having issues, so the request
        # couldn't be completed :(
        print("Problem with ipify")
        return

    if ip == old_ip:
        return

    with open(last_known_ip_address_file_name, 'w+') as writer:
        writer.write(ip)
        writer.flush()

    now: datetime = datetime.now()
    message: str = now.strftime("%Y-%m-%d %H:%M UTC") + " : New IP Address `" + ip + "`"
    print(message)
    with open(log_file_name, 'a+') as writer:
        writer.write(message + "\n")
        writer.flush()


if __name__ == '__main__':
    main()
