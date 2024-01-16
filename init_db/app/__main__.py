# This is intended to be run from the command line 
# to initialize the database with the cities data.

import os
import sys
from app.core.logger import Logger
from tqdm import tqdm

import firebase_admin
from firebase_admin import credentials, firestore

import iso3166_2 as iso

import app.core.parser as parse

if __name__ == '__main__':

    firestore_objs = parse.get_firestore_objects()
    italy = iso.country['IT']

    # provinces = {v['name']: k for k, v in filter(
    #     lambda y: 'region' not in y[1]['type'].lower() or y[1]['parentCode'] is not None, italy.items())}
 
    regions = {v['name'].lower(): k for k, v in filter(
        lambda y: 'region' in y[1]['type'].lower() and y[1]['parentCode'] is None, italy.items())}
    if "val d'aoste" in regions.keys():
        regions["valle d'aosta"] = regions.pop("val d'aoste")
    if "friuli venezia giulia" in regions.keys():
        regions["friuli-venezia giulia"] = regions.pop("friuli venezia giulia")

    cred = credentials.Certificate("sa.json")
    firebase_admin.initialize_app(cred)
    db = firestore.client()
    # batch = db.batch()

    collection_ref = db.collection('cities')

    
    Logger.get().info('Merging data with ISO3166-2 codes and committing to Firestore')
    for city in tqdm(firestore_objs, desc='Uploading cities', total=len(firestore_objs)):
        try:
            region = city['regionName'].lower()
            region_code = regions[region]
        except KeyError:
            Logger.get().warning(f'Region {region} not found in ISO3166-2')
            sys.exit(1)
            
        city['regionCode'] = regions[region]

        city_ref = collection_ref.document(city['name'].lower())
        city_ref.set(city)
        # batch.set(city_ref, city)

    Logger.get().info('Starting data upload')
    # batch.commit()
    Logger.get().info('Data upload completed, exiting')
    sys.exit(0)

    
    