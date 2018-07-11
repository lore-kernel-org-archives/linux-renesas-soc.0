Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:43079 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbeGKMq1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 08:46:27 -0400
MIME-Version: 1.0
References: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com> <1531312174-17489-3-git-send-email-phil.edworthy@renesas.com>
In-Reply-To: <1531312174-17489-3-git-send-email-phil.edworthy@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jul 2018 14:42:07 +0200
Message-ID: <CAMuHMdWHPp4kGzPqkhCKOxNSiKgkrb=w76tofSb4SwP5DF5tdw@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: 8250_dw: Add compatible string for Renesas
 RZ/N1 UART
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        ed.blake@sondrel.com, Stefan.Potyra@elektrobit.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Phil,

On Wed, Jul 11, 2018 at 2:30 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The Renesas RZ/N1 UART is based on the Synopsys DW UART, but has additional
> registers for DMA. This patch does not address the changes required for DMA
> support, it simply adds the compatible string.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks for your patch!

What happens if someone would boot a kernel that has only this patch applied and
a DTB that already has the to-be-supported dmas properties?

> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -693,6 +693,7 @@ static const struct of_device_id dw8250_of_match[] = {
>         { .compatible = "snps,dw-apb-uart" },
>         { .compatible = "cavium,octeon-3860-uart" },
>         { .compatible = "marvell,armada-38x-uart" },
> +       { .compatible = "renesas,uart-rzn1" },

renesas,rzn1-uart

>         { /* Sentinel */ }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
