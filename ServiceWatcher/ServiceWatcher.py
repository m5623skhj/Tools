import win32serviceutil
import win32service
import time
import sys
import os
import win32com.shell.shell as shell

def main():
    if sys.argv[-1] != 'asadmin':
        script = os.path.abspath(sys.argv[0])
        params = ' '.join([script] + sys.argv[1:] + ['asadmin'])
        shell.ShellExecuteEx(lpVerb='runas', lpFile=sys.executable, lpParameters=params)

    serviceList = ['DBServer Service']
    
    while True:
        try:
            for service in serviceList:
                if win32serviceutil.QueryServiceStatus(service)[1] == win32service.SERVICE_RUNNING:
                    continue
                
                print(f"Service {service} is not running")
                win32serviceutil.RestartService(service)
                print(f"Service {service} is restarted")
    
        except Exception as e:
            print(f"Error occurred: {e}")
            
        time.sleep(5)
    
if __name__ == "__main__":
    main()