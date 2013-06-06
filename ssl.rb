#!/usr/bin/env ruby
require "socket"
require "openssl"

tcp_socket = TCPSocket.new(ARGV[0], 443)

ssl_socket = OpenSSL::SSL::SSLSocket.new(tcp_socket)

ssl_socket.connect

certificate = ssl_socket.peer_cert

puts certificate.not_after
