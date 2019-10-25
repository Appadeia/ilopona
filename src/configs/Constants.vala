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

namespace IloPona.Configs {

    /**
     * The {@code Constants} class is responsible for defining all 
     * the constants used in the application.
     *
     * @since 1.0.0
     */
    public class Constants {
    
        public abstract const string ID = "com.github.Appadeia.ilopona";
        public abstract const string VERSION = "1.0.0";
        public abstract const string PROGRAME_NAME = "Ilo Pona";
        public abstract const string APP_YEARS = "2018";
        public abstract const string APP_ICON = "com.github.Appadeia.ilopona";
        public abstract const string ABOUT_COMMENTS = "The app for the language of good";
        public abstract const string TRANSLATOR_CREDITS = "Translators";
        public abstract const string MAIN_URL = "{{ website-url }}";
        public abstract const string BUG_URL = "{{ repo-url }}/issues";
        public abstract const string HELP_URL = "{{ repo-url }}/wiki";
        public abstract const string TRANSLATE_URL = "{{ repo-url }}";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE = "Website";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE_URL = "{{ website-url }}";
        public abstract const string URL_CSS = "/com/github/Appadeia/ilopona/css/style.css";
        public abstract const string [] ABOUT_AUTHORS = { "Carson Black <uhhadd@gmail.com>" };
        public abstract const Gtk.License ABOUT_LICENSE_TYPE = Gtk.License.UNKNOWN;
    }
}
