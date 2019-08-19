type multiwerf && source <(multiwerf use 1.0 beta)
werf version; pwd; set -x
werf run --stages-storage :local --docker-options='--rm -d -p 8080:80 --name werf-example-repo-stapel-image-custom-entrypoint --entrypoint /init' nginx/stapel