from socket import socket, AF_INET, SOCK_DGRAM

maxsize = 4096

sock = socket(AF_INET,SOCK_DGRAM)
sock.bind(('0.0.0.0',5010))

print('Server is Active')

while True:    
    data, addr = sock.recvfrom(maxsize)
    print(data)


