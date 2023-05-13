#!/bin/bash

echo "127.0.0.1         localhost" > /etc/hosts
echo "127.0.1.1         debian" >> /etc/hosts
echo "192.168.89.161 kafka.hw6.lab kafka" >> /etc/hosts
echo "192.168.89.162 monitoring.hw6.lab monitoring" >> /etc/hosts