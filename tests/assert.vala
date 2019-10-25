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
     * The {@code Assert} class contains various helper functions for testing assertions
     *
     * @since 1.0.0
     */
    public class Assert {

        public static void string_compare (string? expected, string? actual, string compare = "==") {
            switch (compare) {
                case "!=":
                    if (expected == actual) {
                        warning ("Expected '" + expected + "', got '" + actual +"'");
                        assert (expected != actual);
                    }
                    break;
                case "==":
                default:
                    if (expected != actual) {
                        warning ("Expected '" + expected + "' to not equal '" + actual +"'");
                        assert (expected == actual);
                    }
                    break;
            }
            
        }

        public static void bool_compare (bool? expected, bool? actual, string compare = "==") {
            switch (compare) {
                case "!=":
                    if (expected == actual) {
                        warning ("Expected '" + expected.to_string () + "', got '" + actual.to_string () +"'");
                        assert (expected != actual);
                    }
                    break;
                case "==":
                default:
                    if (expected != actual) {
                        warning ("Expected '" + expected.to_string () + "' to not equal '" + actual.to_string () +"'");
                        assert (expected == actual);
                    }
                    break;
            }
        }

        public static void int_compare (int? expected, int? actual, string compare = "==") {
            switch (compare) {
                case ">":
                    if (expected <= actual) {
                        warning (expected.to_string () + " is less than or equal to " + actual.to_string ());
                        assert (expected <= actual);
                    }
                    break;
                case ">=":
                    if (expected < actual) {
                        warning (expected.to_string () + " is less than " + actual.to_string ());
                        assert (expected < actual);
                    }
                    break;
                case "<":
                    if (expected >= actual) {
                        warning (expected.to_string () + " is greater than or equal to " + actual.to_string ());
                        assert (expected >= actual);
                    }
                    break;
                case "<=":
                    if (expected > actual) {
                        warning (expected.to_string () + " is greater than " + actual.to_string ());
                        assert (expected > actual);
                    }
                    break;
                case "!=":
                    if (expected == actual) {
                        warning (expected.to_string () + " is equal to " + actual.to_string ());
                        assert (expected != actual);
                    }
                    break;
                case "==":
                default:
                    if (expected != actual) {
                        warning (expected.to_string () + " is not equal to " + actual.to_string ());
                        assert (expected == actual);
                    }
                    break;
            }
        }

        public static void float_compare (float? expected, float? actual, string compare = "==") {
            switch (compare) {
                case ">":
                    if (expected <= actual) {
                        warning (expected.to_string () + " is less than or equal to " + actual.to_string ());
                        assert (expected <= actual);
                    }
                    break;
                case ">=":
                    if (expected < actual) {
                        warning (expected.to_string () + " is less than " + actual.to_string ());
                        assert (expected < actual);
                    }
                    break;
                case "<":
                    if (expected >= actual) {
                        warning (expected.to_string () + " is greater than or equal to " + actual.to_string ());
                        assert (expected >= actual);
                    }
                    break;
                case "<=":
                    if (expected > actual) {
                        warning (expected.to_string () + " is greater than " + actual.to_string ());
                        assert (expected > actual);
                    }
                    break;
                case "!=":
                    if (expected == actual) {
                        warning (expected.to_string () + " is equal to " + actual.to_string ());
                        assert (expected != actual);
                    }
                    break;
                case "==":
                default:
                    if (expected != actual) {
                        warning (expected.to_string () + " is not equal to " + actual.to_string ());
                        assert (expected == actual);
                    }
                    break;
            }
        }

        public static void double_compare (double? expected, double? actual, string compare = "==") {
            switch (compare) {
                case ">":
                    if (expected <= actual) {
                        warning (expected.to_string () + " is less than or equal to " + actual.to_string ());
                        assert (expected <= actual);
                    }
                    break;
                case ">=":
                    if (expected < actual) {
                        warning (expected.to_string () + " is less than " + actual.to_string ());
                        assert (expected < actual);
                    }
                    break;
                case "<":
                    if (expected >= actual) {
                        warning (expected.to_string () + " is greater than or equal to " + actual.to_string ());
                        assert (expected >= actual);
                    }
                    break;
                case "<=":
                    if (expected > actual) {
                        warning (expected.to_string () + " is greater than " + actual.to_string ());
                        assert (expected > actual);
                    }
                    break;
                case "!=":
                    if (expected == actual) {
                        warning (expected.to_string () + " is equal to " + actual.to_string ());
                        assert (expected != actual);
                    }
                    break;
                case "==":
                default:
                    if (expected != actual) {
                        warning (expected.to_string () + " is not equal to " + actual.to_string ());
                        assert (expected == actual);
                    }
                    break;
            }
        }

        public static void true (bool? expected) {
            if (expected != true) {
                warning ("Expected '" + expected.to_string () + "' to be true");
            }

            assert (expected == true);
        }

        public static void false (bool? expected) {
            if (expected != false) {
                warning ("Expected '" + expected.to_string () + "' to be false");
            }

            assert (expected == false);
        }
    }
}
