Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:46703 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbeEMLsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 07:48:37 -0400
Received: by mail-lf0-f66.google.com with SMTP id 16-v6so4392110lfs.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 May 2018 04:48:36 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Sun, 13 May 2018 13:48:33 +0200
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT] arm64: dts: r8a77965: add I2C support
Message-ID: <20180513114833.GO18974@bigcity.dyn.berto.se>
References: <20180511140029.16419-1-niklas.soderlund+renesas@ragnatech.se>
 <20180513081913.3o57lab2nkwz2m7x@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180513081913.3o57lab2nkwz2m7x@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 2018-05-13 10:19:13 +0200, Simon Horman wrote:
> On Fri, May 11, 2018 at 04:00:29PM +0200, Niklas S�derlund wrote:
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 99 ++++++++++++++++++++---
> >  1 file changed, 90 insertions(+), 9 deletions(-)
> > 
> > Hi Simon,
> > 
> > I have only tested i2c4 and the adv7482 which is connected there. But it 
> > seemed silly to post this patch without enable all i2c as they are 
> > according to the datasheet are the same as on H3 and M3-W.
> 
> Thanks Niklas,
> 
> I agree this makes sense. Do we have any way to test those nodes?

Looking at the DT for M3-N the i2c busses used are i2c2 and i2c4. I 
already verified i2c4 and for i2c2 it turned out some PFC parts where 
missing, I just sent a patch for that [1]. Using that patch i2c2 also 
successfully finds the devices described in DT.

> If not I'm inclined to accept the patch without testing.

I also think it would be OK for you to pickup this patch without testing 
all the buses.

1. [PATCH] pinctrl: sh-pfc: r8a77965: Add I2C pin support

-- 
Regards,
Niklas S�derlund
