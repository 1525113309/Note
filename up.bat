@rem  1. �״������Ѿ����ڵ���Ŀ git clone https://github.com/�û���/�ֿ���   
@rem  2. �ϴ��ļ���һ������Ŀ �� ���� ��GitHub�½�һ���ֿ�  ��Ȼ��ִ�� 1.  ���ٰ��ļ������� 1.���������ļ���  �� up.bat ҲҪ�Ž�ȥ��cd �л��Ǹ�·���� ִ�� ./up.bat  �ͺ��ˣ�����

if "%gitUser%"=="" (set gitUser=1525113309)
if "%gitMail%"=="" (set gitMail=1712520508@qq.com)
@rem �����û��� ��Ҫ�� ��ƾ�ݹ�����������Windows�� ��ɾ��ԭ����
for %%a in ("%cd%") do set gitRepo=%%~nxa

git pull origin master
@rem ���û�й���git���٣���Ҫ��Ϊ origin

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