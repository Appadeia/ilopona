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

using IloPona.Configs;
using IloPona.Widgets;

namespace IloPona.Views {

    /**
     * The {@code AppView} class.
     *
     * @since 1.0.0
     */
    public class AppView : Gtk.Box {

        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView () {
            var welcome_view = new Granite.Widgets.Welcome (_("Welcome"), _("Open up your editor to get started!"));
            welcome_view.append ("text-x-vala", _("Visit Valadoc"), _("The canonical source for Vala API references."));
            welcome_view.append ("distributor-logo", _("Visit elementary.io"), _("Read up on developing for elementary"));
            welcome_view.activated.connect ((index) => {
                switch (index) {
                    case 0:
                        try {
                            AppInfo.launch_default_for_uri ("https://valadoc.org/", null);
                        } catch (Error e) {
                            warning (e.message);
                        }
    
                        break;
                    case 1:
                        try {
                            AppInfo.launch_default_for_uri ("https://developer.elementary.io", null);
                        } catch (Error e) {
                            warning (e.message);
                        }
    
                        break;
                }
            });

            this.add (welcome_view);
        }
    }
}
