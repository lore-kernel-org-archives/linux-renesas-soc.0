Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:32927 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255AbcFUHLo (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 21 Jun 2016 03:11:44 -0400
MIME-Version: 1.0
In-Reply-To: <1627631.X1bJtVQHBF@wasted.cogentembedded.com>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com> <1627631.X1bJtVQHBF@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jun 2016 09:10:55 +0200
Message-ID: <CAMuHMdXQ9rN8Gp0geqiubjcniodtEdo2S6-fMJx0YLtgXZHuDA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7792: add SMP support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
	"open list:MEDIA DRIVERS FOR RENESAS - FCP"
	<linux-renesas-soc@vger.kernel.org>,
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

On Tue, Jun 21, 2016 at 12:31 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the device tree nodes for the Advanced Power Management Unit (APMU)
> and the second Cortex-A15 CPU core.
> Use the "enable-method" prop  to point out that the APMU should be used
> for the SMP support.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
