Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34455 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750745AbcISHtn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 03:49:43 -0400
Received: by mail-it0-f66.google.com with SMTP id 186so3884814itf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2016 00:49:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2597193.HJgZ9VmMaF@wasted.cogentembedded.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com> <2597193.HJgZ9VmMaF@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Sep 2016 09:49:41 +0200
Message-ID: <CAMuHMdUXjqct0OkfqiEWxZESCAF_wS3hZXetEfYwSZ2gL9-r_w@mail.gmail.com>
Subject: Re: [PATCH RFC 3/8] soc: renesas: rcar-sysc: add R8A7743 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Sep 16, 2016 at 3:31 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add support for RZ/G1M (R8A7743) SoC power areas to the SYSC driver.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- renesas.orig/drivers/soc/renesas/rcar-sysc.c
> +++ renesas/drivers/soc/renesas/rcar-sysc.c
> @@ -275,6 +275,9 @@ finalize:
>  }
>
>  static const struct of_device_id rcar_sysc_matches[] = {
> +#ifdef CONFIG_ARCH_R8A7743
> +       { .compatible = "renesas,r8a7743-sysc", .data = &r8a7743_sysc_info },

This compatible value should be documented first.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
