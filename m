Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:32928 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbdEJI2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 04:28:13 -0400
Received: by mail-io0-f195.google.com with SMTP id m4so1444871ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 01:28:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510070458.21193-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com> <20170510070458.21193-4-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2017 10:28:11 +0200
Message-ID: <CAMuHMdU1UPjwEQh4LoNUqUEv58ML=BWOA_VMKLGn2YE7L-22Lg@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: renesas: salvator-x: Enable HDMI outputs
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent, Uli,

On Wed, May 10, 2017 at 9:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Instantiate the HDMI connectors and enable the encoders.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/salvator-x.dtsi | 50 +++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> index d5eb022d247c..2cd0cce818e7 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> @@ -151,6 +151,30 @@
>                           1800000 0>;
>         };
>
> +       hdmi0-out {

Can you please respect sort order when inserting new nodes?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
