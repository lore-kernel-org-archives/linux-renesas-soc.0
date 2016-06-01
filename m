Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51148 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750807AbcFAU2Y (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 16:28:24 -0400
MIME-Version: 1.0
In-Reply-To: <1464810650-23002-1-git-send-email-geert+renesas@glider.be>
References: <1464810650-23002-1-git-send-email-geert+renesas@glider.be>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 1 Jun 2016 15:27:59 -0500
Message-ID: <CAL_JsqLOO9UsAhBu4MVBBu2uiBpbiBvUO_pPeYg+S-7wg-xVkQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/1] soc: renesas: Add DT fixup code for backwards compatibility
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Grant Likely <grant.likely@linaro.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-renesas-soc@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 1, 2016 at 2:50 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>         Hi all,
>
> When moving functionality from C code to DT, we're regularly faced with
> stable DT issues: old DTBs should keep on working. This requires keeping
> workaround code in the kernel.
>
> An alternative solution to having workaround C code, would be to
> dynamically modify the DT, to add missing device nodes and phandle links.
> This has several advantages:
>   - All workarounds are kept together,
>   - Workarounds can be enabled/disabled using a single Kconfig option,
>   - Individual driver code is not polluted by workaround code.
>
> Examples of missing support in DT are:
>   - A device node for the R-Car RST (Reset Controller), which a.o.
>     provides access to the Mode Pins (currently handled using an
>     hardcoded address in platform/driver code), cfr. the series
>     "[PATCH/RFC v3 00/22] soc: renesas: Add R-Car RST driver for
>     obtaining mode pin state" I've just sent
>     (http://www.spinics.net/lists/linux-renesas-soc/msg04289.html),
>   - A device node for the R-Car SYSC (System Controller), to link CPUs
>     to their respective power domains (On R-Car Gen2 CPUs can be
>     auto-detected, as there's a register indicating which CPU cores are
>     present),
>   - Add a device node for the R-Car Gen2 APMU (Advanced Power
>     Management Unit), for modern CPU bringup using "enable-method".
>     Note that the method from this RFC doesn't work for
>     "enable-method", as that is parsed in arm_dt_init_cpu_maps(),
>     immediately after unflatten_device_tree(), long before initcalls
>     run.
>
> However, there are other possible uses:
>   - Workarounds for hardware bugs: early engineering samples of an SoC
>     may have non-functional devices. This would allow to describe the
>     latest (functional) hardware in the .dtsi, knowing that the fixup
>     code will disable non-functional devices when running on an early
>     engineering sample, based on reading the PRR (Product Revision
>     Register).
>   - Handle other differences between SoC versions, e.g. change
>     compatible values for an early engineering sample that needs special
>     handling, or limit the features of a device.
>   - Add SoC-specific compatible values to all device nodes (e.g. add
>     "renesas,r8a7795-wdt" to a node already having
>     "renesas,rcar-gen3-wdt" when running on r8a7795). This would make
>     it easier to share .dtsi files within the same SoC family, without
>     relying on e.g. C preprocessor tricks.
>
> This proof-of-concept implements this for the missing R-Car RST (Reset
> Controller) node. This poc is not suitable for all of the above, as some
> DT structures (e.g. the CPU's "enable-method) are parsed long before
> early_initcall(), and would need a different workaround.
>
> What do you think?

I have no objection to this method of dealing with compatibility.
However your handling is still C code. What I would like to see here
is using overlays to apply updates. I would like to be able to take 2
dts files and create an overlay dts based on their diff (or you could
do this step manually). Then build the overlay dtb into the kernel and
apply it on boot based on some match. Then thru the magic of linker
sections, it becomes a matter of just adding the dtbo into the build
and a one line declaration:

DT_QUIRK(my_quirk_dtbo, "vendor,board");

BTW, I'd also like to see tools to apply overlays offline into a new
dtb or compile dts files and overlays to a dtb.

> Should this be handled at another level? E.g. operate on the FDT?

We should try to avoid doing things with the FDT if possible.

Rob
