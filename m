Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36029 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbdEJIot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 04:44:49 -0400
Received: by mail-io0-f194.google.com with SMTP id f102so1470726ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 01:44:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510070458.21193-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com> <20170510070458.21193-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2017 10:44:48 +0200
Message-ID: <CAMuHMdWxVuD0ELRM=kkXYFSPLgwxgP6QU-97h2PoYnvmoLDqqw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] arm64: dts: r8a7796: Add display placeholders
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, May 10, 2017 at 9:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> HDMI output and panel backlight for Salvator-X will be enabled for both
> the H3 and M3-W boards in salvator-x.dtsi. The file will need to
> reference SoC DT nodes that are not available for M3-W yet. Add
> placeholders to avoid breaking compilation.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 60a4289d0b14..60d12e418f66 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1131,6 +1135,24 @@
>                         /* placeholder */
>                 };
>
> +               hdmi0: hdmi0@fead0000 {
> +                       /* placeholder */
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +               };
> +
> +               hdmi1: hdmi1@feae0000 {
> +                       /* placeholder */
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +               };

R-Car M3-W does not have the second HDMI channel.
Hence I think you should not add a placeholder, but instead move the
H3-specific parts from salvator-x.dtsi to r8a7795-salvator-x.dts, like I did
for SATA and the second USB host channel.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
