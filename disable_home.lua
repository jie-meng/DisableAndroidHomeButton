-- second step

local path = '/system/usr/keylayout'

os.execute('adb root')
os.execute('adb remount')

print()

util.pathRemoveAll('backup')
util.mkDir('backup')

local kls = util.findFilesInDir('./update', 'kl')
for _, v in ipairs(kls) do
    local _, name = util.splitPathname(v)
    os.execute(string.format('adb pull %s/%s backup/%s', path, name, name))
    os.execute(string.format('adb push update/%s %s', name, path))
    print('')
end

print('done.\n')