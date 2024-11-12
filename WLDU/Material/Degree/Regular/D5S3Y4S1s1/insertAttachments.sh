sqlite3 schedule.db "select pk_slip,title from Slip"
echo -n "====> Enter slip id: "
read slip
echo
echo

sqlite3 schedule.db "select pk_Schedule, shortNote from ScheduleModel ;"
echo -n "====> Enter schedule id: "
read schedule
echo
echo

sqlite3 schedule.db "select pk_FileInfo,name from FileInfo;"
echo -n "====> Enter FileInfo id: "
read fileInfo
echo
echo

sqlite3 schedule.db "select pk_FileType,name  from FileType ;"
echo -n "====> Enter FileType id: "
read fileType
echo
echo


read fileName
echo
echo

setUp() {
hash=$1
}

setUp $(sha1sum "${fileName}")

sqlite3 schedule.db "INSERT INTO FILES(pk_Slip,pk_FileInfo,pk_FileType,name,hash) VALUES (${slip},${fileInfo},${fileType},'${fileName}','${hash}')"

mv "${fileName}" ${hash}
