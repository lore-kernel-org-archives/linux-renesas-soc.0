Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45487 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751370AbdHKIrX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 04:47:23 -0400
Date: Fri, 11 Aug 2017 10:47:02 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFT 0/2] mmc: renesas_sdhi: small patches for RZ/A1
Message-ID: <20170811084701.GA20909@verge.net.au>
References: <20170809191452.5254-1-wsa+renesas@sang-engineering.com>
 <SG2PR06MB116509EEC14B9FF771BA28308A880@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR06MB116509EEC14B9FF771BA28308A880@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 10, 2017 at 12:59:05PM +0000, Chris Brandt wrote:
> Hello Wolfram,
> 
> 
> On Wednesday, August 09, 2017, Wolfram Sang wrote:
> > Here is a small series to improve RZ support for SDHI. I don't have that
> > platform currently, so I hope Chris has some time to check these simple
> > patches. It is based on top of the patch just sent out:
> > "[PATCH] mmc: renesas_sdhi: use extra flag for CBSY usage"
> 
> 
> I applied the 3 patches and tested with an SD Card. No issues.
> 
> Thank you for considering RZ!

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
