@rem  1. 首次下载已经存在的项目 git clone https://github.com/用户名/仓库名   
@rem  2. 上传文件到一个新项目 ， 首先 在GitHub新建一个仓库  ，然后执行 1.  ，再把文件拷贝到 1.所创建的文件夹  ， up.bat 也要放进去，cd 切换那个路径下 执行 ./up.bat  就好了！！！

if "%gitUser%"=="" (set gitUser=1525113309)
if "%gitMail%"=="" (set gitMail=1712520508@qq.com)
@rem 更换用户名 需要在 【凭据管理器】》【Windows】 中删除原来的
for %%a in ("%cd%") do set gitRepo=%%~nxa

git pull origin master
@rem 如果没有国内git加速，需要改为 origin

if not defined wspath (set wspath=G:\QGB\babun\cygwin\home\qgb\wshell\)
if "%*"=="" (for /f "delims=" %%i in ('%wspath%datetime.bat') do set commit_msg=%%i ) else (set commit_msg=%*)
if "%commit_msg%"=="" (set commit_msg="default up")


git config --global user.email %gitMail%
git config --global user.name %gitUser%


git config --global http.sslverify "false"
git config --global core.filemode false
git config --global credential.helper store

git remote add q https://github.com/%gitUser%/%gitRepo%
git remote add cq https://coding.net/u/%gitUser%/p/%gitRepo%/git/
git add -A
git commit -m "%commit_msg%"
git push cq master 
git push q master 