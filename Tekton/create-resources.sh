
oc create --save-config=true -f PVC/task-cache-pvc1.yaml 
oc create --save-config=true -f PVC/task-cache-pvc2.yaml 
oc create --save-config=true -f ServiceAccount/create-sa.yaml
oc adm policy add-scc-to-user privileged -z mvcdemo-pipeline-sa
oc adm policy add-role-to-user edit -z mvcdemo-pipeline-sa
oc create --save-config=true -f Secrets/quay-auth-secret.yaml
oc create --save-config=true -f Resources/Resource-App-GitSource.yaml 
oc create --save-config=true -f Resources/Resource-Image-stream.yaml 
oc create --save-config=true -f ClusterTasks/buildahNetCore.yaml 
oc create --save-config=true -f ClusterTasks/git-clone.yaml 
oc create --save-config=true -f Tasks/sonarqube-scanner.yaml 
oc create --save-config=true -f Tasks/report-code-analysis.yaml
oc create --save-config=true -f Tasks/pushImageToQuay.yaml 
oc create --save-config=true -f Tasks/ocProcessDeploymentTemplate.yaml 
oc create --save-config=true -f Pipeline/pipeline.yaml
oc create --save-config=true -f Pipeline/pipeline-run.yaml
