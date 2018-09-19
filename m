Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43397 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbeISPBo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 11:01:44 -0400
Date: Wed, 19 Sep 2018 11:24:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 01/03] dt-bindings: arm: consistently name SH-Mobile AG5
 as R8A73A00
Message-ID: <20180919092439.o7sisnsjmkeq5ggh@verge.net.au>
References: <153717356234.480.6698281193817518888.sendpatchset@octo>
 <153717357067.480.7556586771925219502.sendpatchset@octo>
 <CAMuHMdU6Gh3kUmKRxCQQfaXSq-70QZF6CHZhgLxtFs7+gEJsYQ@mail.gmail.com>
 <20180919083057.ch5zq76d3qxdz55t@verge.net.au>
 <CAMuHMdUSPLC10Vbv0Vh2yTSjD1uK623a92WknoqFOTp-P3nh-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUSPLC10Vbv0Vh2yTSjD1uK623a92WknoqFOTp-P3nh-A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 10:43:53AM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 19, 2018 at 10:31 AM Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Sep 17, 2018 at 01:20:57PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Sep 17, 2018 at 10:39 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > > > From: Magnus Damm <damm@opensource.se>
> > > >
> > > > Update the description of the AG5 entry to follow same style as other SoCs.
> > > >
> > > > The actual DT binding remains unchanged.
> > > >
> > > > Signed-off-by: Magnus Damm <damm@opensource.se>
> > >
> > > Thanks for your patch!
> > >
> > > Do you plan to update the other occurrences under
> > > Documentation/devicetree/bindings/, too?
> >
> > Which occurrences are you concerned about?
> 
> git grep SH73A0 -- Documentation/devicetree/bindings/
> 
> I have mixed feelings about this patch. AFAIU, it was called SH73A0 originally,
> but renamed R8A73A0 after SuperHitachi and successors morphed into Renesas?

Thanks.

I agree that we should strive to be consistent.
Lets see if anyone has some more information regarding the
history of the name for this SoC.
