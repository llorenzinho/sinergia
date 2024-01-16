import os.path as path
import json
from app.models.gi_comuni import City

from app.core.logger import Logger

data_path = path.join(path.dirname(__file__), "..", 'data', 'gi_comuni_cap.json')

def _load_data() -> [any]:
    with open(data_path, 'r') as f:
        return json.load(f)
    
def _cast_cities(data: [any]) -> [City]:
    return [City.from_dict(city) for city in data]

def _get_cities() -> [City]:
    return _cast_cities(_load_data())

def get_firestore_objects() -> [any]:
    Logger.get().info(f'Loading data from {data_path}')
    data = [city.to_firebase_obj() for city in _get_cities()]
    Logger.get().info(f'Loaded {len(data)} cities')
    return data