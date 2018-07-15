Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50232 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726745AbeGOTI6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Jul 2018 15:08:58 -0400
Date: Sun, 15 Jul 2018 20:45:06 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180715184506.ldmrtu3evm6io4af@tetsubishi>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 05, 2018 at 04:18:40PM +0200, Niklas Söderlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> When tuning each tap is issued CMD19 twice and the result of both runs
> recorded in host->taps. If the result is different between the two runs
> the wrong sampling clock position was selected. Fix this by merging the
> two runs and only keep the result for each tap if it was good in both
> sets.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Much better commit message.


> +	for (i = 0; i < host->tap_num * 2; i++) {
> +		if (!test_bit(i, host->taps)) {
> +			clear_bit(i % host->tap_num, host->taps);
> +			clear_bit((i % host->tap_num) + host->tap_num,
> +				  host->taps);
> +		}
> +	}

I just think the code is a bit clumsy maybe?

a) it clears the bit which is already cleared
b) if a bit in the first half clears a bit in the second half,
   they will both be cleared again when the loop processes the
   second half

One idea I have is to let the loop iterate only over tap_num and then
use a mask 'BIT(i) | BIT(i+tap_num)' and work with binary operators
then. But maybe there are also macros to test and clear bit patterns?

And Geert's comment.
