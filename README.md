Metasploit
==========


* [auxiliary/server/openssl_altchainsforgery_mitm_proxy](https://www.rapid7.com/db/modules/auxiliary/server/openssl_altchainsforgery_mitm_proxy)  
  This module exploits a logic error in OpenSSL by impersonating the server and sending a specially-crafted chain of certificates, resulting in certain checks on untrusted certificates to be bypassed on the client, allowing it to use a valid leaf certificate as a CA certificate to sign a fake certificate. The SSL/TLS session is then proxied to the server allowing the session to continue normally and application data transmitted between the peers to be saved. The valid leaf certificate must not contain the keyUsage extension or it must have at least the keyCertSign bit set (see X509_check_issued function in crypto/x509v3/v3_purp.c); otherwise; X509_verify_cert fails with X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY. This module requires an active man-in-the-middle attack.

* [auxiliary/server/jsse_skiptls_mitm_proxy](https://www.rapid7.com/db/modules/auxiliary/server/jsse_skiptls_mitm_proxy)  
  This module exploits an incomplete internal state distinction in Java Secure Socket Extension (JSSE) by impersonating the server and finishing the handshake before the peers have authenticated themselves and instantiated negotiated security parameters, resulting in a plaintext SSL/TLS session with the client. This plaintext SSL/TLS session is then proxied to the server using a second SSL/TLS session from the proxy to the server (or an alternate fake server) allowing the session to continue normally and plaintext application data transmitted between the peers to be saved. This module requires an active man-in-the-middle attack.

* [auxiliary/server/dhclient_bash_env](https://www.rapid7.com/db/modules/auxiliary/server/dhclient_bash_env)  
  This module exploits the Shellshock vulnerability, a flaw in how the Bash shell handles external environment variables. This module targets dhclient by responding to DHCP requests with a malicious hostname, domainname, and URL which are then passed to the configuration scripts as environment variables, resulting in code execution.

* [auxiliary/admin/http/katello_satellite_priv_esc](https://www.rapid7.com/db/modules/auxiliary/admin/http/katello_satellite_priv_esc)  
  This module exploits a missing authorization vulnerability in the "update_roles" action of "users" controller of Katello and Red Hat Satellite (Katello 1.5.0-14 and earlier) by changing the specified account to an administrator account.

* [exploit/linux/http/cfme_manageiq_evm_upload_exec](https://www.rapid7.com/db/modules/exploit/linux/http/cfme_manageiq_evm_upload_exec)  
  This module exploits a path traversal vulnerability in the "linuxpkgs" action of "agent" controller of the Red Hat CloudForms Management Engine 5.1 (ManageIQ Enterprise Virtualization Manager 5.0 and earlier). It uploads a fake controller to the controllers directory of the Rails application with the encoded payload as an action and sends a request to this action to execute the payload. Optionally, it can also upload a routing file containing a route to the action. (Which is not necessary, since the application already contains a general default route.)

* [auxiliary/admin/http/cfme_manageiq_evm_pass_reset](https://www.rapid7.com/db/modules/auxiliary/admin/http/cfme_manageiq_evm_pass_reset)  
  This module exploits a SQL injection vulnerability in the "explorer" action of "miq_policy" controller of the Red Hat CloudForms Management Engine 5.1 (ManageIQ Enterprise Virtualization Manager 5.0 and earlier) by changing the password of the target account to the specified password.

* [auxiliary/admin/http/foreman_openstack_satellite_priv_esc](https://www.rapid7.com/db/modules/auxiliary/admin/http/foreman_openstack_satellite_priv_esc)  
  This module exploits a mass assignment vulnerability in the 'create' action of 'users' controller of Foreman and Red Hat OpenStack/Satellite (Foreman 1.2.0-RC1 and earlier) by creating an arbitrary administrator account. For this exploit to work, your account must have 'create_users' permission (e.g., Manager role).

* [exploit/linux/http/foreman_openstack_satellite_code_exec](https://www.rapid7.com/db/modules/exploit/linux/http/foreman_openstack_satellite_code_exec)  
  This module exploits a code injection vulnerability in the 'create' action of 'bookmarks' controller of Foreman and Red Hat OpenStack/Satellite (Foreman 1.2.0-RC1 and earlier).

* [auxiliary/scanner/snmp/aix_version](https://www.rapid7.com/db/modules/auxiliary/scanner/snmp/aix_version)  
  AIX SNMP Scanner Auxiliary Module

* [exploit/aix/rpc_ttdbserverd_realpath](https://www.rapid7.com/db/modules/exploit/aix/rpc_ttdbserverd_realpath)  
  This module exploits a buffer overflow vulnerability in _tt_internal_realpath function of the ToolTalk database server (rpc.ttdbserverd).

* [payload/aix/ppc/shell_reverse_tcp](https://www.rapid7.com/db/modules/payload/aix/ppc/shell_reverse_tcp)  
  Connect back to attacker and spawn a command shell

* [payload/aix/ppc/shell_find_port](https://www.rapid7.com/db/modules/payload/aix/ppc/shell_find_port)  
  Spawn a shell on an established connection

* [payload/aix/ppc/shell_bind_tcp](https://www.rapid7.com/db/modules/payload/aix/ppc/shell_bind_tcp)  
  Listen for a connection and spawn a command shell

* [payload/linux/ppc64/shell_reverse_tcp](https://www.rapid7.com/db/modules/payload/linux/ppc64/shell_reverse_tcp)  
  Connect back to attacker and spawn a command shell

* [payload/linux/ppc64/shell_find_port](https://www.rapid7.com/db/modules/payload/linux/ppc64/shell_find_port)  
  Spawn a shell on an established connection

* [payload/linux/ppc64/shell_bind_tcp](https://www.rapid7.com/db/modules/payload/linux/ppc64/shell_bind_tcp)  
  Listen for a connection and spawn a command shell

* [payload/linux/ppc/shell_reverse_tcp](https://www.rapid7.com/db/modules/payload/linux/ppc/shell_reverse_tcp)  
  Connect back to attacker and spawn a command shell

* [payload/linux/ppc/shell_find_port](https://www.rapid7.com/db/modules/payload/linux/ppc/shell_find_port)  
  Spawn a shell on an established connection

* [payload/linux/ppc/shell_bind_tcp](https://www.rapid7.com/db/modules/payload/linux/ppc/shell_bind_tcp)  
  Listen for a connection and spawn a command shell

* [exploit/linux/samba/lsa_transnames_heap](https://www.rapid7.com/db/modules/exploit/linux/samba/lsa_transnames_heap)  
  This module triggers a heap overflow in the LSA RPC service of the Samba daemon. This module uses the TALLOC chunk overwrite method (credit Ramon and Adriano), which only works with Samba versions 3.0.21-3.0.24. Additionally, this module will not work when the Samba "log level" parameter is higher than "2".

* [payload/linux/x86/shell_reverse_tcp](https://www.rapid7.com/db/modules/payload/linux/x86/shell_reverse_tcp)  
  Connect back to attacker and spawn a command shell

* [payload/linux/x86/shell_find_port](https://www.rapid7.com/db/modules/payload/linux/x86/shell_find_port)  
  Spawn a shell on an established connection

* [exploit/solaris/sunrpc/sadmind_adm_build_path](https://www.rapid7.com/db/modules/exploit/solaris/sunrpc/sadmind_adm_build_path)  
  This module exploits a buffer overflow vulnerability in adm_build_path() function of sadmind daemon. The distributed system administration daemon (sadmind) is the daemon used by Solstice AdminSuite applications to perform distributed system administration operations. The sadmind daemon is started automatically by the inetd daemon whenever a request to invoke an operation is received. The sadmind daemon process continues to run for 15 minutes after the last request is completed, unless a different idle-time is specified with the -i command line option. The sadmind daemon may be started independently from the command line, for example, at system boot time. In this case, the -i option has no effect; sadmind continues to run, even if there are no active requests.

* [auxiliary/scanner/misc/ib_service_mgr_info](https://www.rapid7.com/db/modules/auxiliary/scanner/misc/ib_service_mgr_info)  
  This module retrieves version of the services manager, version and implementation of the InterBase server from InterBase Services Manager.

* [exploit/windows/misc/ib_svc_attach](https://www.rapid7.com/db/modules/exploit/windows/misc/ib_svc_attach)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted service attach request.

* [exploit/windows/misc/ib_isc_create_database](https://www.rapid7.com/db/modules/exploit/windows/misc/ib_isc_create_database)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted create request.

* [exploit/windows/misc/ib_isc_attach_database](https://www.rapid7.com/db/modules/exploit/windows/misc/ib_isc_attach_database)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted attach request.

* [exploit/windows/misc/fb_svc_attach](https://www.rapid7.com/db/modules/exploit/windows/misc/fb_svc_attach)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted service attach request.

* [exploit/windows/misc/fb_isc_create_database](https://www.rapid7.com/db/modules/exploit/windows/misc/fb_isc_create_database)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted create request.

* [exploit/windows/misc/fb_isc_attach_database](https://www.rapid7.com/db/modules/exploit/windows/misc/fb_isc_attach_database)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted create request.

* [exploit/linux/misc/ib_pwd_db_aliased](https://www.rapid7.com/db/modules/exploit/linux/misc/ib_pwd_db_aliased)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted attach request.

* [exploit/linux/misc/ib_open_marker_file](https://www.rapid7.com/db/modules/exploit/linux/misc/ib_open_marker_file)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted attach request.

* [exploit/linux/misc/ib_jrd8_create_database](https://www.rapid7.com/db/modules/exploit/linux/misc/ib_jrd8_create_database)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted create request.

* [exploit/linux/misc/ib_inet_connect](https://www.rapid7.com/db/modules/exploit/linux/misc/ib_inet_connect)  
  This module exploits a stack buffer overflow in Borland InterBase by sending a specially crafted service attach request.

* [payload/linux/x86/shell_bind_tcp](https://www.rapid7.com/db/modules/payload/linux/x86/shell_bind_tcp)  
  Listen for a connection and spawn a command shell

* [payload/bsd/x86/shell_reverse_tcp](https://www.rapid7.com/db/modules/payload/bsd/x86/shell_reverse_tcp)  
  Connect back to attacker and spawn a command shell

* [payload/bsd/x86/shell_find_port](https://www.rapid7.com/db/modules/payload/bsd/x86/shell_find_port)  
  Spawn a shell on an established connection

* [payload/bsd/x86/shell_bind_tcp](https://www.rapid7.com/db/modules/payload/bsd/x86/shell_bind_tcp)  
  Listen for a connection and spawn a command shell

* [exploit/solaris/samba/lsa_transnames_heap](https://www.rapid7.com/db/modules/exploit/solaris/samba/lsa_transnames_heap)  
  This module triggers a heap overflow in the LSA RPC service of the Samba daemon. This module uses the TALLOC chunk overwrite method (credit Ramon and Adriano), which only works with Samba versions 3.0.21-3.0.24. Additionally, this module will not work when the Samba "log level" parameter is higher than "2".

* [payload/solaris/x86/shell_reverse_tcp](https://www.rapid7.com/db/modules/payload/solaris/x86/shell_reverse_tcp)  
  Connect back to attacker and spawn a command shell

* [payload/solaris/x86/shell_find_port](https://www.rapid7.com/db/modules/payload/solaris/x86/shell_find_port)  
  Spawn a shell on an established connection

* [payload/solaris/x86/shell_bind_tcp](https://www.rapid7.com/db/modules/payload/solaris/x86/shell_bind_tcp)  
  Listen for a connection and spawn a command shell

* [payload/osx/x86/shell_reverse_tcp](https://www.rapid7.com/db/modules/payload/osx/x86/shell_reverse_tcp)  
  Connect back to attacker and spawn a command shell

* [payload/osx/x86/shell_find_port](https://www.rapid7.com/db/modules/payload/osx/x86/shell_find_port)  
  Spawn a shell on an established connection

* [exploit/osx/samba/lsa_transnames_heap](https://www.rapid7.com/db/modules/exploit/osx/samba/lsa_transnames_heap)  
  This module triggers a heap overflow in the LSA RPC service of the Samba daemon. This module uses the szone_free() to overwrite the size() or free() pointer in initial_malloc_zones structure.

* [payload/osx/x86/shell_bind_tcp](https://www.rapid7.com/db/modules/payload/osx/x86/shell_bind_tcp)  
  Listen for a connection and spawn a command shell

