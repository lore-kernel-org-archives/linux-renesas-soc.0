Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1456886237-29936-2-git-send-email-horms+renesas@verge.net.au>
References: <1456886237-29936-1-git-send-email-horms+renesas@verge.net.au>
	<1456886237-29936-2-git-send-email-horms+renesas@verge.net.au>
Date: Wed, 2 Mar 2016 10:37:31 +0100
Message-ID: <CAMuHMdXOSn1QJRYPROObib6hYGc98zUS+6RUCnCqEEwAk6-xKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] phy: rcar-gen2: add fallback binding
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 2, 2016 at 3:37 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 2 and Gen 3. But beyond that its not clear what the
> relationship between IP blocks might be. For example, I believe that
> r8a7790 is older than r8a7791 but that doesn't imply that the latter is a
> descendant of the former or vice versa.
>
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
>
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> @@ -7,6 +7,12 @@ Required properties:
>  - compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>               "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>               "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
> +             "renesas,usb-phy-gen2" for a generic R-Car Gen2 compatible device.

"renesas,rcar-gen2-usb-phy"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
