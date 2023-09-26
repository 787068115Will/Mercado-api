using DesafioDotNet.Application.Interfaces;
using DesafioDotNet.Shared.Filters;
using DesafioDotNet.Shared.ViewModels;

namespace DesafioDotNet.Application.Services;

public class PessoaService :IPessoaService
{
    public PessoaService()
    {
        
    }

    public async Task<Guid> CadastrarAsync(PessoaCadastroViewModel pessoa)
    {
       
        return await Task.FromResult(Guid.NewGuid());
    }

    public async Task<PessoaViewModel> ObterPorIdAsync(int id)
    {
        return new PessoaViewModel()
        {
            Id = Guid.NewGuid(),
            Nome = "Teste"
        };
    }

    public async Task<IEnumerable<PessoaViewModel>> ObterTodosAsync(FiltroPessoa filtroPessoa)
    {
        return new List<PessoaViewModel>
        {
            new()
            {
                Id = Guid.NewGuid(),
                Nome = "Teste"
            }, 
            new()
            {
                Id = Guid.NewGuid(),
                Nome = "Teste 2"
            },
            new()
            {
                Id = Guid.NewGuid(),
                Nome = "Teste 3"
            }
        };
    }
}