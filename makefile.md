# Makefile tips

## Create targets at runtime by iterating over a list

```make
LIST = 0 1 2 3 4 5
define make-foo-target
foo$1:
	@echo "running target foo$1"
all:: foo$1
endef

$(foreach element,$(LIST),$(eval $(call make-foo-target,$(element))))
```

## Automatic help with annotations

Comment targets with `##`:

```make
build: ## build some stuff
	@echo "building..."

clean: ## clean your mess
	rm -rf build
```

Target comments/annotations are automatically parsed and presented with the following `help` target:

```make

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n\033[36m\033[0m\n"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: help
```

Result:
```
    $ make help
    build                          build some stuff
    clean                          clean your mess
```