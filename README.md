This is a set of aliases to make it easier to perform common actions with the Openshift `oc` tool.

Commands:

ocp:                 oc get pods | grep -v Completed
ocpw:               oc get pods -w | grep -v Completed
oced 'string':    oc edit deployment (deployment name containing 'string')
ocl 'string':        oc logs (pod name containing 'string')
oclf 'string':       oc logs (pod name containing 'string') -f
ocr 'string'         oc rsh (pod name containing 'string')
ocdp 'string'      oc describe pod (pod name containing string')
ocproj 'string'    oc project (project name containing 'string')

Any command that locates a pod name will have the full pod name stored as $p for future use
Example:
`ocl asd` will pull search for a pod name containing `asd` like `zxcasdqwe`. The command will then be `oc logs zxcasdqwe` with the name `zxcasdqwe` stored as $p. This allows for fast follow on commands like `oc delete pod $p`
