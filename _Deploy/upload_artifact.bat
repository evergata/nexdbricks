rem $env:WORKSPACEPATH='/Users/enrico.vergata@st.com/'
rem $env:BUILDPATH="C:\Dev\git\nexdbricks\Builds\"

rem databricks workspace import_dir "C:\Dev\git\nexdbricks\Builds\Workspace" "/Users/enrico.vergata@st.com/"
databricks workspace import_dir ${BUILDPATH}Workspace /${WORKSPACEPATH} 

dbfs cp -r ${BUILDPATH}/Libraries/python ${DBFSPATH}