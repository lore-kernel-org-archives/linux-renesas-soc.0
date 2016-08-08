Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36060 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752305AbcHHNRA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 09:17:00 -0400
MIME-Version: 1.0
In-Reply-To: <2482521.XCJrVWGkiq@wasted.cogentembedded.com>
References: <4031442.KeMCTMarLN@wasted.cogentembedded.com> <2482521.XCJrVWGkiq@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Aug 2016 15:16:59 +0200
Message-ID: <CAMuHMdXWRUEYE0DYZPmZGtWboGRiF9d77m6U4tYxC7k+oryf-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7792: add DU clocks
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

On Fri, Aug 5, 2016 at 8:25 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe the DU0/1 clocks and their parent, ZX clock in the R8A7792 device
> tree.
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
