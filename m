Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388248AbeGXN0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 09:26:16 -0400
Date: Tue, 24 Jul 2018 14:19:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180724121958.bgbhcoul7a2igjqb@verge.net.au>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-4-niklas.soderlund+renesas@ragnatech.se>
 <20180724112634.amylptym4mkgh3ym@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180724112634.amylptym4mkgh3ym@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 01:26:34PM +0200, Wolfram Sang wrote:
> On Tue, Jul 17, 2018 at 04:52:15PM +0200, Niklas Söderlund wrote:
> > When tuning each tap is issued CMD19 twice and the result of both runs
> > recorded in host->taps. If the result is different between the two runs
> > the wrong sampling clock position was selected. Fix this by merging the
> > two runs and only keep the result for each tap if it was good in both
> > sets.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> So, I tested this patch without having patch 2 applied and it worked:
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Ulf, I think patches 1 & 3 are good and should be applied to 4.18 with
> stable attached.
> 
> And I wonder if it was easier if I'd send you pull requests now that we
> are working with even more developers on SDHI? Simon, Niklas, what do
> you think?

Of course its up to Ulf but from my point of view it would
make sense for you to coordinate things at least for now.
