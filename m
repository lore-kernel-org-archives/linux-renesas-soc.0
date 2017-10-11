Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:38232 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752011AbdJKJOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 05:14:45 -0400
Received: by mail-wr0-f195.google.com with SMTP id f12so704281wra.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 02:14:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lgkjzbl6.wl%kuninori.morimoto.gx@renesas.com>
References: <87o9pfzbmw.wl%kuninori.morimoto.gx@renesas.com> <87lgkjzbl6.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2017 11:14:43 +0200
Message-ID: <CAMuHMdVnDNorpTa4r8oHoQgfn0fhqzKs-F7T-yTWjM2v38Dc5g@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] pinctrl: sh-pfc: r8a77995: add Audio SSI pin support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, Oct 10, 2017 at 9:57 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.15, after ...

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -1325,6 +1325,50 @@ enum {
>         SCIF_CLK_MARK,
>  };
>
> +/* - SSI ---------------------------------------------------------------*/
> +static const unsigned int ssi3_data_pins[] = {
> +       /* SDATA3 */

... changing these comments to e.g. SDATA, as per Sergei's feedback.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
