#!/bin/bash
echo "prateek";
sudo apt-get -y install python3-pip;
sudo python3 -m pip  install wheel;
sudo python3 -m pip install databricks-cli;
sudo apt-get -y install expect;
sudo apt-get -y install jq ;
sudo git clone https://github.com/Prateekagarwal9/supplychain;
sudo chmod +x supplychain;
echo Celebal;
sudo expect creds.sh $1 $2;
# sudo databricks workspace import  -f DBC -l SCALA supplychain/ARIMA.dbc /ARIMA;
# sudo databricks workspace import  -f DBC -l SCALA supplychain/Prophet.dbc /Prophet;
# sudo databricks workspace import  -f DBC -l SCALA supplychain/Holt-Winter /Holt-Winter;
databricks workspace import  -f DBC -l SCALA supplychain/Supply-Chain-Solution.dbc /Supply-Chain-Solution;
sudo databricks fs mkdirs dbfs:/databricks/init/$3/;
databricks fs cp arima_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp prophet_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp holtwinter_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp lstm_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp xgboost_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp or_installation.sh dbfs:/databricks/init/$3/;

runid=$(sudo databricks jobs create --json-file arima.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
sudo databricks jobs run-now --job-id $runidnew;

runid=$(sudo databricks jobs create --json-file prophet.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
sudo databricks jobs run-now --job-id $runidnew;


runid=$(sudo databricks jobs create --json-file holtwinter.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
sudo databricks jobs run-now --job-id $runidnew;

runid=$(sudo databricks jobs create --json-file xgboost.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
sudo databricks jobs run-now --job-id $runidnew;

runid=$(sudo databricks jobs create --json-file lstm.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
sudo databricks jobs run-now --job-id $runidnew;

runid=$(sudo databricks jobs create --json-file or.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
sudo databricks jobs run-now --job-id $runidnew;





#sudo databricks libraries install --maven-coordinates "com.microsoft.azure:azure-eventhubs-spark_2.11:2.3.10" --cluster-id $runidnew
