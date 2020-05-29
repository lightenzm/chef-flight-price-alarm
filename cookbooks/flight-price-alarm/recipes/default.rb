package 'awscli'
bash 'download and extract app tar' do
    code <<-EOH
    export AWS_ACCESS_KEY_ID=
    export AWS_SECRET_ACCESS_KEY=
    export AWS_DEFAULT_REGION=eu-west-1   
    aws s3 cp s3://flightpricealarm/flight_price_alarm.tar.gz /tmp/flight_price_alarm.tar.gz
    rm -rf /opt/flights
    mkdir /opt/flights
    tar -zxvf /tmp/flight_price_alarm.tar.gz -C /opt/flights
    rm -rf /tmp/flight_price_alarm.tar.gz
    EOH
end

bash 'install dependencies and run application' do
    code <<-EOH
    sudo apt install -y python3-pip
    cd /opt/flights/flight_price_alarm
    pip3 install -r /opt/flights/flight_price_alarm/requirements.txt
    python3 /opt/flights/flight_price_alarm/flightPriceAlarmServer.py
    EOH
end

# s3_file "/home/zohar/file" do
#     remote_path "/flight_price_alarm.tar.gz"
#     bucket "flightpricealarm"
#     action :create
#     aws_access_key_id ''
#     aws_secret_access_key ''
# end
