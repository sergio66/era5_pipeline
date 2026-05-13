addpath /umbc/rs/pi_sergio/WorkDirDec2025/matlabcode/
addpath /umbc/rs/pi_sergio/WorkDirDec2025/matlabcode/PLOTTER/
addpath /umbc/rs/pi_sergio/WorkDirDec2025/matlabcode/COLORMAP/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
[sergio@chip-login2 era5_pipeline]$ ls -lt /umbc/rs/strow/asl/ERA5_monthly/2024/*rad*
-rw-rw-r-- 1 sergio   pi_sergio  71870170 Oct  1  2025 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-10_rad.nc
-rw-rw-r-- 1 sergio   pi_sergio  72172445 Oct  1  2025 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-09_rad.nc
-rw-rw-r-- 1 sergio   pi_strow   70367492 Feb 20  2025 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-12_rad.nc
-rw-rw-r-- 1 sergio   pi_strow   70919379 Feb 20  2025 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-11_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Sep  9  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-08_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Sep  6  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-07_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Aug 16  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-06_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Aug 16  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-05_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Aug 16  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-04_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Aug 16  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-03_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Aug 16  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-02_rad.nc
-rw-rw---- 1 sbuczko1 pi_strow  132906440 Aug 16  2024 /umbc/rs/strow/asl/ERA5_monthly/2024/2024-01_rad.nc
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{

a0 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-08_rad.nc');
a1 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-10_rad.nc');

a0 =
    longitude: [1440x1 single]
     latitude: [721x1 single]
         time: [8x1 int32]
    mtnswrfcs: [1440x721x8 double]
    mtnlwrfcs: [1440x721x8 double]
    msnswrfcs: [1440x721x8 double]
    msnlwrfcs: [1440x721x8 double]
      msnswrf: [1440x721x8 double]
      msnlwrf: [1440x721x8 double]
      mtnswrf: [1440x721x8 double]
      mtnlwrf: [1440x721x8 double]

>> a1
          number: 0
      valid_time: [8x1 int64]
        latitude: [721x1 double]
       longitude: [1440x1 double]
          expver: [8x1 string]
    avg_tnswrfcs: [1440x721x8 double]
    avg_tnlwrfcs: [1440x721x8 double]
    avg_snswrfcs: [1440x721x8 double]
    avg_snlwrfcs: [1440x721x8 double]
      avg_snswrf: [1440x721x8 double]
      avg_snlwrf: [1440x721x8 double]
      avg_tnswrf: [1440x721x8 double]
      avg_tnlwrf: [1440x721x8 double]
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
So look at /home/sergio/git/rtpmake/CLUST_RTPMAKE

[sergio@chip-login2 CLUST_RTPMAKE]$ grep -in mtnlwrf */*.m
GRIB/grib_interpolate_era5.m:119:    F.olr.ig     = griddedInterpolant(iX,iY,flipud(single(ncread(fn_olr,'mtnlwrf',[1 1 hindex],[Inf Inf 1]))'),'linear');
GRIB/grib_interpolate_era5.m:120:    F.olr_clr.ig = griddedInterpolant(iX,iY,flipud(single(ncread(fn_olr,'mtnlwrfcs',[1 1 hindex],[Inf Inf 1]))'),'linear');

[sergio@chip-login2 CLUST_RTPMAKE]$ grep -in msnlwrf */*.m
GRIB/grib_interpolate_era5.m:121:    F.ilr.ig     = griddedInterpolant(iX,iY,flipud(single(ncread(fn_olr,'msnlwrf',[1 1 hindex],[Inf Inf 1]))'),'linear');
GRIB/grib_interpolate_era5.m:122:    F.ilr_clr.ig = griddedInterpolant(iX,iY,flipud(single(ncread(fn_olr,'msnlwrfcs',[1 1 hindex],[Inf Inf 1]))'),'linear');

[sergio@chip-login2 CLUST_RTPMAKE]$  grep -in mtnlwrfcs */*.m
GRIB/grib_interpolate_era5.m:120:    F.olr_clr.ig = griddedInterpolant(iX,iY,flipud(single(ncread(fn_olr,'mtnlwrfcs',[1 1 hindex],[Inf Inf 1]))'),'linear');

[sergio@chip-login2 CLUST_RTPMAKE]$  grep -in msnlwrfcs */*.m
GRIB/grib_interpolate_era5.m:122:    F.ilr_clr.ig = griddedInterpolant(iX,iY,flipud(single(ncread(fn_olr,'msnlwrfcs',[1 1 hindex],[Inf Inf 1]))'),'linear');
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%a0 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-08_rad.nc');
%a1 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-10_rad.nc');
%s0 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-08_sfc.nc');  %% JJA  summer NH
%s1 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-10_sfc.nc');  %% DJN  winter NH

ncdump -hs /umbc/rs/strow/asl/ERA5_monthly/2024/2024-07_rad.nc | grep -in deflate

a0 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-07_rad.nc');  %% JJA  summer NH
a1 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2025/2025-02_rad.nc');  %% DJN  winter NH
s0 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2024/2024-07_sfc.nc');  %% JJA  summer NH
s1 = read_netcdf_lls('/umbc/rs/strow/asl/ERA5_monthly/2025/2025-02_sfc.nc');  %% DJN  winter NH

the variable formerly known as mtnlwrf   (Mean top net long-wave radiation flux)                has been renamed to avg_tnlwrf
the variable formerly known as mtnlwrfcs (Mean top net Long-wave radiation flux, CLear Sky)     has been renamed to avg_tnlwrfcs
the variable formerly known as msnlwrf   (Mean surface net long-wave radiation flux)            has been renamed to avg_snlwrf
the variable formerly known as msnlwrfcs (Mean Surface Net Long-Wave Radiation Flux, Clear Sky) has been renamed to avg_snlwrfcs

%%%%%%%%%%%%%%%%%%%%%%%%%

%% skt, no need for -ve signs
figure(4); imagesc(squeeze(s0.skt(:,:,1))');    colormap(jet); colorbar; cx = caxis;
figure(5); imagesc(squeeze(s1.skt(:,:,1))'); colormap(jet); colorbar; caxis(cx);
figure(6); imagesc(squeeze(s0.skt(:,:,1))'-squeeze(s1.skt(:,:,1))'); colormap(usa2); colorbar; caxis([-1 +1]*20);

%%%%%%%%%%%%%%%%%%%%%%%%%

%% Mean top net long-wave radiation flux, I hate -ve signs so I have -blah
figure(1); imagesc(-squeeze(a0.mtnlwrf(:,:,1))');    colormap(jet); colorbar; cx = caxis;
figure(2); imagesc(-squeeze(a1.avg_tnlwrf(:,:,1))'); colormap(jet); colorbar; caxis(cx);
figure(3); imagesc(squeeze(a0.mtnlwrf(:,:,1))'-squeeze(a1.avg_tnlwrf(:,:,1))'); colormap(usa2); colorbar; caxis([-1 +1]*20);

%% Mean Top Net Long-Wave Radiation Flux, Clear Sky, I hate -ve signs so I have -blah
figure(1); imagesc(-squeeze(a0.mtnlwrfcs(:,:,1))');    colormap(jet); colorbar; cx = caxis;
figure(2); imagesc(-squeeze(a1.avg_tnlwrfcs(:,:,1))'); colormap(jet); colorbar; caxis(cx);
figure(3); imagesc(squeeze(a0.mtnlwrfcs(:,:,1))'-squeeze(a1.avg_tnlwrfcs(:,:,1))'); colormap(usa2); colorbar; caxis([-1 +1]*20);

%% Mean Mean surface net long-wave radiation flux, I hate -ve signs so I have -blah
figure(1); imagesc(-squeeze(a0.msnlwrf(:,:,1))');    colormap(jet); colorbar; cx = caxis;
figure(2); imagesc(-squeeze(a1.avg_snlwrf(:,:,1))'); colormap(jet); colorbar; caxis(cx);
figure(3); imagesc(squeeze(a0.msnlwrf(:,:,1))'-squeeze(a1.avg_snlwrf(:,:,1))'); colormap(usa2); colorbar; caxis([-1 +1]*20);

%% Mean Mean surface net long-wave radiation flux, Clear Sky, I hate -ve signs so I have -blah
figure(1); imagesc(-squeeze(a0.msnlwrfcs(:,:,1))');    colormap(jet); colorbar; cx = caxis;
figure(2); imagesc(-squeeze(a1.avg_snlwrfcs(:,:,1))'); colormap(jet); colorbar; caxis(cx);
figure(3); imagesc(squeeze(a0.msnlwrfcs(:,:,1))'-squeeze(a1.avg_snlwrfcs(:,:,1))'); colormap(usa2); colorbar; caxis([-1 +1]*20);

