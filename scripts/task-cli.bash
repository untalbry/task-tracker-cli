# Definition of functions
check_required_args() {
    if [[ $# -eq 0 ]]; then
        echo "ERROR: No arguments provided." >&2
        return 1
    fi
}

task_manager() {
    check_required_args "$@"  # Validate arguments first
    
    if [[ $? -eq 0 ]]; then
        # Proceed with the task logic if validation passed
        option=$1
        
        case "$option" in
            "add")
                # TODO: Handle add logic here
                echo "Adding task..."
                ;;
            "update")
                # TODO: Handle update logic here
                echo "Updating task..."
                ;;
            "delete")
                # TODO: Handle delete logic here
                echo "Deleting task..."
                ;;
            *)
                echo "ERROR: Invalid option: $option"
                return 1
                ;;
        esac
    else
        echo "ERROR: task_manager: Invalid arguments"
        return 1
    fi
}

# Start 
task_manager "$@"
