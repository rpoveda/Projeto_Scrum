using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ML.Date;

namespace BL.Interface
{
    public interface IProjetoDAO : IBaseBL<projeto>
    {
        projeto incluiRetornaProjeto(projeto p);
    }
}
