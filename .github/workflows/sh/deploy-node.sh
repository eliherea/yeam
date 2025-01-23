# Amazon Linux 2023 - tested
#!/bin/bash -xe
cd /home/ec2-user
cat <<EOF > configure-runner.sh
#!/bin/bash -xe
cd /home/ec2-user
sudo yum update -y
sudo yum install dotnet-sdk-6.0 -y
sudo yum install -y curl --allowerasing
sudo yum install -y curl --skip-broken
sudo yum install -y curl
sudo mkdir -p actions-runner
sudo chmod -R 777 actions-runner
cd actions-runner
sudo curl -o actions-runner-linux-x64-2.321.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.321.0/actions-runner-linux-x64-2.321.0.tar.gz
sudo tar xzf ./actions-runner-linux-x64-2.321.0.tar.gz || { echo "Extraction failed"; exit 1; }
sudo chmod -R 777 /home/ec2-user/actions-runner
sudo -u ec2-user ./config.sh --url https://github.com/dihkaw/showipserverwithnodejs --token TokenRunnerAnda --name NamaRunnerAnda --unattended
sudo ./svc.sh install
sudo ./svc.sh start
EOF
sudo chmod +x /home/ec2-user/configure-runner.sh
sudo ./configure-runner.sh 
