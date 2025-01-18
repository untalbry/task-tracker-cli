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
                add "$@"
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
add(){
    if [[ $# -eq 2 ]]; then
        description=$2
        id=$(get_next_id)
        status="todo"
        current_date=$(date "+%Y-%m-%d")
        updatedAt=$(date "+%Y-%m-%d")
        echo "adding to tasks: $description"
    else 
        echo "ERROR: add: Missing argument"
        return 1
    fi
}
get_next_id(){
    current_id=$(cat "$ID_FILE")
    next_id=$((current_id + 1))
    echo "$next_id" > "$ID_FILE"
    echo "$next_id"  
}

ID_FILE="./files/task_id.txt"
if [[ ! -f "$ID_FILE" ]]; then
    echo 1 > "$ID_FILE"
fi
# Start 
task_manager "$@"
