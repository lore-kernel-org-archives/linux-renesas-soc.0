Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36441 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbcHHNKJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 09:10:09 -0400
MIME-Version: 1.0
In-Reply-To: <5158815.xFJQ7LtYb1@wasted.cogentembedded.com>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com> <5158815.xFJQ7LtYb1@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Aug 2016 15:10:08 +0200
Message-ID: <CAMuHMdU1=3L0uRkVVcJCtG-aZ2+AdpFjQ6PmND0ZrjVuQ6L=XQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] ARM: dts: r8a7794: add MSTP10 clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wed, Jul 27, 2016 at 11:01 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add MSTP10 clocks to the R8A7794 device tree.
>
> This patch is based on the commit ee9141522dcf ("ARM: shmobile: r8a7791:
> add MSTP10 support on DTSI").
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> Changes in version 4:
> - removed non-existing SRC0/7/8/9 clocks;
> - reparented SSI[0-9] clocks;

Do we want to do that on r8a7790, r8a7791, and r8a7793, too?

Morimoto-san: Is there a specific reason why the various SCU sub clocks
are children of the SCU_ALL clock, while the various SSI sub clocks are
children of the HP clock on those SoCs?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
