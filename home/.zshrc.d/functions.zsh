function tx() {
  tmuxifier load-session $1
}

function replace-discovery-token() {
  DISCOVERY_TOKEN=`curl -s https://discovery.etcd.io/new` && perl -p -e "s@#discovery: https://discovery.etcd.io/<token>@discovery: $DISCOVERY_TOKEN@g" user-data.sample > user-data
}

function boot2docker-shellinit() {
  $(boot2docker shellinit 2> /dev/null)
}

autoload tx
autoload etcdtoken
