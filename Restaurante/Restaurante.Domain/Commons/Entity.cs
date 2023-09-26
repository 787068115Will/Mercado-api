namespace Restaurante.Domain.Commons;

public abstract class Entity
{
    public virtual Guid Id { get; private set; }
}