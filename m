Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:49217 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1751188AbdASTuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 14:50:11 -0500
Date: Thu, 19 Jan 2017 20:42:02 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [RFC 3/3] mmc: tmio: discard obsolete SDIO irqs before enabling
 irqs
Message-ID: <20170119194202.axqr6mz5d5m6xtaj@ninjato>
References: <20170105114326.12426-1-wsa+renesas@sang-engineering.com>
 <20170105114326.12426-4-wsa+renesas@sang-engineering.com>
 <20170110080919.GE25239@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20170110080919.GE25239@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> > +		if (host->pdata->flags & TMIO_MMC_SDIO_STATUS_SETBITS)
> > +			sdio_status |= 6;
> 
> Perhaps a #define would be an improvement over "6".

OK.
