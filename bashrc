# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"
# kustomize completion
complete -C /usr/local/bin/kustomize kustomize
complete -C /usr/local/bin/vault vault

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/a3r/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

# showing all k8s resourses by namespace, use like k8s-get-resources my-namespace
alias k8s-get-res="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n "

PATH=$PATH:/Users/a3r/go/bin
