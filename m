Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32877 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbeGQNyk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 09:54:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id s12-v6so988984ljj.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 06:22:00 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 17 Jul 2018 15:21:58 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mmc: {tmio,renesas_sdhi}: fix tuning behavior
Message-ID: <20180717132158.GJ10087@bigcity.dyn.berto.se>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180715184526.fd4zrr4v2mh4ady3@tetsubishi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180715184526.fd4zrr4v2mh4ady3@tetsubishi>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-07-15 20:45:26 +0200, Wolfram Sang wrote:
> > Tuning failed on my R-Car H3 ES2.0 board using latest mmc/next while the
> > Renesas BSP kernel worked. After some digging I found patches in the BSP
> > which remedied this and whit these applied tuning now works for me.
> > 
> > I have done small fixes, updated commit messages and rebased on latest
> > mmc/next but Hayakawa-san did all the real work.
> 
> Thanks, Niklas. Did you also test some SD card accesses? It helped with
> your "stubborn" card, too, or?
> 

Yes I did a lot of testing and as you mention patch 1/4 fixes the 
problem I have experienced with my "stubborn" card.

-- 
Regards,
Niklas S�derlund
