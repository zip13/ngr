# ar_gtp_client.py
# GTPv1U test client
# 
# (c) Copyright 2018 Aigbe Research

from ts.ts29281_lte_gtpv1_u import * # 3GPP TS 29.281 LTE GTPv1 User Plane
import socket

gtp_peer = GTPv1()

HOST = socket.gethostbyname(socket.gethostname())
PORT = gtp_peer.port_number

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # UDP Transport
s.connect((HOST, PORT))

# Test 1: Send EchoRequest Message
# Send raw binary over the UDP socket
data = bytearray.fromhex('320100040000000000000000')
s.sendto(data, (HOST, PORT))

# Should receive an EchoResponse + Recovery IE: 0
received = s.recv(1024)

print "Sent:     {}".format(data)
print "Received: {}".format(received)

s.close()



