Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F9FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 13:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 838A42087C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 13:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="NSgL0LeV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfCHNkr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 08:40:47 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:48993 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbfCHNkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 08:40:47 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8F88C25B7E1;
        Sat,  9 Mar 2019 00:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552052445; bh=qoiuMKbxNVSwQfaAGgMlvVXkC/7uBiV+7fbzXOny0FE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NSgL0LeVQeps0jJzVa81W6UE6t9o76VpOICh8e/naL9izAeLSe1X+psJNtBrXiVzm
         3hkA0rgQHxIqaH2u+o4TKeBIYm6ykkYjNrQ4v72nGuD3e+Ex/LbkPSmSBaj0h4MqzH
         zRndMZNhzrf2A/slZW4agThYyOZ8y5HhSCQLpgKw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A26CE940270; Fri,  8 Mar 2019 14:40:43 +0100 (CET)
Date:   Fri, 8 Mar 2019 14:40:43 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
Message-ID: <20190308134043.alpxgnujj6ppmczc@verge.net.au>
References: <20190303190059.31155-1-marek.vasut@gmail.com>
 <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
 <20190304105705.GA1000@kunai>
 <e5be6861-70d1-e60e-4838-a89b219bee05@gmail.com>
 <20190304111349.GB1000@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190304111349.GB1000@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 04, 2019 at 12:13:49PM +0100, Wolfram Sang wrote:
> On Mon, Mar 04, 2019 at 11:59:48AM +0100, Marek Vasut wrote:
> > On 3/4/19 11:57 AM, Wolfram Sang wrote:
> > > 
> > >>> Add DA9063 PMIC node to the I2C bus.
> > >>>
> > >>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > >>
> > >> Thanks for your patch!
> > >>
> > >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > 
> > > Thanks for CCing me, I didn't get and missed the original patch.
> > > 
> > >>> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> > >>> @@ -377,6 +377,27 @@
> > >>>         pinctrl-names = "i2c-exio4";
> > >>>  };
> > >>>
> > >>> +&i2c7 {
> > >>> +       status = "okay";
> > >>> +       clock-frequency = <100000>;
> > >>
> > >> According to the DA9063 datasheet, the PMIC supports up to 400 kHz.
> > >> It looks like there are no other devices on the bus.
> > >>
> > >> Wolfram, what's your stance on this?
> > > 
> > > Yes, please. I thought this was standard on Gen2 IIC_DVFS busses, but
> > > seems not. Probably it slipped through the cracks.
> > 
> > Do we want to update all of the other boards too ?
> > 
> > I'd be cautious about the DVFS I2C, running faster while talking to the
> > PMIC and reading/writing a few registers brings little benefit, while
> > the signal integrity might be impacted.
> 
> Can be argued. I think if we would apply some testing on top of this
> change, we will find that it will work. But we would in deed need this
> testing as verification, and this is not our top priority project. But
> if someone feels like running some i2c dumping over night, well,
> why not..

Thanks,

I've applied this patch for v5.2.
We can do a sweep of frequency updates as a follow-up if we decide
that is the right way to go.
