Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55432 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbeIRM1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 08:27:43 -0400
Date: Tue, 18 Sep 2018 08:56:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Subject: Re: [PATCH net-next] ravb: do not write 1 to reserved bits
Message-ID: <20180918065603.gtogr3q5puyjxf7k@verge.net.au>
References: <20180917151911.25450-1-horms+renesas@verge.net.au>
 <12758acf-6444-47eb-ad74-170034959bd7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12758acf-6444-47eb-ad74-170034959bd7@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 08:58:52PM +0300, Sergei Shtylyov wrote:
> On 09/17/2018 06:19 PM, Simon Horman wrote:
> 
> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > 
> > EtherAVB hardware requires 0 to be written to status register bits in
> > order to clear them, however, care must be taken not to:
> > 
> > 1. Clear other bits, by writing zero to them
> > 2. Write one to reserved bits
> > 
> > This patch corrects the ravb driver with respect to the second point above.
> > This is done by defining reserved bit masks for the affected registers and,
> > after auditing the code, ensure all sites that may write a one to a
> > reserved bit use are suitably masked.
> > 
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > v2 [Simon Horman]
> > * Cover ravb_timestamp_interrupt() by this change
> > * Use enum value rather than #define for reserved masks
> > * Reword changelog
> > 
> > v1 [Kazuya Mizuguchi]
> > ---
> >  drivers/net/ethernet/renesas/ravb.h      |  6 ++++++
> >  drivers/net/ethernet/renesas/ravb_main.c | 11 ++++++-----
> >  drivers/net/ethernet/renesas/ravb_ptp.c  |  2 +-
> >  3 files changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> > index 1470fc12282b..bca219edcf94 100644
> > --- a/drivers/net/ethernet/renesas/ravb.h
> > +++ b/drivers/net/ethernet/renesas/ravb.h
> > @@ -428,6 +428,7 @@ enum EIS_BIT {
> >  	EIS_CULF1	= 0x00000080,
> >  	EIS_TFFF	= 0x00000100,
> >  	EIS_QFS		= 0x00010000,
> > +	EIS_RESERVED	= (u32)(GENMASK(31, 17) | GENMASK(15, 11)),
> 
>    Are you sure those (u32) casts are necessary? Happily builds in both 32- and 64-bit
> mode without them... 
> 
> [...]
> > @@ -528,6 +530,7 @@ enum RIS2_BIT {
> >  	RIS2_QFF16	= 0x00010000,
> >  	RIS2_QFF17	= 0x00020000,
> >  	RIS2_RFFF	= 0x80000000,
> > +	RIS2_RESERVED	= (u32)GENMASK_ULL(30, 18),
> 
>    Why GENMASK_ULL() suddenly? Doesn't seem needed at all...
> 
> [...]
> > @@ -544,6 +547,8 @@ enum TIS_BIT {
> >  	TIS_FTF1	= 0x00000002,	/* Undocumented? */
> >  	TIS_TFUF	= 0x00000100,
> >  	TIS_TFWF	= 0x00000200,
> > +	TIS_RESERVED	= (u32)(GENMASK_ULL(31, 20) | GENMASK_ULL(15, 12) | \
> > +				GENMASK_ULL(7, 4))
> 
>    Same question.

Thanks Sergei,

I agree GENMASK() without any cast should be sufficient in all
of the above cases. I'll respin accordingly.
