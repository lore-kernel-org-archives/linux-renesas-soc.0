Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1454322540-5608-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1454322540-5608-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Tue, 2 Feb 2016 11:10:00 +0100
Message-ID: <CAMuHMdUEUDkB3=jHAwXDozpdgFCimGS=LXsrxSVWac5xW2bg+A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 1, 2016 at 11:29 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -880,5 +880,31 @@
>                         power-domains = <&cpg>;
>                         status = "disabled";
>                 };
> +
> +               usb_dmac0: dma-controller@e65a0000 {
> +                       compatible = "renesas,r8a7795-usb-dmac",
> +                                    "renesas,usb-dmac";
> +                       reg = <0 0xe65a0000 0 0x100>;
> +                       interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH
> +                                     0 109 IRQ_TYPE_LEVEL_HIGH>;

Sorry, I missed you're not using the GIC_SPI defines.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
