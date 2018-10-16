using DSharpPlus.CommandsNext;
using DSharpPlus.CommandsNext.Attributes;
using DSharpPlus.Entities;
using System.Threading.Tasks;

namespace HC_Control.Commands
{
    class WebhookCommands : BaseCommandModule
    {

        [Command("notifyt"), RequirePrefixes("!"), RequireGuild()]
        public async Task Translate(CommandContext ctx, [RemainingText] string info = null)
        {
            DiscordGuild guild = ctx.Guild;
            DiscordRole role = guild.GetRole(499915116826066944);
            DiscordChannel chan = guild.GetChannel(499915455318982657);
            await chan.SendMessageAsync($"Hello {role.Mention}. A new build seems to exsist. Please test!", false, null);
            await ctx.Message.DeleteAsync();
        }
    }
}
