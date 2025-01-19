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
        
        TASK_FILE="./tasks/tasks.json"
        ID_FILE="./files/task_id.txt"

        # Crear directorios si no existen
        if [[ ! -d "./tasks" ]]; then
            mkdir -p "./tasks"
            echo "Directory ./tasks created."
        fi

        if [[ ! -d "./files" ]]; then
            mkdir -p "./files"
            echo "Directory ./files created."
        fi

        # Verifica si el archivo JSON existe, si no, lo crea
        if [[ ! -f "$TASK_FILE" ]]; then
            echo '{"tasks": []}' > "$TASK_FILE"  # Crea un archivo con un objeto vacío si no existe
        fi

        # Generar y añadir la nueva tarea al array "tasks"
        jq --arg id "$id" \
           --arg description "$description" \
           --arg status "$status" \
           --arg createdAt "$current_date" \
           --arg updatedAt "$updatedAt" \
           '.tasks += [{"id": $id, "description": $description, "status": $status, "createdAt": $createdAt, "updatedAt": $updatedAt}]' \
           "$TASK_FILE" > "$TASK_FILE.temp" && mv "$TASK_FILE.temp" "$TASK_FILE" || { echo "Error al actualizar el archivo JSON"; exit 1; }
        
        echo "Added to tasks: $description"

    else 
        echo "ERROR: add: Missing argument"
        return 1
    fi
}

get_next_id(){
    ID_FILE="./files/task_id.txt"
    if [[ ! -f "$ID_FILE" ]]; then
        echo 1 > "$ID_FILE"  # Inicializa el contador de ID si no existe
    fi
    current_id=$(cat "$ID_FILE")
    next_id=$((current_id + 1))
    echo "$next_id" > "$ID_FILE"  # Guarda el próximo ID
    echo "$next_id"
}

# Start 
task_manager "$@"
