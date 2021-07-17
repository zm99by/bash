awk '{if ($1 > 20) print $1}' testfile

cat /etc/passwd | awk -F ':' '{if ($3 > 500) print $1}'
or
{
FS=":"
if ($3 > 500) print $1
}
