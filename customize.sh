SKIPUNZIP=1

if [ "$API" != '19' ] || [ "$ARCH" != 'arm' ]; then
  abort '! Only kitkat arm32 devices supported'
fi

unzip -o "$ZIPFILE" 'dexopt-wrapper' 'module.prop' -d "$TMPDIR" >&2 || abort '! Unable to extract zip file!'

set_perm "$TMPDIR/dexopt-wrapper" 0 0 0755
ui_print '- Dexopt PackageInstaller'
$TMPDIR/dexopt-wrapper "$ZIPFILE" "$TMPDIR/PackageInstaller.odex" >&2 || abort '! Failed to dexopt'

mkdir -p $MODPATH/system/app
cp $TMPDIR/PackageInstaller.odex $MODPATH/system/app/
cp $TMPDIR/module.prop $MODPATH/
set_perm_recursive "$MODPATH" 0 0 0755 0644
