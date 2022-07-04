using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vistas
{
    public static class VistasAux
    {
        public static string ValueOrDefault(object value, string def)
        {
            return value == null ? def : value.ToString();
        }

        public static string FitText(string text, int length)
        {
            string suffix = "[...]";
            if (text.Length > length)
            {
                text = text.Substring(0, length - suffix.Length);
                text += suffix;
            }
            return text;
        }
    }
}