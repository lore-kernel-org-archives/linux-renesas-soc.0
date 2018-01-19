Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45335 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751424AbeASKJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 05:09:30 -0500
Date: Fri, 19 Jan 2018 11:09:10 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/16] ARM: r8a7790: add soc node
Message-ID: <20180119100909.ieblxu4cjgn7hmao@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au>
 <CAMuHMdWGZ-kN1Kb-w9KAWD+0c8ccF7B5WE0gLhv4PNi41B6XWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWGZ-kN1Kb-w9KAWD+0c8ccF7B5WE0gLhv4PNi41B6XWg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 19, 2018 at 10:41:17AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jan 17, 2018 at 5:17 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > this patchset adds an soc node, moves all nodes for IP blocks with an
> > address on the bus to be sub nodes of the soc node, and sorts subnodes of
> > the root and soc nodes.
> >
> > The use of an soc node is consistent with handling of R-Car Gen3, RZ/G1,
> > and R-Car V2H (R8A77920) SoCs upstream. This patch-set adds it for all
> > other R-Car Gen2 SoCs: r8a7790 (H2), r8a7791 (M2-W), r8a7793 (M2-N),
> > r8a7794 (E2).
> >
> > Sorting of nodes is also done for the R-Car V2H (R8A77920), making it
> > consistent across all R-Car Gen2 SoCs and thus allowing easier comparison
> > of DTs of different R-Car Gen2 SoCs.
> >
> > The patchset also fixes some minor whitespace problems.
> 
> Thank you, this is a great cleanup!
> 
> Now the structure of the DTSes is the same for all SoCs, they can be
> compared more easily using my soc-dts-diff script (which BTW also works
> for e.g. driver source files using the <soc>-<module>.c pattern).

Thanks, this seems very nice.

I have applied this series.
