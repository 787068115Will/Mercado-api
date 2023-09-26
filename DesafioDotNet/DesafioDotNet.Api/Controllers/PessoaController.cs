using DesafioDotNet.Application.Interfaces;
using DesafioDotNet.Shared.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace DesafioDotNet.Api.Controllers;

[ApiController]
[Route("api/pessoa")]
public class PessoaController : ControllerBase
{

    private readonly ILogger<PessoaController> _logger;
    private readonly IPessoaService _pessoaService;

    public PessoaController(ILogger<PessoaController> logger, IPessoaService pessoaService)
    {
        _logger = logger;
        _pessoaService = pessoaService;
    }

    [HttpGet]
    public async Task<IActionResult> Get() 
    {
        return Ok(await _pessoaService.ObterTodosAsync(null));
    }
    
    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(int id) 
    {
        return Ok(await _pessoaService.ObterPorIdAsync(id));
    }
    
    [HttpPost]
    public async Task<IActionResult>  CadastrarPessoa([FromBody] PessoaCadastroViewModel pessoa)
    {
        return Ok(await _pessoaService.CadastrarAsync(pessoa));
    }
}