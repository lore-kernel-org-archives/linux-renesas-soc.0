Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1481280650-9258-3-git-send-email-horms+renesas@verge.net.au>
References: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au> <1481280650-9258-3-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Dec 2016 13:52:20 +0100
Message-ID: <CAMuHMdX_Cg6T10pMXe420kOwQn27_PRm-osNb7L4_M==fJnE_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] irqchip/renesas-intc-irqpin: Add R-Car Gen1 fallback binding
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Dec 9, 2016 at 11:50 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 1, Gen 2 and Gen 3. But beyond that its not clear what the

it's

> relationship between IP blocks might be. For example, I believe that
> r8a7779 is older than r8a7778 but that doesn't imply that the latter is a
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
> ---
>  .../interrupt-controller/renesas,intc-irqpin.txt   | 44 ++++++++++++----------
>  drivers/irqchip/irq-renesas-intc-irqpin.c          |  2 +
>  2 files changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> index 772c550d3b4b..e5a5251be9f5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> @@ -2,13 +2,19 @@ DT bindings for the R-/SH-Mobile irqpin controller
>
>  Required properties:
>
> -- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
> -  as fallback.
> -  Examples with soctypes are:
> +- compatible:
>      - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
>      - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
>      - "renesas,intc-irqpin-r8a7779" (R-Car H1)
>      - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
> +    - "renesas,rcar-gen1-intc-irqpin" (generic R-Car Gen1 compatible device)

Does it make sense to add a new family-specific compatible value to a driver
that's unlikely to receive more users in the future? More recent SoCs use
renesas,irqc.

If the answer is yes, do we want one for SH/R-Mobile too?

> +    - "renesas,intc-irqpin"         (generic device)
> +
> +    When compatible with a generic R-Car version, nodes must list the
> +    SoC-specific version corresponding to the platform first followed by
> +    the generic R-Car version.
> +
> +    "renesas,intc-irqpin" must be present and last.
>
>  - reg: Base address and length of each register bank used by the external
>    IRQ pins driven by the interrupt controller hardware module. The base
> @@ -39,24 +45,22 @@ Optional properties:
>  Example
>  -------
>
> -       irqpin1: interrupt-controller@e6900004 {
> -               compatible = "renesas,intc-irqpin-r8a7740",
> +       irqpin0: interrupt-controller@fe78001c {
> +               compatible = "renesas,intc-irqpin-r8a7779",
> +                            "renesas,rcar-gen1-intc-irqpin",

And now we have three compatible values to list...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
