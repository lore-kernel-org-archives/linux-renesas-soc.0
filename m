Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33721 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbeGZO7h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 10:59:37 -0400
Date: Thu, 26 Jul 2018 15:42:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] arm64: dts: enable SATA on Gen3 boards
Message-ID: <20180726134237.plj7fi2w5ui2xmoa@verge.net.au>
References: <20180725193457.3999-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180725193457.3999-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 25, 2018 at 09:34:55PM +0200, Wolfram Sang wrote:
> Since Geert also argumented that it is reasonable to have this in the board DTS
> files [1], I converted the RFC into proper patches. So, SATA will be available
> out of the box for H3 and M3-N if MD12 is switched off properly.
> 
> Patches are bases on current renesas-drivers/master. M3-N has been tested
> successfully, too.
> 
> [1] https://patchwork.kernel.org/patch/10131041/
> 
> Changes since RFC:
> 
> * added comments
> * kept the sorting
> * used GPIO macros instead of hardcoded values
> * added Geert's tag
> * added a patch for M3-N, too
> 
> Wolfram Sang (2):
>   arm64: dts: r8a7795: salvator-xs: enable SATA
>   arm64: dts: r8a77965: salvator-xs: enable SATA

Thanks, this looks fine to me Fundamentally these patches are doing the
same things to two (related) pieces of hardware. So as part of "project
squash" please squash the two patches into one.
