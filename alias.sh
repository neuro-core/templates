alias nci='neuro_core_init'

neuro_core_init (){
    githubUrl="https://raw.githubusercontent.com/neuro-core/templates/master/"
    readmeFileName="readme-template.md"
    reportFileName="report-template.md"

    readmeUrl="$githubUrl""$readmeFileName"
    reportUrl="$githubUrl""$reportFileName"

    readme (){
        echo "Creating readme template"
        wget -O ${1} ${readmeUrl}
    }

    report (){
        echo "Creating report template"
        wget -O ${1} ${reportUrl}
    }

    usage (){
        echo "Usage: $0 {d|readme|r|report}"
    }

    # we have no file argument
    if [[ -z "$1" ]]; then
        echo "No task"
        usage
        exit 1
    fi

    # we have new output filename
    if [[ -z "$2" ]]; then
        echo "Use default template name"
    else
        readmeFileName=$2
        reportFileName=$2
    fi

    case "$1" in
            d)
                readme ${readmeFileName}
                ;;
            readme)
                readme ${readmeFileName}
                ;;
            r)
                report ${reportFileName}
                ;;
            report)
                report ${reportFileName}
                ;;
            *)
                echo "Unknown task"
                usage
                exit 1
    esac
}
