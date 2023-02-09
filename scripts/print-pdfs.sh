#!/usr/bin/env bash

PYTHON="invalid"
PYTHON_HTTP_PORT=8081
DOC_URL="https://github.com/3mdeb/remark-templates#readme"

usage() {
    echo "print-pdfs.sh [FILES]..."
    echo "Pass list of files to print only these specific files"
    echo "Pass list of directories to search for HTMLs"
    echo "Refer to the $DOC_URL for usage documentation"
    echo ""
    echo "Examples:"
    echo "Search recursively for .html files in current directory and print them all:"
    echo "./remark-templates/scripts/print-pdfs.sh ."
    echo ""
    echo "Print only specific files:"
    echo "./remark-templates/scripts/print-pdfs.sh project_a/01_tpm_usage_design.html \\"
    echo "  project_b/01_watchdog_integration.html"
    echo ""
    echo "Print everything from \"training_x\" and \"training_y\" subdirectories:"
    echo "./remark-templates/scripts/print-pdfs.sh training_x training_y"
    exit 0
}

error_check() {
    _error_code=$?
    if [ $_error_code -ne 0 ]; then
        echo "$1 : $_error_code"
        exit 1
    fi
}

check_dependencies() {
    echo "Checking for docker..."
    which docker &> /dev/null
    error_check "docker must be available in PATH - install it first"
    echo "docker available"

    echo "Checking for python3..."
    which python3 &> /dev/null
    if [ $? -ne 0  ]; then
        echo "python3 not available, checking for python ..."
        which python &> /dev/null
        error_check "python3 or python must be available in PATH - install it first"
        PYTHON="python"
        echo "python available"
    else
        PYTHON="python3"
        echo "python3 available"
    fi
}

build_file_list() {
    readarray -d '' file_list < <(find . -path ./remark-templates -prune -o -name '*.html' -print0)
    local _htmls_no=${#file_list[*]}
    if [ $_htmls_no -eq 0 ]; then
        echo "No HTML files found in the PWD or subdirectories"
        exit 1
    fi
}

check_html_files() {
    echo "Checking HTML files..."

    # verify all HTML files listed in $file_list
    for i in ${!file_list[*]}; do
        _html_file=${file_list[$i]}
        cat $_html_file | grep '<title>' | grep '</title>' &> /dev/null
        error_check "Tag \"<title>TITLE</title>\" not found in the $_html_file"
    done

    echo "HTML files verified"
}


start_http_server() {
    echo "Starting HTTP server..."
    case $PYTHON in
        "python3")
            $PYTHON -m http.server $PYTHON_HTTP_PORT &> /dev/null &
            PYTHON_PID=$!
            ;;
        "python")
            $PYTHON -m SimpleHTTPServer $PYTHON_HTTP_PORT &> /dev/null &
            PYTHON_PID=$!
            ;;
        *)
            echo "Invalid PYTHON"
            exit 1
            ;;
    esac

    # verify whether the HTTP server process was started
    sleep 1
    kill -0 $! &> /dev/null
    error_check "Failed to start python HTTP server. Maybe the port \
$PYTHON_HTTP_PORT is in use (another python HTTP server instance runnning)?"

    echo "HTTP server started"
}

stop_http_server() {
    echo "Stopping HTTP server..."
    if [ -z $PYTHON_PID ]; then
        echo "PYTHON_PID not set"
        exit 1
    fi
    kill -9 $PYTHON_PID
    echo "HTTP server stopped"
}

build_docker_image() {
    local _image=$(docker images | grep -E 'chrome-headless-pdf-maker(.*)latest')
    if [ -z "${_image}" ]; then
        echo "Building docker image"
        (
            cd remark-templates/scripts/
            docker build -t chrome-headless-pdf-maker -f chrome-headless-pdf-maker.dockerfile .
        )
    else
        echo "Docker image already built"
    fi
}

print_single_pdf() {
    local _input_file=$1
    local _out_dir=$2
    local _out_file_name=$3

    docker run --rm -it \
        --privileged \
        -u $(id -u):$(id -g) \
        -v $_out_dir:/out:rw \
        --net=host \
        chrome-headless-pdf-maker \
        --prefer-css-page-size \
        --url http://127.0.0.1:$PYTHON_HTTP_PORT/$_input_file \
        --pdf /out/$_out_file_name
    error_check "Printing PDF from $_input_file failed"
}

check_dependencies
if [ $# -ne 0 ]; then
    _search_path=()

    for file in "$@"; do
        [ -e $file ]
        error_check "$file not found"

        _search_path+=($file)
    done
else
    usage
fi

file_list=()
for i in ${!_search_path[*]}; do
    if [ -f $_search_path[$i] ]; then
        file_list+=($_search_path[$i])
    else
        readarray -d '' file_list_temp < <(find ${_search_path[$i]} -path ./remark-templates -prune -o -name '*.html' -print0)
        file_list+=(${file_list_temp[*]})
    fi
done

_htmls_no=${#file_list[*]}
if [ $_htmls_no -eq 0 ]; then
    echo "No HTML files found in specified directories"
    exit 1
fi

check_html_files
build_docker_image

out_dir="pdf"
mkdir -p $out_dir

# stop python HTTP server on Ctrl+c
trap stop_http_server INT

start_http_server

# process all found HTML files, excluding the ones from remark-templates
# subdirectory
for i in ${!file_list[*]}; do
    html_file=${file_list[$i]}
    echo "Processing $html_file"

    # parse <title> tag from the HTML file
    title="$(grep -oPm1 "(?<=<title>)[^<]+" $html_file)"
    # replace space (or multiple spaces) with a single underscores
    title="$(sed "s/ \+/_/g" <<< "$title")"
    file_name="${title}.pdf"
    pdf_file="${out_dir}/${file_name}"
    print_single_pdf $html_file $(readlink -f $out_dir) $file_name
    echo "Printed $pdf_file"
done

stop_http_server
