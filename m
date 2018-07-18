Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:44247 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbeGRJmY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 05:42:24 -0400
Received: by mail-vk0-f65.google.com with SMTP id 125-v6so2086301vke.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jul 2018 02:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com> <1531856883-19645-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1531856883-19645-2-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jul 2018 11:05:18 +0200
Message-ID: <CAMuHMdVA_Geohmr+Fy0diaFuHqW-Aiyo_MYOpb=yLy6Cm=H_kw@mail.gmail.com>
Subject: Re: [PATCH/RFT 1/7] arm64: dts: renesas: r8a77965: Add Audio-DMAC
 device nodes
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kaneko-san,

On Tue, Jul 17, 2018 at 9:48 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds Audio-DMAC{0,1} device nodes for the R8A77965 SoC.
>
> Based on a similar patch of the R8A7796 device tree
> by uninori Morimoto <kuninori.morimoto.gx@renesas.com>.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -1386,6 +1386,74 @@
>                         status = "disabled";
>                 };
>
> +               audma0: dma-controller@ec700000 {

> +               };
> +

Please respect sort order (by unit address, per device group).
The two audma nodes should be inserted just before usb@ee000000.

>                 ohci0: usb@ee080000 {
>                         compatible = "generic-ohci";
>                         reg = <0 0xee080000 0 0x100>;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
