Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:35478 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934263AbcJUPru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 11:47:50 -0400
Message-ID: <1477064863.2508.26.camel@pengutronix.de>
Subject: Re: [PATCH v4 00/23] soc: renesas: Add R-Car RST driver for
 obtaining mode pin state
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 21 Oct 2016 17:47:43 +0200
In-Reply-To: <1477064730.2508.24.camel@pengutronix.de>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
         <1477064730.2508.24.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Am Freitag, den 21.10.2016, 17:45 +0200 schrieb Philipp Zabel:
>      A. Hi Geert,
> 
> Am Freitag, den 21.10.2016, 15:17 +0200 schrieb Geert Uytterhoeven:
> >         Hi Philipp, Mike, Stephen, Simon, Magnus,
> > 	(see questions *** below!)
> > 
> > Currently the R-Car Clock Pulse Generator (CPG) drivers obtains the
> > state of the mode pins either by a call from the platform code, or
> > directly by using a hardcoded register access. This is a bit messy, and
> > creates a dependency between driver and platform code.
> > 
> > This patch series converts the various Renesas R-Car clock drivers
> > and support code from reading the mode pin states using a hardcoded
> > register access to using a new minimalistic R-Car RST driver.
> > 
> > All R-Car clock drivers will rely on the presence in DT of a device node
> > for the RST module.  Backwards compatibility with old DTBs is retained
> > only for R-Car Gen2, which has fallback code using its own private copy
> > of rcar_gen2_read_mode_pins().
> 
> I think you should add a binding doc even though the DT bindings are
> still trivial.

Disregard that, I literally sent this mail and a second later noticed
patch 1 for the first time.

regards
Philipp
