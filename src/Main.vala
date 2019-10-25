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

public class Main {
    private static bool testing = false;
    private static bool version = false;

    private const OptionEntry[] options = {
        { "version", 0, 0, OptionArg.NONE, ref version, "Display Version Number", null },
        { "run-tests", 0, 0, OptionArg.NONE, ref testing, "Run testing", null},
        { null }
    };

    /**
     * Main method. Responsible for starting the {@code Application} class.
     *
     * @see IloPona.Application
     * @return {@code int}
     * @since 1.0.0
     */
    public static int main (string [] args) {
        var options_context = new OptionContext (IloPona.Configs.Constants.PROGRAME_NAME +" "+ _("Options"));
        options_context.set_help_enabled (true);
        options_context.add_main_entries (options, null);

        try {
            options_context.parse (ref args);
        }
        catch (Error error) {}
        
        if (version) {
            stdout.printf (IloPona.Configs.Constants.PROGRAME_NAME +" "+ IloPona.Configs.Constants.VERSION + "\r\n");
            return 0;
        }

        if (testing) {
            Gtk.init (ref args);
            var testing = new IloPona.Tests.Testing (args);
            Idle.add (() => {
                testing.run ();
                Gtk.main_quit ();

                return false;
            });
            
            Gtk.main ();
        }
        else {
            var app = new IloPona.Application ();
            app.run (args);
        }

        return 0;
    }
}
