Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44453 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbeJITKL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Oct 2018 15:10:11 -0400
Date: Tue, 9 Oct 2018 13:53:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 net-next] ravb: do not write 1 to reserved bits
Message-ID: <20181009115327.sgq5rdbcpwcqbn6k@verge.net.au>
References: <20180918102226.8017-1-horms+renesas@verge.net.au>
 <5bddb393-3060-6d74-4cf1-3547cb87924e@cogentembedded.com>
 <CAMuHMdU_6uBpHOFshgxc61GOG1o1ibAoi5T1n_ZdYZ+=i8H5Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU_6uBpHOFshgxc61GOG1o1ibAoi5T1n_ZdYZ+=i8H5Sw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 09, 2018 at 11:28:40AM +0200, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Tue, Sep 18, 2018 at 6:55 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 09/18/2018 01:22 PM, Simon Horman wrote:
> > > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > > EtherAVB hardware requires 0 to be written to status register bits in
> > > order to clear them, however, care must be taken not to:
> > >
> > > 1. Clear other bits, by writing zero to them
> > > 2. Write one to reserved bits
> > >
> > > This patch corrects the ravb driver with respect to the second point above.
> > > This is done by defining reserved bit masks for the affected registers and,
> > > after auditing the code, ensure all sites that may write a one to a
> > > reserved bit use are suitably masked.
> > >
> > > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > [...]
> >
> > Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> > > diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> > > index 1470fc12282b..9b6bf557a2f5 100644
> > > --- a/drivers/net/ethernet/renesas/ravb.h
> > > +++ b/drivers/net/ethernet/renesas/ravb.h
> > > @@ -428,6 +428,7 @@ enum EIS_BIT {
> > >       EIS_CULF1       = 0x00000080,
> > >       EIS_TFFF        = 0x00000100,
> > >       EIS_QFS         = 0x00010000,
> > > +     EIS_RESERVED    = (GENMASK(31, 17) | GENMASK(15, 11)),
> >
> >    Well, I'm not a big fan of BIT() and GENMASK() -- they still lack a macro
> > to #define a bit/field value. But if you prefer to use them, OK, let's be so...
> 
> FIELD_PREP()?
> 
> Perhaps the other bit definitions should be converted to BIT()?
> That way it becomes much easier to match valid EIS_* bits with EIS_RESERVED.

+1
