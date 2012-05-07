using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using BL.Interface;
using ML.Date;
namespace BL
{
    public abstract class AbstractBL<T> : IBaseBL<T> where T : class
    {
        projeto_scrumEntities db = new projeto_scrumEntities();

        public IQueryable<T> listar()
        {
            return db.CreateObjectSet<T>();
        }

        public IQueryable<T> encontrar(Expression<Func<T, bool>> where)
        {
            return db.CreateObjectSet<T>().Where(where);
        }

        public bool incluir(T t)
        {
            try
            {
                db.AddObject(t.GetType().Name, t);
                SaveChanges();
                return true;
            }catch(Exception ex)
            {
                return false;
            }
        }

        public bool alterar(T t)
        {
            try
            {
                db.ApplyCurrentValues(t.GetType().Name, t);
                SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool excluir(T t)
        {
            try
            {
                db.DeleteObject(t);
                SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public void SaveChanges()
        {
            db.SaveChanges();
        }


        public void Attach(T t)
        {
            try
            {
                db.AttachTo(t.GetType().Name, t);
            }
            catch (Exception ex)
            {
            }
        }


        public void Detach(T t)
        {
            try
            {
                db.Detach(t);
            }
            catch (Exception)
            {

            }
        }

        public T obter(Expression<Func<T, bool>> where)
        {
            return db.CreateObjectSet<T>().Where(where).FirstOrDefault();
        }
    }
}
