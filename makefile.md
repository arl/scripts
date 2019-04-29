# Makefile tips

## create targets at runtime by iterating over a list

    LIST = 0 1 2 3 4 5
    define make-my-target
    my$1:
        sh my_script$1.sh
    mys:: my$1
    endef

    $(foreach element,$(LIST),$(eval $(call make-my-target,$(element))))

## automatic help with annotations

Comment targets with `##`:

    build: ## build your mess
      @echo "building..."

    clean: ## clean your mess
      rm -rf build

'Annotations' are automatically parsed and presented with the following `help`
target:

    help:
      @grep -E '^[a-zA-Z_-.]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

Example:

    $ make help
    build                          build your mess
    clean                          clean your mess
