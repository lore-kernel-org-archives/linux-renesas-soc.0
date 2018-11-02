Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51690 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbeKBVBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:01:07 -0400
Date: Fri, 2 Nov 2018 12:54:06 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 0/3] mmc: renesas_sdhi: extend quirk selection to
 handle ES revisions
Message-ID: <20181102115406.2vasx3tfauq5dyg3@verge.net.au>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
 <20181101193415.GK2433@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181101193415.GK2433@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 01, 2018 at 08:34:16PM +0100, Wolfram Sang wrote:
> 
> > Patch 1/3 adds support to select quirks based on SoC + ES revision using 
> > soc_device_match() and converts the only existing quirk. Patch 2/3 
> > Removes the old method to select quirk based on compatibility string.  
> > While Patch 3/3 adds a new quirk from the BSP which blacklists some 
> > known problematic ES versions for HS400. HS400 is not yet enabled 
> > upstream so blacklisting these ES versions is not a regression of 
> > functionality.
> 
> This will allow us even to get rid of the TMIO_MMC_HAVE_4TAP_HS400 flag
> entirely because we now use it only within the Renesas part of SDHI. We
> want to do this incrementally, though, because we first want to get the
> HS400 feature enabled as the first step.

Thanks, this looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
