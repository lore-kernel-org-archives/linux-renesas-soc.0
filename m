Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:47040 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751402AbeBTKvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 05:51:15 -0500
MIME-Version: 1.0
In-Reply-To: <1519119624-1268-3-git-send-email-geert+renesas@glider.be>
References: <1519119624-1268-1-git-send-email-geert+renesas@glider.be> <1519119624-1268-3-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 11:51:13 +0100
Message-ID: <CAMuHMdXrFQbopFKipo0yGejyayHXWXy_t50ZDJMbn6dj04LtOw@mail.gmail.com>
Subject: Re: [PATCH 2/9] serial: fsl_lpuart: Fix out-of-bounds access through
 DT alias
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Barry Song <baohua@kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        Jiri Slaby <jslaby@suse.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-serial@vger.kernel.org,
        arcml <linux-snps-arc@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 10:40 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The lpuart_ports[] array is indexed using a value derived from the
> "serialN" alias in DT, which may lead to an out-of-bounds access.
>
> Fix this by adding a range check.
>
> Fixes: 970416c691dc68b5 ("serial: fsl_lpuart: Fix out-of-bounds access through DT alias")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Fixes: c9e2e946fb0ba5d2 ("tty: serial: add Freescale lpuart driver support")

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
