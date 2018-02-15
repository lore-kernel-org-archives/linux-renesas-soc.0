Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51544 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424040AbeBOQla (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 11:41:30 -0500
Date: Thu, 15 Feb 2018 17:41:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org,
        magnus.damm@gmail.com, linux-mmc@vger.kernel.org,
        marek.vasut@gmail.com
Subject: Re: [PATCH v2 2/2] arm64: dts: r8a77995: draak: enable SDHI2
Message-ID: <20180215164126.2n3cygiv6mm6mls3@verge.net.au>
References: <1511971606-580-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1511971606-580-3-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20171204212900.g75ahagudgzcsiyw@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171204212900.g75ahagudgzcsiyw@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 04, 2017 at 10:29:00PM +0100, Wolfram Sang wrote:
> On Wed, Nov 29, 2017 at 05:06:46PM +0100, Ulrich Hecht wrote:
> > The single SDHI controller is connected to eMMC.
> > 
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied now that patch 1/2 is in an rc release.
