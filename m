Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43754 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731595AbeGQPW6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 11:22:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id r13-v6so1240001ljg.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 07:49:56 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 17 Jul 2018 16:49:54 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180717144954.GL10087@bigcity.dyn.berto.se>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
 <20180715184506.ldmrtu3evm6io4af@tetsubishi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180715184506.ldmrtu3evm6io4af@tetsubishi>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2018-07-15 20:45:06 +0200, Wolfram Sang wrote:
> On Thu, Jul 05, 2018 at 04:18:40PM +0200, Niklas S�derlund wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > 
> > When tuning each tap is issued CMD19 twice and the result of both runs
> > recorded in host->taps. If the result is different between the two runs
> > the wrong sampling clock position was selected. Fix this by merging the
> > two runs and only keep the result for each tap if it was good in both
> > sets.
> > 
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > [Niklas: update commit message]
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Much better commit message.
> 
> 
> > +	for (i = 0; i < host->tap_num * 2; i++) {
> > +		if (!test_bit(i, host->taps)) {
> > +			clear_bit(i % host->tap_num, host->taps);
> > +			clear_bit((i % host->tap_num) + host->tap_num,
> > +				  host->taps);
> > +		}
> > +	}
> 
> I just think the code is a bit clumsy maybe?
> 
> a) it clears the bit which is already cleared
> b) if a bit in the first half clears a bit in the second half,
>    they will both be cleared again when the loop processes the
>    second half
> 
> One idea I have is to let the loop iterate only over tap_num and then
> use a mask 'BIT(i) | BIT(i+tap_num)' and work with binary operators
> then. But maybe there are also macros to test and clear bit patterns?

I agree that the loop is clumsy. Unfortunately I can't find any bitmap 
operations that work with bit patterns. If this where just integers the 
following would have been a better solution:

    mask = (1 << host->tap_num) - 1;
    taps = (host->taps & (host->taps >> host->tap_num)) & mask;
    host->taps = (taps << host->tap_num) | taps;

Doing the same using the bitmap operations turns out to be more complex 
then the original loop. There is the option of using the 
bitmap_{from,to}_arr32() and use the bit operations above but that would 
limit the code to 16 taps. And that would deprive the value of using the 
bitmap in the first place.

However, I have reworked the loop to be easier to read and only use one 
clear_bit(). Hopefully this will make it less clumsy, if anyone know of 
a better way to handle this please let me know.

    for (i = 0; i < host->tap_num * 2; i++) {
	    int offset = host->tap_num * (i < host->tap_num ? 1 : -1);

	    if (!test_bit(i, host->taps))
		    clear_bit(i + offset, host->taps);
    }

> 
> And Geert's comment.
> 

-- 
Regards,
Niklas S�derlund
