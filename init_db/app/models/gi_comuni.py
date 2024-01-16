from typing import Any
from dataclasses import dataclass

@dataclass
class City:
    codice_istat: str
    denominazione_ita_altra: str
    denominazione_ita: str
    denominazione_altra: str
    cap: str
    sigla_provincia: str
    denominazione_provincia: str
    tipologia_provincia: str
    codice_regione: str
    denominazione_regione: str
    tipologia_regione: str
    ripartizione_geografica: str
    flag_capoluogo: bool
    codice_belfiore: str
    lat: float
    lon: float
    superficie_kmq: float

    def to_firebase_obj(self):
        return {
            'name': self.denominazione_ita,
            'otherName': self.denominazione_ita_altra,
            'provinceName': self.denominazione_provincia,
            'provinceShortName': self.sigla_provincia,
            'regionName': self.denominazione_regione,
            'cap': self.cap,
            'lat': self.lat,
            'lon': self.lon,
        }

    @staticmethod
    def from_dict(obj: Any) -> 'City':
        _codice_istat = str(obj.get("codice_istat"))
        _denominazione_ita_altra = str(obj.get("denominazione_ita_altra"))
        _denominazione_ita = str(obj.get("denominazione_ita"))
        _denominazione_altra = str(obj.get("denominazione_altra"))
        _cap = str(obj.get("cap"))
        _sigla_provincia = str(obj.get("sigla_provincia"))
        _denominazione_provincia = str(obj.get("denominazione_provincia"))
        _tipologia_provincia = str(obj.get("tipologia_provincia"))
        _codice_regione = str(obj.get("codice_regione"))
        _denominazione_regione = str(obj.get("denominazione_regione")).split("/")[0]
        _tipologia_regione = str(obj.get("tipologia_regione"))
        _ripartizione_geografica = str(obj.get("ripartizione_geografica"))
        _flag_capoluogo = True if str(obj.get("flag_capoluogo")).lower() != "no" else False
        _codice_belfiore = str(obj.get("codice_belfiore"))
        _lat = float(str(obj.get("lat")))
        _lon = float(str(obj.get("lon")))
        _superficie_kmq = float(str(obj.get("superficie_kmq")))
        return City(_codice_istat, _denominazione_ita_altra, _denominazione_ita, _denominazione_altra, _cap, _sigla_provincia, _denominazione_provincia, _tipologia_provincia, _codice_regione, _denominazione_regione, _tipologia_regione, _ripartizione_geografica, _flag_capoluogo, _codice_belfiore, _lat, _lon, _superficie_kmq)

# Example Usage
# jsonstring = json.loads(myjsonstring)
# root = Root.from_dict(jsonstring)
