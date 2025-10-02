## /home/sergio/git/Readme_RTP_PIPELINE/Readme_ERA5_monthly_pipeline
import cdsapi

print("cdsapi successfully imported!")
print("if no ModuleNotFoundError occurs, the installation was successful!.")

cds = cdsapi.Client()

cds.retrieve('reanalysis-era5-pressure-levels', {
    "variable": "t/q/o3",
    "pressure_level": "all",
    "product_type": "reanalysis",
    "date": "2024-09-01",
    "time": "all",
    "format": "netcdf"
}, '/asl/s1/sergio/JUNK/download_test.nc')

