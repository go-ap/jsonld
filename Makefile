TEST := go test
TEST_FLAGS ?= -v
TEST_TARGET ?= ./...
GO111MODULE=on
PROJECT_NAME := $(shell basename $(PWD))

.PHONY: test coverage clean

test:
	$(TEST) $(TEST_FLAGS) $(TEST_TARGET)

coverage: TEST_TARGET := .
coverage: TEST_FLAGS += -covermode=count -coverprofile $(PROJECT_NAME).coverprofile
coverage: test

clean:
	$(RM) -v *.coverprofile

