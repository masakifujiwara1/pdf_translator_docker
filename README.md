# pdf_translator_docker
[Index_PDF_Translation](https://github.com/Mega-Gorilla/Index_PDF_Translation.git)のためのDocker環境を提供します.  

## Prerequisites
- docker installed. [How to Install(ubuntu20.04)](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ja)
- nvidia-smi must be available (When using gpu). [How to Install(ubuntu20.04)](https://takake-blog.com/ubuntu-2004-install-nvidiacontainertoolkit/)

## Quick Start
### API Key Configuration
pdf_translator_docker/config/config.pyを開き，以下のDeepL_API_Keyを変更し，https://www.deepl.com/ja/your-account/keysより取得したDeepL API Keyを入力してください．また，DeepL API Proユーザーの場合，DeepL_URLをProAPI用URLに変更し保存してください．
```
DeepL_API_Key = "xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx:fx"
```
### Build
```
./build.sh
```
### Container launch
Run the docker container. Add the `--rm` option depending on the situation.  
※ If you do not want to save your changes, it is recommended to use the `--rm` option.
```
xhost +local:
./run.sh
cd Index_PDF_Translation
python manual_translate_pdf.py
```
## After the second
launch (Rename containers as necessary)
```
xhost +local:
docker start my-pdf
```
login
```
./login.sh
```
close (Rename containers as necessary)
```

docker stop my-pdf
```
## File sharing (host <---> docker)
The folder ~/pdf_translator_docker/docker_share on the host PC and the folder ~/host_files on docker are bind-mounted.  
You can communicate in both directions. However, if something in the folder is deleted, it will be reflected in both.
![Screenshot from 2023-10-14 21-36-14](https://github.com/masakifujiwara1/ros2_docker/assets/72371743/b3142be3-44d8-4581-b2b0-de0aa8658865)

host(pdf_translator_docker/input) <---> docker(~/Index_PDF_Translation/input) 

host(pdf_translator_docker/output) <---> docker(~/Index_PDF_Translation/output)

## Default config files
### .bashrc
setting pyenv

## Details of each branch
writing

## Docker tags on hub.docker.com

[dockerhub](https://hub.docker.com/repository/docker/masakifujiwara1/ros2/tags?page=1&ordering=last_updated)

## Related Projects
* https://github.com/masakifujiwara1/cudagl_docker.git
  * under maintenance
* https://github.com/masakifujiwara1/ros2_docker.git
  * under maintenance
* https://github.com/masakifujiwara1/cuda_docker.git
  * under maintenance

## License
BSD

## Tested on ...
- ubuntu 20.04 LTS

