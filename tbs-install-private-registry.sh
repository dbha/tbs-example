ytt -f /home/ubuntu/TBS/bundle/values.yaml \
    -f /home/ubuntu/TBS/bundle/config/ \
    -f /home/ubuntu/TBS/lab.pksdemo.net.crt \
      -v kp_default_repository='harbor.lab.pksdemo.net/tanzu/tbs' \
      -v kp_default_repository_username='xxxxx' \
      -v kp_default_repository_password='xxxxx' \
      -v pull_from_kp_default_repo=true \
      -v tanzunet_username='xxxxx' \
      -v tanzunet_password='xxxxx' \
	| kbld -f /home/ubuntu/TBS/bundle/.imgpkg/images.yml -f- \
	| kapp deploy -a tanzu-build-service -f- -y