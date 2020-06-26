alias nci='neuro_core_init'

neuro_core_init (){
    readmeUrl="https://raw.githubusercontent.com/neuro-core/templates/master/readme-template.md"
    reportUrl="https://raw.githubusercontent.com/neuro-core/templates/master/report-template.md"

    readme (){
        echo "creating readme template"
        wget ${readmeUrl}
    }

    report (){
        echo "creating report template"
        wget ${reportUrl}
    }

    case "$1" in
            d)
                readme
                ;;

            readme)
                readme
                ;;

            r)
                report
                ;;
            report)
                report
                ;;
            *)
                echo $"Usage: $0 {d|readme|r|report}"
                exit 1
    esac
}
