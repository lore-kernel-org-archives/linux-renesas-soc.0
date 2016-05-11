Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34588 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407AbcEKMNU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 08:13:20 -0400
Received: by mail-io0-f194.google.com with SMTP id d62so5579693iof.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 05:13:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <dd14821f-9b1c-6ea9-06f8-bc6698f7cba7@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
	<1462944578-1220-10-git-send-email-dirk.behme@de.bosch.com>
	<CAMuHMdUnDP55KLwT2XgjjzH4mSRuKRNSNqUmvuvFPVHAOeuTJQ@mail.gmail.com>
	<dd14821f-9b1c-6ea9-06f8-bc6698f7cba7@de.bosch.com>
Date: Wed, 11 May 2016 14:13:19 +0200
Message-ID: <CAMuHMdXE1fQzv+CDfRb8Tb-kMushBKAQ+dC+zR-vXLF2FjxMmg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] ARM: dts: r8a779x: Add reset module support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, May 11, 2016 at 1:56 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> On 11.05.2016 10:06, Geert Uytterhoeven wrote:
>> On Wed, May 11, 2016 at 7:29 AM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt
>>> @@ -0,0 +1,15 @@
>>> +Renesas RCar r8a779x reset module
>>> +-----------------------------------------------------
>>> +This binding defines the reset module found on Renesas RCar r8a779x
>>> +SoCs. The reset module contains several reset related registers,
>>> +the meaning of them is implementation dependent.
>>> +
>>> +Required properties:
>>> +- compatible : "renesas,rcar-rst"
>>> +- reg : Location and size of the reset module
>>> +
>>> +Example:
>>> +       reset-controller@e6160000 {
>>> +               compatible = "renesas,rcar-rst";
>>> +               reg = <0 0xe6160000 0 0x200>;
>>> +       };
>>
>>
>> While I understand you want to match on a single comptible value, the RST
>> module itself highly depends on the actual SoC.
>> Furthermore, R-Car Gen1 doesn't have RST.
>>
>> Hence I'd go for requiring 2 compatible values:
>>   - An SoC-specific one, e.g. "renesas,r8a7795-rst",
>>   - A family-specific one, e.g. "renesas,rcar-gen3-rst".
>>
>> Your driver code can match against the two family-specific compatible
>> values
>> using of_find_matching_node().
>
> This way? See below [1].
>
> Best regards
>
> Dirk
>
> [1]
>
> --- a/drivers/misc/boot-mode-reg/rcar.c
> +++ b/drivers/misc/boot-mode-reg/rcar.c
> @@ -16,24 +16,43 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>
>  #include <misc/boot-mode-reg.h>
>
> -#define MODEMR 0xe6160060
> +#define RCAR_RST_BASE 0xe6160000
> +#define RCAR_RST_SIZE 0x200
> +#define MODEMR 0x60
> +
> +static struct of_device_id rcar_rst_ids[] __initdata = {

const

> +       { .compatible = "renesas,rcar-gen2-rst" },
> +       { .compatible = "renesas,rcar-gen3-rst" },
> +       {}
> +};
>
>  static int __init rcar_read_mode_pins(void)
>  {
> -       void __iomem *modemr;
> +       void __iomem *reset;
> +       struct device_node *np;
>         int err = -ENOMEM;
>         static u32 mode;
>
> -       modemr = ioremap_nocache(MODEMR, 4);
> -       if (!modemr) {
> -               pr_err("failed to map boot mode register");
> +       np = of_find_matching_node(NULL, rcar_rst_ids);

Yep, like this.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt
> @@ -0,0 +1,24 @@
> +Renesas RCar r8a779x reset module

R-Car Gen2 and Gen3

> +-----------------------------------------------------
> +This binding defines the reset module found on Renesas RCar r8a779x

R-Car Gen2 and Gen3

> +SoCs. The reset module contains several reset related registers,
> +the meaning of them is implementation dependent.

You may want to add more functionality from
http://www.spinics.net/lists/linux-sh/msg44754.html

> +Required properties:
> +- compatible : "renesas,rcar-gen2-rst" for RCar Gen2 or

R-Car

> +               "renesas,rcar-gen3-rst" for RCar Gen3

R-Car

> +              and additionally a SoC specific property like
> +              "renesas,r8a7790-rst" or
> +              "renesas,r8a7791-rst" or
> +              "renesas,r8a7792-rst" or
> +              "renesas,r8a7793-rst" or
> +              "renesas,r8a7794-rst" or
> +              "renesas,r8a7795-rst" or
> +              "renesas,r8a7796-rst"

The SoC-specific compatible values should be listed first.

> +- reg : Location and size of the reset module
> +
> +Example:
> +       reset-controller@e6160000 {
> +               compatible = "renesas,rcar-gen3-rst", "renesas,r8a7795-rst";

The SoC-specific compatible value should be listed first.
The same is true for the actual dtsi files.

> +               reg = <0 0xe6160000 0 0x200>;
> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
