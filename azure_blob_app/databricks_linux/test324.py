import sys
databricks_instance = sys.argv[1]
databricks_token = sys.argv[2]
clusters_name = "test"
holtwinter = {
  "name": "SparkPi Python job",
  "new_cluster": {
  	"name":clusters_name,
    "spark_version": "5.4.x-conda-scala2.11",
    "node_type_id": "Standard_DS3_v2",
    "num_workers": 1,

    "init_scripts": [
    {
      "dbfs": {
        "destination": "dbfs:/databricks/init/"+clusters_name+"/holtwinter_installation.sh"
      }
    }
  ]
  },
  "notebook_task": {
    "notebook_path": "/Supply-Chain-Solution/3. Holt-Winter"
  }
}


arima = {
  "name": "SparkPi Python job",
  "new_cluster": {
        "name":clusters_name,
    "spark_version": "5.2.x-scala2.11",
    "node_type_id": "Standard_DS3_v2",
    "num_workers": 1,

    "init_scripts": [
    {
      "dbfs": {
        "destination": "dbfs:/databricks/init/"+clusters_name+"/arima_installation.sh"
      }
    }
  ]
  },
  "notebook_task": {
    "notebook_path": "/Supply-Chain-Solution/1. ARIMA"
  }
}


prophet = {
  "name": "SparkPi Python job",
  "new_cluster": {
  	"name":clusters_name,
    "spark_version": "5.4.x-conda-scala2.11",
    "node_type_id": "Standard_DS3_v2",
    "num_workers": 1,
    "init_scripts": [
    {
      "dbfs": {
        "destination": "dbfs:/databricks/init/"+clusters_name+"/prophet_installation.sh"
      }
    }
  ]
  },
  "notebook_task": {
    "notebook_path": "/Supply-Chain-Solution/2. Prophet"
  }
}

lstm = {
  "name": "SparkPi Python job",
  "new_cluster": {
  	"name":clusters_name,
    "spark_version": "5.4.x-conda-scala2.11",
    "node_type_id": "Standard_DS3_v2",
    "num_workers": 1,
    "init_scripts": [
    {
      "dbfs": {
        "destination": "dbfs:/databricks/init/"+clusters_name+"/lstm_installation.sh"
      }
    }
  ]
  },
  "notebook_task": {
    "notebook_path": "/Supply-Chain-Solution/4. LSTM"
  }
}


xgboost = {
  "name": "SparkPi Python job",
  "new_cluster": {
  	"name":clusters_name,
    "spark_version": "5.4.x-conda-scala2.11",
    "node_type_id": "Standard_DS3_v2",
    "num_workers": 1,
    "init_scripts": [
    {
      "dbfs": {
        "destination": "dbfs:/databricks/init/"+clusters_name+"/xgboost_installation.sh"
      }
    }
  ]
  },
  "notebook_task": {
    "notebook_path": "/Supply-Chain-Solution/5. XgBoost"
  }
}


operational_research = {
  "name": "SparkPi Python job",
  "new_cluster": {
  	"name":clusters_name,
    "spark_version": "5.4.x-conda-scala2.11",
    "node_type_id": "Standard_DS3_v2",
    "num_workers": 1,
    "init_scripts": [
    {
      "dbfs": {
        "destination": "dbfs:/databricks/init/"+clusters_name+"/or_installation.sh"
      }
    }
  ]
  },
  "notebook_task": {
    "notebook_path": "/Supply-Chain-Solution/6. OR"
  }
}

print(databricks_instance, databricks_token)
import json
import subprocess
import os

with open('arima.json', 'w') as fp:
    json.dump(arima, fp)

with open('holtwinter.json', 'w') as fp:
    json.dump(holtwinter, fp)

with open('prophet.json', 'w') as fp:
    json.dump(prophet, fp)

with open('xgboost.json', 'w') as fp:
    json.dump(xgboost, fp)

with open('lstm.json', 'w') as fp:
    json.dump(lstm, fp)

with open('or.json', 'w') as fp:
    json.dump(operational_research, fp)


os.system("sudo bash main.sh {} {} {}".format(databricks_instance,databricks_token,clusters_name))
