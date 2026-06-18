#include <syslog.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

/**
 * @brief C implementation of writing string to a file given each at runtime
 * 
 * @param argc 
 * @param argv 
 * @return int 
 */


int main(int argc, char* argv[]) {
    openlog(NULL, 0 ,LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
        return 1;
    }
        
    FILE *writefile = fopen(argv[1], "w");
    if (writefile == NULL) {
        syslog(LOG_ERR, "Failed to open file at provided path: %s", argv[1]);
        return 1;
    }
    syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
    fwrite(argv[2], strlen(argv[2]), 1, writefile);

}