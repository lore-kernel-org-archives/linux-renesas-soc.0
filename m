Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:37909 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934803AbdLSInH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 03:43:07 -0500
Received: by mail-qk0-f196.google.com with SMTP id i190so1191245qka.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Dec 2017 00:43:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171218214043.10796-2-horms+renesas@verge.net.au>
References: <20171218214043.10796-1-horms+renesas@verge.net.au> <20171218214043.10796-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Dec 2017 09:43:06 +0100
Message-ID: <CAMuHMdVNCyW=QU08eg=1j8Xyq1wBhsY6KxmpjCLi8X7mZD8YCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: r8a7743: sort root sub-nodes alphabetically
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Dec 18, 2017 at 10:40 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Sort root sub-nodes alphabetically for allow for easier maintenance

to allow for

> of this file.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi

>         cpus {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> @@ -79,6 +102,37 @@
>                 };
>         };
>
> +       /* External CAN clock */
> +       can_clk: can {

Doesn't look alphabetically to me...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
