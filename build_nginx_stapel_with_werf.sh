type multiwerf && source <(multiwerf use 1.0 beta)
werf version; pwd; set -x
werf stages build --stages-storage :local nginx/stapel