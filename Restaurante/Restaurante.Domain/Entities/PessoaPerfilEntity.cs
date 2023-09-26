using Restaurante.Domain.Commons;
using Restaurante.Shared.Enuns;

namespace Restaurante.Domain.Entities;

public class PessoaPerfilEntity : Entity
{
    public string Descricao { get; private set; }
    public PessoaPerfilTipo Tipo { get; private set; }
}