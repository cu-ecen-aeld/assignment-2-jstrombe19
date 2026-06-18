#include <syslog.h>
#include <stdio.h>
#include <unistd.h>

/**
 * @brief 
 *  SYSLOG Entries
 * LOG_USER
 * LOG_DAEMON
 * LOG_LOCAL0 to LOG_LOCAL7
 * 
 * Priorities
 * LOG_ERR
 * LOG_WARNING
 * LOG_INFO
 * LOG_DEBUG
 */



int main(int argc, char* argv[]) {
    openlog(NULL, 0 ,LOG_USER);

    if (argc != 2) {
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
        return 1;
    }
        
    FILE *writefile = fopen(argv[0], "w");
    if (writefile == NULL) {
        syslog(LOG_ERR, "Failed to open file at provided path: %s", argv[0]);
        return 1;
    }
    syslog(LOG_DEBUG, "Writing %s to %s", argv[1], argv[0]);
    fwrite(argv[1], sizeof(argv[1]), 1, writefile);

}