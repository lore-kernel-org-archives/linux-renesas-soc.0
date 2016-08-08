Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34279 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752005AbcHHMm5 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 08:42:57 -0400
MIME-Version: 1.0
In-Reply-To: <1477310.o5B8uhf3mT@wasted.cogentembedded.com>
References: <17288006.ERHB6654v5@wasted.cogentembedded.com> <1477310.o5B8uhf3mT@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Aug 2016 14:42:56 +0200
Message-ID: <CAMuHMdWeq2tH_jpPJ1sPYiutKCcAXynm8tw6vBW7dC9C1seUeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7792: add VIN clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
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

On Sat, Jul 23, 2016 at 9:16 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe the VIN[0-5] clocks and their parent, ZG clock in the R8A7792
> device  tree.
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
