Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35818 "EHLO
	mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932090AbcFJUmF (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 16:42:05 -0400
MIME-Version: 1.0
In-Reply-To: <8efb1c7e-5463-2556-744c-d327886d92d4@cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2539026.OyU5nvpxa6@wasted.cogentembedded.com> <20160601005751.GG20527@verge.net.au>
 <fdab2628-60bd-c41b-296b-38cd71a6c5da@cogentembedded.com> <CAMuHMdUkOpEp+YCbZVZppdN4C7KKpDS9_gEuXi_WKZXM9YHgEQ@mail.gmail.com>
 <ab5e3a98-7ff2-dc8f-d255-f6da26f43527@cogentembedded.com> <20160610010245.GA10152@verge.net.au>
 <8efb1c7e-5463-2556-744c-d327886d92d4@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jun 2016 22:42:03 +0200
Message-ID: <CAMuHMdUK=y2kZY1kA97QpCDyUZXFejpXTpO9ZVNQoBfDNoRgfg@mail.gmail.com>
Subject: Re: [PATCH 07/13] ARM: dts: r8a7792: initial SoC device tree
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Russell King <linux@arm.linux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Jun 10, 2016 at 9:29 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>    The only problem I'm seeing (again) is the RCAN clock failing to
> register:
>
> rcar_gen2_cpg_clocks_init: failed to register cpg_clocks rcan clock (-12)
>
>    I was going to look at it yesterday but (wrongly) thought it somehow
> cured itself... I'll look at it now.

The RCAN parent is the second clock in the CPG node's "clocks" property,
which you didn't provide.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
