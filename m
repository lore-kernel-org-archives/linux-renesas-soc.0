MIME-Version: 1.0
Date: Tue, 11 Dec 2018 09:58:05 +0100
References: <20181210210033.3276054-1-arnd@arndb.de>
In-Reply-To: <20181210210033.3276054-1-arnd@arndb.de>
Message-ID: <CAMuHMdV9Xp6J0oiYxYn+5SxmqnOLX78rTts2E7dmH4xzLe_KTg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: fix build regressions
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

On Mon, Dec 10, 2018 at 10:00 PM Arnd Bergmann <arnd@arndb.de> wrote:
> A number of Kconfig options have become available now to random ARM
> platforms outside of ARCH_MULTIPLATFORM, which now causes Kconfig
> warnings, and other build errors when those select options that
> lack additonal dependencies, e.g.:
>
> WARNING: unmet direct dependencies detected for HAVE_ARM_ARCH_TIMER
>   Depends on [n]: CPU_V7 [=n]
>   Selected by [y]:
>   - ARCH_RCAR_GEN2 [=y] && SOC_RENESAS [=y]
>   - ARCH_R8A73A4 [=y] && SOC_RENESAS [=y] && ARM [=y]
>
> WARNING: unmet direct dependencies detected for SYS_SUPPORTS_EM_STI
>   Depends on [n]: GENERIC_CLOCKEVENTS [=n]
>   Selected by [y]:
>   - ARCH_EMEV2 [=y] && SOC_RENESAS [=y] && ARM [=y]
>
> Put the old dependency on ARCH_RENESAS back for the moment to restore
> the previous behavior.
>
> Fixes: 062887bf5ef7 ("ARM: shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/renesas/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 4d8012e1205c..68bfca6f20dd 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -44,7 +44,7 @@ config ARCH_RZN1
>         bool
>         select ARM_AMBA
>
> -if ARM
> +if ARM && ARCH_RENESAS

After a closer look, I think restricting this from ARM to ARCH_MULTI_V7
should work, too (ARCH_MULTI_V7 selects CPU_V7, and ARCH_MULTIPLATFORM
selects GENERIC_CLOCKEVENTS).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
