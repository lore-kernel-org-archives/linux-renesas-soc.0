Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37774 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753589AbcKIOfP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 09:35:15 -0500
Date: Wed, 9 Nov 2016 15:35:08 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 00/14] ARM: dts: r8a779x: use demuxer for I2C
Message-ID: <20161109143508.GA19184@verge.net.au>
References: <20161106202032.5227-1-wsa+renesas@sang-engineering.com>
 <20161109084406.GA22213@verge.net.au>
 <20161109085954.GA1807@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161109085954.GA1807@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 09, 2016 at 09:59:54AM +0100, Wolfram Sang wrote:
> Hi Simon,
> 
> > I have tested these patches on alt, gose, lager and koelsch.
> 
> Wow, that was quick. Thank you!
> 
> > The switching part seems to work fine, in so far as my test script
> > succeeds. However, it seems that some IP blocks are not able to handle
> > this switching. In particular I needed to disable VIDEO_RCAR_VIN and 
> > REGULATOR_DA9210 to avoid errors shown in the logs below.
> 
> Yes. Probably we should activate the shiny new DEBUG_TEST_DRIVER_REMOVE
> and if that passes, we should be safe.
> 
> > My suggestion is to drop the following patches until those problems
> > can be sorted out, most likely via driver updates.
> > 
> > ARM: dts: alt: use demuxer for I2C1
> > ARM: dts: gose: use demuxer for I2C2
> > ARM: dts: lager: use demuxer for IIC2/I2C2
> > ARM: dts: lager: use demuxer for IIC3/I2C3
> > ARM: dts: koelsch: use demuxer for I2C2
> 
> OK. I'll try to have a look at those drivers nonetheless, because
> rebasing these patches is a bit of a hazzle once new i2c slaves were
> added to the busses. But I'll juest resend the patches along with my
> fixes if I really can find the time.
> 
> > I am not in a position to test silk or porter at this time.
> > But by the same reasoning above I wonder if the following should
> > be dropped for now.
> > 
> > ARM: dts: gose: use demuxer for I2C2
> 
> I assume you mean 'porter' here.

Yes, I meant porter.

> > ARM: dts: silk: use demuxer for I2C1
> 
> Will you get access to these boards in the foreseeable future?

As mentioned by Geert, there is a porter in Magnus's board farm.
Unforunately I have never had much luck in getting it to boot.

With regards to silk, I'm not aware of any plans at this time.
