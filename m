Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1484898012-15234-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1484898012-15234-1-git-send-email-arvind.yadav.cs@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jan 2017 09:14:31 +0100
Message-ID: <CAMuHMdVmweX49ztfz3xqGL-oYipk_amuCix-yn-XNMgBL5Tkrg@mail.gmail.com>
Subject: Re: [PATCH v1] soc: renesas: rcar-sysc:- Prevent resource leake and
 NULL-pointer error
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arvind,

On Fri, Jan 20, 2017 at 8:40 AM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
> If rcar_sysc_pd_init will fail, Handle ERROR properly.
>  -Release memory
>  -Unmap I/O memory from kernel address space.
>
> In rcar_sysc_init, If ioremap_nocache will fail. It will return NULL.
> Kernel can run into a NULL-pointer dereference.

Note that if any of these fail, the system won't boot anyway.
I deliberately didn't do these releases because of various reasons...

> ---
>  drivers/soc/renesas/rcar-sysc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index 225c35c..17df921 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -349,7 +349,7 @@ static int __init rcar_sysc_pd_init(void)
>         domains = kzalloc(sizeof(*domains), GFP_KERNEL);
>         if (!domains) {
>                 error = -ENOMEM;
> -               goto out_put;
> +               goto out_iounmap;

Calling iounmap(base) after this point will make the pointer saved in
rcar_sysc_base invalid, leading to a crash when the platform code in
arm/mach-shmobile/smp-* calls any of the rcar_sysc_power_*()
functions.

>         }
>
>         domains->onecell_data.domains = domains->domains;
> @@ -380,7 +380,7 @@ static int __init rcar_sysc_pd_init(void)
>                 pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
>                 if (!pd) {
>                         error = -ENOMEM;
> -                       goto out_put;
> +                       goto out_kfree;

In theory, you could indeed free the memory pointed to by domains.
Don't know if it's worth the hassle.
You cannot free pd though, as it's been registered with the PM domain
subsystem.

>                 }
>
>                 strcpy(pd->name, area->name);
> @@ -400,6 +400,10 @@ static int __init rcar_sysc_pd_init(void)
>
>         error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
>
> +out_kfree:
> +       kfree(domains);
> +out_iounmap:
> +       iounmap(base);
>  out_put:
>         of_node_put(np);
>         return error;
> @@ -414,6 +418,8 @@ void __init rcar_sysc_init(phys_addr_t base, u32 syscier)
>                 return;
>
>         rcar_sysc_base = ioremap_nocache(base, PAGE_SIZE);
> +       if (!rcar_sysc_base)
> +               return;
>
>         /*
>          * Mask all interrupt sources to prevent the CPU from receiving them.
> --
> 1.9.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
