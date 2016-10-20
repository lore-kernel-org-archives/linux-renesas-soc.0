Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45001 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934058AbcJTJVg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 05:21:36 -0400
Date: Thu, 20 Oct 2016 11:21:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 0/2] arm64: dts: add support for eMMC with 8 bit bus
 width
Message-ID: <20161020092130.GL4612@verge.net.au>
References: <20161016082748.2850-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161016082748.2850-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 16, 2016 at 10:27:46AM +0200, Wolfram Sang wrote:
> From: Wolfram Sang <wsa@the-dreams.de>
> 
> Since the MMC core parts for eMMC 8 bit support are now upstream, we can also
> pull in the DTS changes. The patches are also in renesas/drivers
> (0dca0dbaac8269 and 9dea74f4b9eb79), so could be picked from there?

Thanks, I cherry picked the commits above as it made it easier
to resolve conflicts. Please check to make sure I got it right.

> Change since V2:
> 
> Fixed a duplicate node name to be unique (Thanks Sergei!)
> 
> Wolfram Sang (2):
>   arm64: dts: r8a7795: salvator: enable on-board eMMC
>   arm64: dts: r8a7796: salvator: enable on board eMMC
> 
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 43 +++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 44 +++++++++++++++++++++-
>  2 files changed, 86 insertions(+), 1 deletion(-)
> 
> -- 
> 2.9.3
> 
