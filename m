Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f51.google.com ([209.85.167.51]:44170 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbeH2TXO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 15:23:14 -0400
Received: by mail-lf1-f51.google.com with SMTP id g6-v6so4615687lfb.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Aug 2018 08:25:46 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 29 Aug 2018 17:25:41 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 1/2] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180829152541.GI15572@bigcity.dyn.berto.se>
References: <20180827151321.18015-1-niklas.soderlund+renesas@ragnatech.se>
 <20180827151321.18015-2-niklas.soderlund+renesas@ragnatech.se>
 <20180829071604.ougz57qvpliwodep@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180829071604.ougz57qvpliwodep@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback,

On 2018-08-29 09:16:04 +0200, Wolfram Sang wrote:
> 
> > +	/*
> > +	 * Skip checking SCC errors when running on 4 taps in HS400 mode as
> > +	 * any retuning would still result in the same 4 taps being used.
> > +	 */
> 
> Did you verify this? I didn't have the time to do so :(
> 

I tested it on M3-W ES1.0 and it H3 ES2.0 and it works as I expect it to 
do, but forcing a retune due to SCC error is beyond my skill-set. I 
checked the documentation and can't find anything contradicting 
Shimoda-sans information from the HW team. So to the best of my 
knowledge this is correct. On the other hand I can't find anything in 
the documentation which supports the claim from the HW team.

If you have any tips on how to better test this I'm more then happy to 
do the work. Also would you like me to post a v4 addressing Ulf's 
comment or wait until we are convinced this is the right path forward?

-- 
Regards,
Niklas S�derlund
