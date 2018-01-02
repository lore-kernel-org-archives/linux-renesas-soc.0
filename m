Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:46680 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750736AbeABHw3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 02:52:29 -0500
MIME-Version: 1.0
In-Reply-To: <20171231184444.642619406@cogentembedded.com>
References: <20171231184444.642619406@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2018 08:52:27 +0100
Message-ID: <CAMuHMdV18H820-fkn61LKz5O6GAqL7GPa6vFM4v1GysX6cuV=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ravb: kill redundant check in the probe() method
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org,
        "open list:RENESAS ETHERNET DRIVERS"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Sun, Dec 31, 2017 at 7:41 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Browsing thru the driver diassembly, I noticed that gcc was  able to
> figure  out  that the 'ndev' pointer is always non-NULL when calling
> free_netdev()  on the probe() method's  error path and  thus skip that
> redundant NULL check... gcc is smart, be like gcc! :-)

Thanks for your patch!

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- net-next.orig/drivers/net/ethernet/renesas/ravb_main.c
> +++ net-next/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2205,8 +2205,7 @@ out_dma_free:
>         if (chip_id != RCAR_GEN2)
>                 ravb_ptp_stop(ndev);
>  out_release:
> -       if (ndev)
> -               free_netdev(ndev);
> +       free_netdev(ndev);
>
>         pm_runtime_put(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);

BTW, there isn't a functional dependency, but you may want to move the
freeing of the netdev below disabling of Runtime PM for symmetry (use
reverse order in cleanup).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
