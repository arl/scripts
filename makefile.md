# Makefile tips

## create targets at runtime by iterating over a list

    LIST = 0 1 2 3 4 5
    define make-my-target
    my$1:
        sh my_script$1.sh
    mys:: my$1
    endef

    $(foreach element,$(LIST),$(eval $(call make-my-target,$(element))))
