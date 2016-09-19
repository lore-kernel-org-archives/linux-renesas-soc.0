Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36296 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751914AbcISHxi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 03:53:38 -0400
Received: by mail-it0-f67.google.com with SMTP id n143so3887326ita.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2016 00:53:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7093322.WFIWVqz40g@wasted.cogentembedded.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com> <7093322.WFIWVqz40g@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Sep 2016 09:53:37 +0200
Message-ID: <CAMuHMdU8snWdKzsBoqjvP7PrBBcMychTcsdMSJC5ptrs_Pt82A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/8] ARM: shmobile: r8a7743: basic SoC support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Sep 16, 2016 at 3:33 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add minimal support for the RZ/G1M (R8A7743) SoC.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ renesas/arch/arm/mach-shmobile/setup-r8a7743.c
> @@ -0,0 +1,34 @@

> +static const char * const r8a7743_boards_compat_dt[] __initconst = {
> +       "renesas,r8a7743",

To be documented in
Documentation/devicetree/bindings/arm/shmobile.txt.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
