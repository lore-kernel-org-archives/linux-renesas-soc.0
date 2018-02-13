Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45137 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933463AbeBMHoa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 02:44:30 -0500
Date: Tue, 13 Feb 2018 08:44:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: r7s72100: add soc node
Message-ID: <20180213074425.3rsj7fqa3squ6zn3@verge.net.au>
References: <20180212143930.4763-1-horms+renesas@verge.net.au>
 <CAMuHMdXbpRGmUCcfND2h4=g0v5Cj9L=VYZGVLntjbBgsN4Q4HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXbpRGmUCcfND2h4=g0v5Cj9L=VYZGVLntjbBgsN4Q4HA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 12, 2018 at 04:12:02PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Feb 12, 2018 at 3:39 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > this patchset adds an soc node, moves all nodes for IP blocks with an
> > address on the bus to be sub nodes of the soc node, removes the clock node
> > and sorts subnodes of the root and soc nodes.
> >
> > This brings the DTS of the r7s72100 in line with that of R-Car Gen 2 SoCs.
> >
> > Simon Horman (4):
> >   ARM: dts: r7s72100: add soc node
> >   ARM: dts: r7s72100: sort subnodes of soc node
> >   ARM: dts: r7s72100: stop grouping clocks under a "clocks" subnode
> >   ARM: dts: r7s72100: sort subnodes of root node
> 
> Thanks!
> 
> >  arch/arm/boot/dts/r7s72100.dtsi | 1038 ++++++++++++++++++++-------------------
> >  1 file changed, 521 insertions(+), 517 deletions(-)
> 
> For the whole series, with a bit of help from dtx_diff:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
