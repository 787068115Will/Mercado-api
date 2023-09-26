using Restaurante.Domain.Commons;

namespace Restaurante.Domain.Entities;

public class PessoaEntity : Entity
{
    public string Nome { get; private set; }
    public string Email { get; private set; }
}