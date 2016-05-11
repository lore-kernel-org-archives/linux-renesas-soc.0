Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36842 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751767AbcEKIGp (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 04:06:45 -0400
Received: by mail-io0-f195.google.com with SMTP id k129so4732346iof.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 01:06:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462944578-1220-10-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
	<1462944578-1220-10-git-send-email-dirk.behme@de.bosch.com>
Date: Wed, 11 May 2016 10:06:44 +0200
Message-ID: <CAMuHMdUnDP55KLwT2XgjjzH4mSRuKRNSNqUmvuvFPVHAOeuTJQ@mail.gmail.com>
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

On Wed, May 11, 2016 at 7:29 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt
> @@ -0,0 +1,15 @@
> +Renesas RCar r8a779x reset module
> +-----------------------------------------------------
> +This binding defines the reset module found on Renesas RCar r8a779x
> +SoCs. The reset module contains several reset related registers,
> +the meaning of them is implementation dependent.
> +
> +Required properties:
> +- compatible : "renesas,rcar-rst"
> +- reg : Location and size of the reset module
> +
> +Example:
> +       reset-controller@e6160000 {
> +               compatible = "renesas,rcar-rst";
> +               reg = <0 0xe6160000 0 0x200>;
> +       };

While I understand you want to match on a single comptible value, the RST
module itself highly depends on the actual SoC.
Furthermore, R-Car Gen1 doesn't have RST.

Hence I'd go for requiring 2 compatible values:
  - An SoC-specific one, e.g. "renesas,r8a7795-rst",
  - A family-specific one, e.g. "renesas,rcar-gen3-rst".

Your driver code can match against the two family-specific compatible values
using of_find_matching_node().

> \ No newline at end of file

Oops.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
