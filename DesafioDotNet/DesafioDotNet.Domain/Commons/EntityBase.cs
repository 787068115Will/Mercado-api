namespace DesafioDotNet.Domain.Commons;

public abstract class EntityBase<T>
{
    public virtual T Id { get; set; }
}