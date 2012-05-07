using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace BL.Interface
{
    public interface IBaseBL<T>
    {
        IQueryable<T> listar();
        IQueryable<T> encontrar(Expression<Func<T, bool>> where);
        T obter(Expression<Func<T, bool>> where);
        bool incluir(T t);
        bool alterar(T t);
        bool excluir(T t);
        void SaveChanges();
        void Attach(T t);
        void Detach(T t);
    }
}
