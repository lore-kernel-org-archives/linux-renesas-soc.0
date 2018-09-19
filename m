Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43140 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbeISOud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:50:33 -0400
Date: Wed, 19 Sep 2018 11:13:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V6] ARM: shmobile: Rework the PMIC IRQ line quirk
Message-ID: <20180919091330.yxnehm2fy5llb2bb@verge.net.au>
References: <20180918122340.5478-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdVOMZ+o4osu7zGJm3YBQ-Mxest1kkJGgiH53joW1i__jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVOMZ+o4osu7zGJm3YBQ-Mxest1kkJGgiH53joW1i__jg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 18, 2018 at 02:52:53PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 18, 2018 at 2:23 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> > Rather than hard-coding the quirk topology, which stopped scaling,
> > parse the information from DT. The code looks for all compatible
> > PMICs -- da9063 and da9210 -- and checks if their IRQ line is tied
> > to the same pin. If so, the code sends a matching sequence to the
> > PMIC to deassert the IRQ.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (on Koelsch)
> > ---
> > V2: - Replace the DT shared IRQ check loop with memcmp()
> >     - Send the I2C message to deassert the IRQ line to all PMICs
> >       in the list with shared IRQ line instead of just one
> >     - Add comment that this works only in case all the PMICs are
> >       on the same I2C bus
> > V3: - Drop the addr = 0x00 init
> >     - Drop reinit of argsa in rcar_gen2_regulator_quirk
> > V4: - Squash regulator_quirk on single line
> >     - Drop !np check in for_each_matching_node_and_match()
> >     - Use argsa in of_irq_parse_one
> > V5: - Check kzalloc failure
> >     - Rename da...._msgs to da...._msg
> >     - Don't reinit quirk->shared
> > V6: - Skip invalid entries instead of aborting on them
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.20.

Marek, these days checkpatch complains if the author of the patch does not
have a signed offline, and the inconsistency between your
from and Sign-off the email address trips that check.

Could you consider either a) enhancing checkpatch or b) using
the same address twice? No need to take any action for this patch.
