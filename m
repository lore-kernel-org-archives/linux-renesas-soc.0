Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57090 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731314AbeGQMvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 08:51:52 -0400
Date: Tue, 17 Jul 2018 14:19:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH v4] arm64: dts: r8a77995: Add SCIF {0,1,3,4,5} and all
 HSCIF device nodes
Message-ID: <20180717121924.42ilbf4l6ryksmap@verge.net.au>
References: <20180717113832.26413-1-horms+renesas@verge.net.au>
 <CAMuHMdXZ_pQaF7BZs_F6MdYsacRDHmNLnUS14n5yhy9+r6Z5Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZ_pQaF7BZs_F6MdYsacRDHmNLnUS14n5yhy9+r6Z5Mw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 17, 2018 at 01:45:26PM +0200, Geert Uytterhoeven wrote:
> On Tue, Jul 17, 2018 at 1:38 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds the device nodes for SCIF {0,1,3,4,5} and all HSCIF serial
> > ports, incl. clocks, power domain and DMAs.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > --
> > v3 [Simon Horman]
> > * Add DMAs
> 
> For the newly added SCIF dmas:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
