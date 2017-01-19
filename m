Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:49145 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1754417AbdASTmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 14:42:23 -0500
Date: Thu, 19 Jan 2017 20:40:35 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [RFC 2/3] mmc: host: tmio: SDIO_STATUS_QUIRK is rather
 SDIO_STATUS_SETBITS
Message-ID: <20170119194035.2n2upfxnjfrylena@ninjato>
References: <20170105114326.12426-1-wsa+renesas@sang-engineering.com>
 <20170105114326.12426-3-wsa+renesas@sang-engineering.com>
 <20170110080740.GD25239@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20170110080740.GD25239@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> > --- a/include/linux/mfd/tmio.h
> > +++ b/include/linux/mfd/tmio.h
> > @@ -97,7 +97,7 @@
> >  /*
> >   * Some controllers needs to set 1 on SDIO status reserved bits
> >   */
> 
> Is the following update to the above appropriate?
> In particular, is it some or all?

Some.

>     * Controllers need to set 1 on SDIO status reserved bits

I updated this and the other comment to be more precise. Thanks!
