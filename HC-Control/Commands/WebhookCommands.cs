using DSharpPlus.CommandsNext;
using DSharpPlus.CommandsNext.Attributes;
using DSharpPlus.Entities;
using System.Threading.Tasks;

namespace HC_Control.Commands
{
    class WebhookCommands : BaseCommandModule
    {

        [Command("notifyt"), RequirePrefixes("!")]
        public async Task Notify(CommandContext ctx, string info, ulong gid, ulong cid)
        {
            DiscordGuild guild = ctx.Guild;
            DiscordRole role = guild.GetRole(gid);
            DiscordChannel chan = guild.GetChannel(cid);
            await chan.SendMessageAsync($"Hello {role.Mention}. A new build seems to be on {info}. Please test!");
            await ctx.Message.DeleteAsync();
        }
    }
}
