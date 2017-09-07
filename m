Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35679 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753927AbdIGKvK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 06:51:10 -0400
MIME-Version: 1.0
In-Reply-To: <1504737438-23504-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737438-23504-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Sep 2017 12:51:08 +0200
Message-ID: <CAMuHMdWadmVM0L2Ee=T=uMxQCOHJ=_JzKNt45UNRB-nxFQtV-Q@mail.gmail.com>
Subject: Re: [PATCH 17/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C4
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 7, 2017 at 12:37 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCA9548 I2C switch on I2C4 bus on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -98,6 +98,14 @@
>                 interrupt-parent = <&gpio5>;
>                 interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
>         };
> +
> +       i2cswitch4: pca9548@74 {

i2c-switch@74

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
