Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:38219 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751460AbeBTKxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 05:53:06 -0500
MIME-Version: 1.0
In-Reply-To: <1519119624-1268-8-git-send-email-geert+renesas@glider.be>
References: <1519119624-1268-1-git-send-email-geert+renesas@glider.be> <1519119624-1268-8-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 11:53:05 +0100
Message-ID: <CAMuHMdVqoBC0oD+JXWJU_p5KJy7adZj681rwxYFYj_L5kwD=ew@mail.gmail.com>
Subject: Re: [PATCH 7/9] serial: sh-sci: Fix out-of-bounds access through DT alias
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
> The sci_ports[] array is indexed using a value derived from the
> "serialN" alias in DT, which may lead to an out-of-bounds access.
>
> Fix this by adding a range check.
>
> Note that the array size is defined by a Kconfig symbol
> (CONFIG_SERIAL_SH_SCI_NR_UARTS), so this can even be triggered using a
> legitimate DTB.
>
> Fixes: f650cdf1c115498e ("serial: sh-sci: Fix out-of-bounds access through DT alias")

Fixes: 97ed9790c514066b ("serial: sh-sci: Remove unused platform data
capabilities field")

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
