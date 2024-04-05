# gh-repo-modules-9
## Part 5: Modules (gh repo) challenge

### The Task

1. Create sample terraform code using each of the requirements.
2. Upload to github repo and make sure to create/update README.md file.
3. Code should be simple, tested and working

### Requirements: 

**9.  sample repo - create 1 module, use module twice and set modules in different regions: once done, save the link**


In the current repo the code represents the creation of an infrastructure which is located in two regions - **London (eu-west-2)** and **Frankfurt (eu-central-1)**. Each region has one EC2 instance, one SNS topic and one CloudWatch alarm for CPUUtilization, which is associated with the corresponding instance. For the creation of both CloudWatch alarms, I have used the same module located in *./modules/cloud-watch-alarms-module*.