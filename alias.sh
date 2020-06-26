alias nci='neuro_core_init'

neuro_core_init (){
    githubUrl="https://raw.githubusercontent.com/neuro-core/templates/master/"
    readmeFileName="readme-template.md"
    reportFileName="report-template.md"

    readmeUrl="$githubUrl""$readmeFileName"
    reportUrl="$githubUrl""$reportFileName"

    logo (){
        echo "Downloading logo"
        logoGithubPath="logo/neuro-core-logo"
        logoFileName=".png"

        if [[ -z "$1" ]]; then
            echo "Downloading default png logo"
        else
            case "$1" in
                mini)
                    echo "Downloading mini png logo"
                    logoFileName="-mini.png"
                    ;;
                gif)
                    echo "Downloading gif logo"
                    logoFileName=".gif"
                    ;;
                *)
            esac
        fi

        wget "$githubUrl""$logoGithubPath""$logoFileName"
    }

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
            l)
                logo ${2}
                ;;
            logo)
                logo ${2}
                ;;
            *)
                echo "Unknown task"
                usage
                exit 1
    esac
}
