
alias ocpw='oc get pods -w | grep -v "Completed"'

function ocp { cmd='oc get pods | grep -v Completed'; echo $cmd; eval $cmd; }
export -f ocp

#-----------------------

function finddeploymentnames { d="$(oc get deployment | awk '/'$1'/ {print $1}')"; t="$(echo $d | gawk 'match($0, /(.*)-.*-.*/, a) {print a[1]}')";}
export -f finddeploymentnames

function oced { finddeploymentnames $1; echo "oc edit deployment $d"; oc edit deployment $d; }
export -f oced

#-----------------------

function findauthpolicynames { ap="$(oc get AuthorizationPolicy | awk '/'$1'/ {print $1}')"; t="$(echo $ap | gawk 'match($0, /(.*)-.*-.*/, a) {print a[1]}')";}
export -f findauthpolicynames

function oceap { findauthpolicynames $1; echo "oc edit AuthorizationPolicy $ap"; oc edit AuthorizationPolicy $ap; }
export -f oceap

#-----------------------

function findpodnames { p="$(ocp | awk '/'$1'/ {print $1}')"; t="$(echo $p | gawk 'match($0, /(.*)-.*-.*/, a) {print a[1]}')";}
export -f findpodnames

function ocl { findpodnames $1; echo "oc logs $p"; oc logs $p --all-containers; }
export -f ocl

function oclf { findpodnames $1; echo "oc logs $p -f"; oc logs $p -f; }
export -f oclf

function ocr { findpodnames $1; echo "oc rsh $p"; oc rsh $p; }
export -f ocr

function ocdp { findpodnames $1; echo "oc describe pod $p"; oc describe pod $p; }
export -f ocdp

#-----------------------

function findprojectnames { p="$(oc projects | awk '/'$1'/ {print $1}')"; t="$(echo $p | gawk 'match($0, /(.*)-.*-.*/, a) {print a[1]}')";}
export -f findprojectnames

function ocproj { findprojectnames $1; echo "oc project $p"; oc project $p; }
export -f ocproj

