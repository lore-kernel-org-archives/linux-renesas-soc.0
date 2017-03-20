Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:35905 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753679AbdCTK55 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 06:57:57 -0400
Received: by mail-it0-f53.google.com with SMTP id w124so84057006itb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 03:57:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <148999976116.21495.8298900753704826597.sendpatchset@little-apple>
References: <148999976116.21495.8298900753704826597.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Mar 2017 11:57:55 +0100
Message-ID: <CAMuHMdWS7J8taujfNXZ6e-qNbw8xPi0Q4JyqNcAXobw6EvzzMg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Correct SATA device size to 2MiB
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Mon, Mar 20, 2017 at 9:49 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Update the r8a7795 SATA device node to use a 2MiB I/O space as specified
> in the "72. Serial-ATA" section of R-Car-Gen3-rev0.52E.pdf
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi       2017-03-20 17:41:36.390607110 +0900
> @@ -1209,7 +1209,7 @@
>
>                 sata: sata@ee300000 {
>                         compatible = "renesas,sata-r8a7795";
> -                       reg = <0 0xee300000 0 0x1fff>;
> +                       reg = <0 0xee300000 0 0x200000>;

While the datasheet does mention the 2 MiB area, it also says no (write)
access should be made to registers not listed in the table, while these are
all covered by the existing area?

BTW, what about the Reference Clock Source Select Register, which lies
in a further undocumented area?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
