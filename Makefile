.PHONY: all

all: obj libigl.a

debug: obj libigl.a

CPP_FILES=$(wildcard ./*.cpp)
OBJ_FILES=$(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

# optimized default settings
all: LFLAGS +=
all: CFLAGS += -O3 -DNDEBUG
debug: CFLAGS += -g

#LIB+=-framework OpenGL
#LIB+=-framework GLUT
#LIB+=-framework AppKit


obj: 
	mkdir -p obj

libigl.a: $(OBJ_FILES)
	rm -f $@
	ar cqs $@ $(OBJ_FILES)

obj/%.o: %.cpp
	g++ $(CFLAGS) -c -o $@ $< $(INC)

clean:
	rm -f obj/*.o
	rm -f libigl.a