Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9A218AB9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043818; cv=none; b=t+MtKmYkFZPmuxLcqDTE7mJU/RSeUXmaPLHEtm+Ax0C/wfEZ6+IlKJgNabtQ65wlaZqTcC6BE7qnoqgdlCUx69cTe58y/Q+rvP0ujJ9LJlMBgoM0XCD/wb8QvKeW2QKD/FNVRDM0njCFDZ4/c8W63ElnRcLB6qqpaNWoj9VzD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043818; c=relaxed/simple;
	bh=NmgtNIiaie5v1b+7v4Tfvjvl/nsrpJJcLEz6wbrdxZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtvY7trQuHpBLaLuFjVSfKe2W51HdVZu2WcBOrdCwrBsO9Iq7lS31zkp6OuSsWq5RbOsqO7ckwdMTUDRwFeh/JjSbVL9CrR8vfIAsU1/hAZlfoo+qpbL89vr8TAiBayJ/77FTlbXRcClSrvmBIHKR3k7odvvIiSkoC99yXtYET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfaf91daa2so348238e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043816; x=1784648616;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ada/q+dWqh09jb9bqASq9gF6EZOlFcR0dGagDul5ZU0=;
        b=hqArUg7nwJO7FWCe0D+5Yo55blil5Ks1JgMT/P+yo7Enf8SUJVQmPeFwX62Ouon3F/
         5qO6k4NXKNBiz8mwP7fCVpzOthqJ873dEYKj/jBFMs/Ea6kUYG1mBjxCydAHsZSeDkrR
         FKdPUPGgHlDZCDS73ikddMMR9eOd52kVBOt2fT2RBnSAzEcuPMGpkBfr5/0/8joNW7/l
         KMGgD8zFYXMUaEplGsu+u/BTP/ooC5r21IdDqE7wPI5z3RUC+lvBXMqwdr+8uNOFyyT5
         mg4lfxns2JeckK4hZHz1r20INmRfnlHNhHEHRydqm6tSWwTmyXZRe+gwAGOG+1KV3XW1
         3jVA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5uFKlMErnxFrsZSkl3v++mrc1jtv4xZ9Fg3M8k1vYcOUYxBcFGQzwUi9fFx6rFaRvHQYQY3lH5Nc/eV3cpmxdpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf0/YHcLgIZs/Kbb90wQ2owXoToKfV401bVlTUop/GNkn8SHrT
	ZosvVsVXNkobevsJVZ6nW7lP7JJoxzP6mzasW6GIYI/f1PpyXMpVOTRgpcFtn5tScs4=
X-Gm-Gg: AfdE7cnZgAyi4geLx5WZ/qHpMQmPQFnFzsNltK2pqAEifx6c+TFFucxxzK3CQdf8bcC
	f2IsF2wLO3e7r484+oWXqsZuvYC7cJuPZVIMVAljbN5NBbvGqBqyGC7Hir1TcVx5vbDnCib6F+B
	XiomlfpeLA475FqClGZ8qvKT8sYvtVHb56azPOWua17J6icQ0WPrEvdUAMoALYjSSE7UDIrkhfy
	l2FHXXufaVi492YlAwAuvrE9wdXr5kqhpCP8r2Pkjxo1dYVNOkcqGWPVWxkFv2RhRC3pahn3oWf
	HFFrsZKAQ6pj0iMTKX3hbxF+YEzbXKOSiSVIOzcGg7Pn0Dex5zGt425vLE+jtT7xK2G8XYqQDkx
	YN2W7P9wfvQCOJTlkSbqKDrM+xa7sIB1VVguT45QyhNbBUSBtRnW2TzpO06sd34/EIgasYBfVXZ
	G7gEFk8vj9wb2D5gi4+5A/+VxE54x01zKLi1q8qNW/Mamwtjv7yA==
X-Received: by 2002:a05:6122:459d:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5bfbf41eb67mr7460223e0c.13.1784043815843;
        Tue, 14 Jul 2026 08:43:35 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfb1aefafcsm6846195e0c.4.2026.07.14.08.43.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:43:34 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-963f63fe025so441024241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 08:43:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqOr3mimsFpdgV5ieB12r+bzPN2q4vXIiaYqh6TWxGwpWgeo8EJptBnrevZyorgKfag3hp+qRPWgfHucZuFlOTk3g==@vger.kernel.org
X-Received: by 2002:a05:6102:c4c:b0:726:e81f:f3f0 with SMTP id
 ada2fe7eead31-74533d660d8mr7704803137.15.1784043814149; Tue, 14 Jul 2026
 08:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com> <20260713175159.138334-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260713175159.138334-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 17:43:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQDWJGxuU04PEo2bJgHJF5F+0=HXqKzthKhKSR6dg0Tg@mail.gmail.com>
X-Gm-Features: AUfX_myvgANJp5og68PYkTHvIcIM4WKLf3Akk3PMIfJcnRn_2dsJDG0zHs09wp0
Message-ID: <CAMuHMdXQDWJGxuU04PEo2bJgHJF5F+0=HXqKzthKhKSR6dg0Tg@mail.gmail.com>
Subject: Re: [PATCH v20 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 13 Jul 2026 at 19:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SoC (r9a08g046) has an SDHI controller with several
> differences from existing platforms, requiring dedicated handling.
>
> Utilise the TMIO_MMC_HWADJ flag to identify controllers that carry
> a second hardware adjustment register (SDm_SCC_HWADJ2 at offset 0x010).
> When both TMIO_MMC_TUNING_DELAY and TMIO_MMC_HWADJ are set,
> renesas_sdhi_set_hw_adjustment_delay() additionally programs HWADJ2
> with 0x3FFF at 3.3 V and 0xFF at 1.8 V. A new RZG3L_SDHI_SCC_HWADJ4
> register (offset 0x022) is also cleared at the start of tuning when
> TMIO_MMC_INTERNAL_DIVIDER is set.
>
> Add a new version constant SDHI_VER_RZ_G3L_SDMMC (0xce10) and extend
> renesas_sdhi_sdbuf_width() to handle it alongside the existing Gen3
> variants.
>
> Introduce of_data_rzg3l with RZ/G3L-specific parameters: a wider
> clk_mask of 0x200000200, a max_divider of 2048 (reflecting the 11-bit
> divider), a dedicated rzg3l_scc_taps table, and all relevant tmio_flags,
> including TMIO_MMC_INTERNAL_DIVIDER and TMIO_MMC_HWADJ. Wire it to a
> new of_rzg3l_compatible entry using sdhi_quirks_rzg3l (which sets
> fixed_addr_mode), and register the "renesas,sdhi-r9a08g046" compatible
> string in the OF match table.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

This causes a division by zero on Armadillo (R-Mobile A1):

    Division by zero in kernel.
    CPU: 0 UID: 0 PID: 22 Comm: kworker/0:2 Not tainted
7.2.0-rc3-armadillo-06338-gd1557670ab0c #976 VOLUNTARY
    Hardware name: Generic R8A7740 (Flattened Device Tree)
    Workqueue: events_freezable mmc_rescan
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x44/0x74
     dump_stack_lvl from Ldiv0+0x8/0x10
     Ldiv0 from tmio_mmc_set_ios+0x11c/0x1bc
     tmio_mmc_set_ios from mmc_sdio_init_card+0xa40/0xab8
     mmc_sdio_init_card from mmc_attach_sdio+0x90/0x32c
     mmc_attach_sdio from mmc_rescan+0x1d8/0x2a4
     mmc_rescan from process_scheduled_works+0x2bc/0x45c
     process_scheduled_works from worker_thread+0x170/0x214
     worker_thread from kthread+0x114/0x124
     kthread from ret_from_fork+0x14/0x28
    Exception stack(0xe0945fb0 to 0xe0945ff8)
    5fa0:                                     00000000 00000000
00000000 00000000
    5fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
    Division by zero in kernel.
    CPU: 0 UID: 0 PID: 22 Comm: kworker/0:2 Not tainted
7.2.0-rc3-armadillo-06338-gd1557670ab0c #976 VOLUNTARY
    Hardware name: Generic R8A7740 (Flattened Device Tree)
    Workqueue: events_freezable mmc_rescan
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x44/0x74
     dump_stack_lvl from Ldiv0+0x8/0x10
     Ldiv0 from tmio_mmc_set_ios+0x11c/0x1bc
     tmio_mmc_set_ios from sdio_enable_4bit_bus+0x120/0x138
     sdio_enable_4bit_bus from mmc_sdio_init_card+0xa48/0xab8
     mmc_sdio_init_card from mmc_attach_sdio+0x90/0x32c
     mmc_attach_sdio from mmc_rescan+0x1d8/0x2a4
     mmc_rescan from process_scheduled_works+0x2bc/0x45c

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -235,9 +238,18 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>
>         clock = clk & CLK_CTL_DIV_MASK;
>         if (clock != CLK_CTL_DIV_MASK)
> -               host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
> +               host->mmc->actual_clock /= (1 << (ffs(clk) + 1));

Is this change intentional?

    clock = 0, ffs(clock) = 0
    clk = 8388608, ffs(clk) = 24

Later:

    static void tmio_mmc_max_busy_timeout(struct tmio_mmc_host *host)
    {
            unsigned int clk_rate = host->mmc->actual_clock ?: host->mmc->f_max;

            host->mmc->max_busy_timeout = host->get_timeout_cycles(host) /
                                          (clk_rate / MSEC_PER_SEC);

clk_rate = 2, BOOM!

   }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
