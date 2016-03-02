Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1456886237-29936-3-git-send-email-horms+renesas@verge.net.au>
References: <1456886237-29936-1-git-send-email-horms+renesas@verge.net.au>
	<1456886237-29936-3-git-send-email-horms+renesas@verge.net.au>
Date: Wed, 2 Mar 2016 10:38:08 +0100
Message-ID: <CAMuHMdW7oxPMUbiBwmsuPa61uuqnKa0zrceENSfjjK1d6h36vA@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: rcar-gen3-usb2: add fallback binding
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

> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -6,6 +6,12 @@ This file provides information on what the device node for the R-Car generation
>  Required properties:
>  - compatible: "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
>               SoC.
> +             "renesas,usb2-phy-gen3" for a generic R-Car Gen3 compatible device.

"renesas,rcar-gen3-usb2-phy"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
