Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45582 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388522AbeGXQEr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 12:04:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id j143-v6so3184404lfj.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jul 2018 07:57:54 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 24 Jul 2018 16:57:52 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180724145752.GM1432@bigcity.dyn.berto.se>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-4-niklas.soderlund+renesas@ragnatech.se>
 <20180724112634.amylptym4mkgh3ym@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180724112634.amylptym4mkgh3ym@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2018-07-24 13:26:34 +0200, Wolfram Sang wrote:
> On Tue, Jul 17, 2018 at 04:52:15PM +0200, Niklas S�derlund wrote:
> > When tuning each tap is issued CMD19 twice and the result of both runs
> > recorded in host->taps. If the result is different between the two runs
> > the wrong sampling clock position was selected. Fix this by merging the
> > two runs and only keep the result for each tap if it was good in both
> > sets.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> So, I tested this patch without having patch 2 applied and it worked:
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Ulf, I think patches 1 & 3 are good and should be applied to 4.18 with
> stable attached.

I have collected all tags and broken out 1 and 3 to a v4 of this series 
for easy consumption for either you or Ulf. And I'm working on updating 
2 and 4.

> 
> And I wonder if it was easier if I'd send you pull requests now that we
> are working with even more developers on SDHI? Simon, Niklas, what do
> you think?
> 

For me this approach would be great but as Simon points out maybe Ulf 
have a different idea. If you end up collecting and sending pull 
requests can you provide a public branch of the patches you have sent PR 
for so I can base my work upon that to avoid potential merge conflicts?

-- 
Regards,
Niklas S�derlund
