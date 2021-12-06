function get_cert() {
    openssl s_client -connect $1:443 -servername $1 2> /dev/null | openssl x509 -noout -dates -text
}
