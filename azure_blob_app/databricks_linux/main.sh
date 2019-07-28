#!/bin/bash
echo "prateek";
apt-get -y install git;
apt-get -y install python3-pip;
pip3 install wheel;
pip3 install databricks-cli;
apt-get -y install expect;
apt-get -y install jq ;
git clone https://github.com/Prateekagarwal9/supplychain;
chmod +x supplychain;
echo Celebal;
expect creds.sh $1 $2;
# sudo databricks workspace import  -f DBC -l SCALA supplychain/ARIMA.dbc /ARIMA;
# sudo databricks workspace import  -f DBC -l SCALA supplychain/Prophet.dbc /Prophet;
# sudo databricks workspace import  -f DBC -l SCALA supplychain/Holt-Winter /Holt-Winter;
databricks workspace import  -f DBC -l SCALA supplychain/Supply-Chain-Solution.dbc /Supply-Chain-Solution;
databricks fs mkdirs dbfs:/databricks/init/$3/;
databricks fs cp arima_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp prophet_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp holtwinter_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp lstm_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp xgboost_installation.sh dbfs:/databricks/init/$3/;
databricks fs cp or_installation.sh dbfs:/databricks/init/$3/;

runid=$(databricks jobs create --json-file arima.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
databricks jobs run-now --job-id $runidnew;

runid=$(databricks jobs create --json-file prophet.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
databricks jobs run-now --job-id $runidnew;


runid=$(databricks jobs create --json-file holtwinter.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
databricks jobs run-now --job-id $runidnew;

runid=$(databricks jobs create --json-file xgboost.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
databricks jobs run-now --job-id $runidnew;

runid=$(databricks jobs create --json-file lstm.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
databricks jobs run-now --job-id $runidnew;

runid=$(databricks jobs create --json-file or.json);
echo $runid;
runidnew=$(echo $runid | jq -r '.job_id');
echo $runidnew;
databricks jobs run-now --job-id $runidnew;





#sudo databricks libraries install --maven-coordinates "com.microsoft.azure:azure-eventhubs-spark_2.11:2.3.10" --cluster-id $runidnew
