Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50801 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750992AbeEPH0N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 03:26:13 -0400
Date: Wed, 16 May 2018 09:26:10 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT] arm64: dts: r8a77965: add I2C support
Message-ID: <20180516072609.4uqexjuta3unruy2@verge.net.au>
References: <20180511140029.16419-1-niklas.soderlund+renesas@ragnatech.se>
 <20180513081913.3o57lab2nkwz2m7x@verge.net.au>
 <20180513114833.GO18974@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180513114833.GO18974@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 13, 2018 at 01:48:33PM +0200, Niklas Söderlund wrote:
> Hi Simon,
> 
> On 2018-05-13 10:19:13 +0200, Simon Horman wrote:
> > On Fri, May 11, 2018 at 04:00:29PM +0200, Niklas Söderlund wrote:
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 99 ++++++++++++++++++++---
> > >  1 file changed, 90 insertions(+), 9 deletions(-)
> > > 
> > > Hi Simon,
> > > 
> > > I have only tested i2c4 and the adv7482 which is connected there. But it 
> > > seemed silly to post this patch without enable all i2c as they are 
> > > according to the datasheet are the same as on H3 and M3-W.
> > 
> > Thanks Niklas,
> > 
> > I agree this makes sense. Do we have any way to test those nodes?
> 
> Looking at the DT for M3-N the i2c busses used are i2c2 and i2c4. I 
> already verified i2c4 and for i2c2 it turned out some PFC parts where 
> missing, I just sent a patch for that [1]. Using that patch i2c2 also 
> successfully finds the devices described in DT.
> 
> > If not I'm inclined to accept the patch without testing.
> 
> I also think it would be OK for you to pickup this patch without testing 
> all the buses.
> 
> 1. [PATCH] pinctrl: sh-pfc: r8a77965: Add I2C pin support

Thanks, applied.
