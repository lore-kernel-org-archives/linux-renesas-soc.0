Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40027 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbeJIVhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Oct 2018 17:37:10 -0400
Received: by mail-vs1-f67.google.com with SMTP id z130-v6so1652705vsc.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Oct 2018 07:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20181005134916.12937-1-james.morse@arm.com> <CAMuHMdUFzHUJk7dT9CqF1uCg3bPr-Mh6LWTj6RpdcXLPRQkFEw@mail.gmail.com>
 <5eeebac5-b296-219d-f768-f81eaeec5498@arm.com>
In-Reply-To: <5eeebac5-b296-219d-f768-f81eaeec5498@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Oct 2018 16:19:46 +0200
Message-ID: <CAMuHMdWxCEJEVjV382+_+nvzO150=oQ4aHbP6LuD8JKsVz_pig@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: Use #ifdef for the __PAGETABLE_P?D_FOLDED defines
To: James Morse <james.morse@arm.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi James,

On Tue, Oct 9, 2018 at 3:25 PM James Morse <james.morse@arm.com> wrote:
> On 09/10/2018 13:37, Geert Uytterhoeven wrote:
> > On Fri, Oct 5, 2018 at 3:55 PM James Morse <james.morse@arm.com> wrote:
> >> __is_defined(__PAGETABLE_P?D_FOLDED) doesn't quite work as intended
> >> as these symbols are internal to asm-generic and aren't defined in the
> >> way kconfig expects. This makes them always evaluate to false.
> >> Switch to #ifdef.
>
> > This is now e9ed821be48600ea ("arm64: mm: Use #ifdef for the
> > __PAGETABLE_P?D_FOLDED defines") in arm64/for-next/core.
> >
> > If CONFIG_DEBUG_VIRTUAL=y, it prints a few times during boot on
> > several R-Car Gen3 platforms:
>
> Aha, I didn't test this with debug-virtual ... and the new __pa() to setup the
> fixmap for swapper is what is causing this:
>
> From arch/arm64/mm/mmu.c:
> | void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
> | {
> |       pgd_t *fixmap_pgdp;
> |
> |       spin_lock(&swapper_pgdir_lock);
> |       fixmap_pgdp = pgd_set_fixmap(__pa(pgdp));
> |       WRITE_ONCE(*fixmap_pgdp, pgd);
>
> This patch is just exposing the problem on your configuration, its commit
> 2330b7ca78350efcb ("arm64/mm: use fixmap to modify swapper_pg_dir") that missed
> this.
>
> We always know pgdp here will point within swapper_pg_dir, so I think its fair
> to switch this to the __pa_symbol() version. This fixes it for me:
> --------------------------%<--------------------------
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 6f0e2edcc114..6deb836a102a 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -74,7 +74,7 @@ void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>         pgd_t *fixmap_pgdp;
>
>         spin_lock(&swapper_pgdir_lock);
> -       fixmap_pgdp = pgd_set_fixmap(__pa(pgdp));
> +       fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
>         WRITE_ONCE(*fixmap_pgdp, pgd);
>         /*
>          * We need dsb(ishst) here to ensure the page-table-walker sees
> --------------------------%<--------------------------

Thanks!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
