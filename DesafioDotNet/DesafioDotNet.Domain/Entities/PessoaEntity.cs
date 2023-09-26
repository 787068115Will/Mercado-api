using DesafioDotNet.Domain.Commons;

namespace DesafioDotNet.Domain.Entities;

public class PessoaEntity : EntityBase<Guid>
{
    public string Nome { get; set; }
}