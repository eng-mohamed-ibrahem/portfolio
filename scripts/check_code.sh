#!/bin/bash

echo "Running comprehensive code checks..."

# Function to run all checks
run_checks() {
    local format_only=false
    local analyze_only=false
    local test_only=false
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -f|--format)
                format_only=true
                shift
                ;;
            -a|--analyze)
                analyze_only=true
                shift
                ;;
            -t|--test)
                test_only=true
                shift
                ;;
            *)
                echo "Unknown option: $1"
                echo "Usage: $0 [-f|--format] [-a|--analyze] [-t|--test]"
                exit 1
                ;;
        esac
    done
    
    # If no specific option was provided, run all checks
    if [ "$format_only" = false ] && [ "$analyze_only" = false ] && [ "$test_only" = false ]; then
        format_only=false
        analyze_only=false
        test_only=false
    fi
    
    # Check formatting
    if [ "$format_only" = true ] || [ "$format_only" = false ]; then
        echo "Checking code formatting..."
        if flutter format --set-exit-if-changed .; then
            echo "✓ Formatting is correct"
        else
            echo "✗ Formatting issues detected. Running auto-fix..."
            flutter format .
            echo "✓ Formatting fixed"
        fi
    fi
    
    # Run analyzer
    if [ "$analyze_only" = true ] || [ "$analyze_only" = false ]; then
        echo "Running analyzer..."
        if flutter analyze; then
            echo "✓ Analyzer passed"
        else
            echo "✗ Analyzer found issues"
            exit 1
        fi
    fi
    
    # Run tests
    if [ "$test_only" = true ] || [ "$test_only" = false ]; then
        echo "Running tests..."
        if flutter test; then
            echo "✓ All tests passed"
        else
            echo "✗ Tests failed"
            exit 1
        fi
    fi
}

# Display usage info if requested
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: $0 [-f|--format] [-a|--analyze] [-t|--test]"
    echo "Run comprehensive code quality checks for the Flutter project"
    echo ""
    echo "Options:"
    echo "  -f, --format    Run only the formatter"
    echo "  -a, --analyze   Run only the analyzer"
    echo "  -t, --test      Run only the tests"
    echo "  -h, --help      Show this help message"
    echo ""
    echo "If no option is specified, all checks will be run."
    exit 0
fi

# Run the checks
run_checks "$@"
echo "All checks completed successfully!"

