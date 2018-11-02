Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51752 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbeKBVET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:04:19 -0400
Date: Fri, 2 Nov 2018 12:57:19 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Message-ID: <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
 <20181101194528.GS2433@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181101194528.GS2433@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 01, 2018 at 08:45:29PM +0100, Wolfram Sang wrote:
> 
> > This patch have quiet a few dependencies I'm afraid, let me know if you 
> > wish to be notified once they all upstream. I don't think it's a good 
> > idea to pick this up before all dependencies are resolved.
> 
> Yes, we should do that. Ping Simon once all dependencies are in next. It
> is still fine to have this patch here in case people want to test. BTW
> did you mention your branch somewhere where you collected all these
> patches to make HS400 working/enabled?
> 
> For this patch already:
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, I am marking this as deferred.

Please repost or ping me once the dependencies are present in
an rc release.
