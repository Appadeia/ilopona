/*
* Created 2019  Carson Black <uhhadd@gmail.com>
* 
* This is free and unencumbered software released into the public domain.
* 
* Anyone is free to copy, modify, publish, use, compile, sell, or
* distribute this software, either in source code form or as a compiled
* binary, for any purpose, commercial or non-commercial, and by any
* means.
* 
* In jurisdictions that recognize copyright laws, the author or authors
* of this software dedicate any and all copyright interest in the
* software to the public domain. We make this dedication for the benefit
* of the public at large and to the detriment of our heirs and
* successors. We intend this dedication to be an overt act of
* relinquishment in perpetuity of all present and future rights to this
* software under copyright law.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
* 
* For more information, please refer to <http://unlicense.org>
*/

namespace IloPona.Tests {

    /**
     * The {@code Testing} class is entry point for unit and UI testing for the application
     *
     * @since 1.0.0
     */
    public class Testing {
        public Testing (string[] args) {
            Test.init (ref args);

            // Example test
            Test.add_data_func ("/init", () => {
                Assert.string_compare ("Test", "Test");
                Assert.bool_compare (true, true);
                Assert.true (true);
                Assert.false (false);
                Assert.int_compare (5, 5);
                Assert.float_compare (5.2f, 6.4f, "!=");
                Assert.double_compare (8.8, 8.8, "<=");
            });
        }

        public void run () {
            Test.run ();
        }
    }
}
