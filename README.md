# fix\_package\_installer

解放米兔4.4.4系的手表原生包安装器。  
无法使用的原生包安装器中的安装器activity中的onResume方法直接调用finish()终止安装，然而3c中的PackageInstaller是正常的。本模块使用3c的PackageInstaller以达到修复原生包安装器的效果。
