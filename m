Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40193 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbeGRM4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 08:56:15 -0400
Received: by mail-lf0-f68.google.com with SMTP id y200-v6so3299367lfd.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jul 2018 05:18:35 -0700 (PDT)
Date: Wed, 18 Jul 2018 14:18:33 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180718121833.GQ10087@bigcity.dyn.berto.se>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
 <20180715184506.ldmrtu3evm6io4af@tetsubishi>
 <20180717144954.GL10087@bigcity.dyn.berto.se>
 <20180718094412.az5qgm7wyj2hknl4@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180718094412.az5qgm7wyj2hknl4@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2018-07-18 11:44:13 +0200, Wolfram Sang wrote:
> 
> > > One idea I have is to let the loop iterate only over tap_num and then
> > > use a mask 'BIT(i) | BIT(i+tap_num)' and work with binary operators
> > > then. But maybe there are also macros to test and clear bit patterns?
> > 
> > I agree that the loop is clumsy. Unfortunately I can't find any bitmap 
> > operations that work with bit patterns. If this where just integers the 
> > following would have been a better solution:
> > 
> >     mask = (1 << host->tap_num) - 1;
> >     taps = (host->taps & (host->taps >> host->tap_num)) & mask;
> >     host->taps = (taps << host->tap_num) | taps;
> 
> My above sketch doesn't work?
> 
> 	for (i = 0; i < host->tap_num; i++) {
> 		mask = BIT(i) | BIT(i + host->tap_num);
> 		if (host->taps & mask != mask)
> 			host->taps &= ~mask;
> 	}
> 
> Written from top of my head, maybe I overlooked something.
> 

Unfortunately not as host->taps is declared as a bitmap

    DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));

So trying your sketch results in errors.

drivers/mmc/host/renesas_sdhi_core.c:394:32: error: invalid operands to binary & (have 'long unsigned int *' and 'int')
                 if (host->taps & mask != mask)
                     ~~~~       ^ ~~~~~~~~~~~~
drivers/mmc/host/renesas_sdhi_core.c:395:36: error: assignment to expression with array type
                         host->taps &= ~mask;

I'm sure one could dereference the host->taps variable and do the bit 
operations but that feels like a bad idea. The other option is to use 
bitmap_{from,to}_arr32() to access the bitmap as 32 bit integers but 
that too feels odd and more complex then using the bitmap helper 
functions.

I will await your feedback before on this before I post the next version 
of this series.

-- 
Regards,
Niklas S�derlund
