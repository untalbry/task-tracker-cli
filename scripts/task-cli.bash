# Definition of functions
check_required_args() {
    if [[ $# -eq 0 ]]; then
        echo "ERROR: No arguments provided." >&2
        return 1
    fi
    # Call validate-command with the first argument (assumed to be the command)
    validate_command "$1"
}

validate_command(){
    if [[ $# -eq 0 ]]; then
        echo "ERROR: validate_command: No parameters provided " >&2
        return 1
    fi
    option=$1
    case "$option" in
        add|update|delete|mark-in-progress|mark-done|list)
            return 0
            ;;
        *)
            echo "ERROR: validate_command: Invalid option: $option" >&2
            return 1
            ;;
    esac
}

task_manager() {
    check_required_args "$@"  # Validate arguments first
    if [[ $? -eq 0 ]]; then
        # Proceed with the task logic if validation passed
        
    else
        echo "ERROR: task_manager: Invalid arguments"
        return 1
    fi
}

# Start 
task_manager "$@"
