Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:33492 "EHLO
	mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750697AbcFAHue convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 03:50:34 -0400
MIME-Version: 1.0
In-Reply-To: <20160601002535.GB20527@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
	<4688920.9Ektl04hDh@wasted.cogentembedded.com>
	<20160601002535.GB20527@verge.net.au>
Date: Wed, 1 Jun 2016 09:50:33 +0200
Message-ID: <CAMuHMdVDq0JRg6i_QtqOzhSv-KT2paEz8dnW68nyhYwxcb6sVQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] DT: clock: rcar-gen2-cpg-clocks: document R8A7792 support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Jun 1, 2016 at 2:25 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 01, 2016 at 01:20:11AM +0300, Sergei Shtylyov wrote:
>> Renesas R8A7792 SoC is a member of the R-Car gen2 family and so has CPG...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> I think the prefix of this patch should be "clk: shmobile: rcar-gen2: "

Almost, "clk: renesas: rcar-gen: " ;-)

> I apologise if I have missed a discussion of this topic or if my analysis
> is wrong for some reason but I am curious to know what the intended way
> is for the rcar-gen2 CPG driver to handle differences in the availability
> of clocks across different SoCs.
>
> My possibly naïve expectation is that the implementation would use compat
> strings. But as it stands it appears that all clocks supported by the
> driver are available for all SoCs. This does not seem to reflect the
> documentation (v2.00).

Differentiaton is not done using compat strings, but using clock-output-names.
The driver only instantiates the clocks that are listed there.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
