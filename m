Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33187 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750896AbcFVHUO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 22 Jun 2016 03:20:14 -0400
MIME-Version: 1.0
In-Reply-To: <27171008.uuY7altQup@wasted.cogentembedded.com>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com> <27171008.uuY7altQup@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jun 2016 09:20:13 +0200
Message-ID: <CAMuHMdWcVRBxZO85_MhYVvODcbi-GYDNKfQH9LJEcrJRd=p7Vw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7794: add SMP support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wed, Jun 22, 2016 at 12:03 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the device tree node for the Advanced Power Management Unit (APMU).
> Use the "enable-method" prop to  point out that the APMU should be used
> for the SMP support.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> SMP/PM basically works but you can't offline CPU0 (system hangs)...

On #renesas-soc you said it hangs on SILK only, and succeeds on Porter,
with a WARNING in the clk core (which one?) during suspend?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
