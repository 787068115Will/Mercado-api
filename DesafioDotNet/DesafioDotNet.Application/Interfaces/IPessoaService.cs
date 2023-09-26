using DesafioDotNet.Shared.Filters;
using DesafioDotNet.Shared.ViewModels;

namespace DesafioDotNet.Application.Interfaces;

public interface IPessoaService
{
    Task<Guid> CadastrarAsync(PessoaCadastroViewModel pessoa);
    Task<PessoaViewModel> ObterPorIdAsync(int id);
    Task<IEnumerable<PessoaViewModel>> ObterTodosAsync(FiltroPessoa filtroPessoa);
}