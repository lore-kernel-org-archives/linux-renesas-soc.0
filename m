Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:37291 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932276AbdELJnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 05:43:40 -0400
Received: by mail-it0-f47.google.com with SMTP id g126so34215015ith.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 May 2017 02:43:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87h90r9bqj.wl%kuninori.morimoto.gx@renesas.com>
References: <87o9uz9bv5.wl%kuninori.morimoto.gx@renesas.com> <87h90r9bqj.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2017 11:43:39 +0200
Message-ID: <CAMuHMdViYgnsGk=_YKFbTeOcncNiSF=v9jrzRgODqNvzsE+FLA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: renesas: r8a7796: add Sound SSI PIO support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>
Cc: Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san, Simon,

On Fri, May 12, 2017 at 2:14 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1259,7 +1259,42 @@
>                 };
>
>                 rcar_sound: sound@ec500000 {

[...]

> +                       power-domains = <&cpg>;

power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;

(by comparing r8a779[66].dtsi).

Simon: As you have already applied this, can you please fix it up in your tree?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
