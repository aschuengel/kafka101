from datetime import datetime
import json
from kafka import KafkaProducer


def main():
    producer = KafkaProducer(bootstrap_servers='localhost:29092')
    print(producer.bootstrap_connected())
    for i in range(100):
        future = producer.send(topic='test',
                               key=str(i % 2).encode('utf-8'),
                               value=json.dumps({
                                   'type': 'test',
                                   'timestamp': str(datetime.now()),
                                   'message': f'Some message'
                               }).encode('utf-8'))
        future.get(timeout=60)


main()
