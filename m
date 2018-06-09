Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35541 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbeFIJIk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jun 2018 05:08:40 -0400
Received: by mail-lf0-f67.google.com with SMTP id i15-v6so13207200lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Jun 2018 02:08:39 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/sh_cmt: wait for CMCNT on init
To: Biju Das <biju.das@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <1528474785-11778-1-git-send-email-biju.das@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4a274cfd-b5eb-b935-a3b5-af4bacd126c1@cogentembedded.com>
Date: Sat, 9 Jun 2018 12:08:37 +0300
MIME-Version: 1.0
In-Reply-To: <1528474785-11778-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 6/8/2018 7:19 PM, Biju Das wrote:

> As per section 57A.3.5/69A.3.5/79.A.3.5 of rz/g/r-car gen2/3 hardware

    79A.3.5?

> manual,it is mentioned that we need to provide 2 cycles in counter input
          ^ need space

> clock (RCLK) for reflecting written data to counter behaviour. Adding
> sufficient wait to let the CMCNT register value settle before starting the
> timer channel.
> 
> It fixes the error "sh_cmt ffca0000.timer: ch1: cannot clear CMCNT"
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> Hello,
> 
> During cmt testing, the tool (tools/testing/selftests/timers/clocksource-switch.c)
> is complaining about the error "sh_cmt ffca0000.timer: ch1: cannot clear CMCNT".
> The above patch fixes this issue is by adding sufficient wait to let the
> CMCNT register value settle before starting the timer channel.
> 
> This issue is reproduced on Koelsch/RZ/G1[ME] based iwave boards etc...,
> as I assume the same issue should be present on lager etc. as well?
> 
> regards,
> Biju
> 
>   drivers/clocksource/sh_cmt.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
> index 70b3cf8..48910df 100644
> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -328,7 +328,7 @@ static void sh_cmt_start_stop_ch(struct sh_cmt_channel *ch, int start)
>   
>   static int sh_cmt_enable(struct sh_cmt_channel *ch)
>   {
> -	int k, ret;
> +	int j, k, ret;
>   
>   	pm_runtime_get_sync(&ch->cmt->pdev->dev);
>   	dev_pm_syscore_device(&ch->cmt->pdev->dev, true);
> @@ -368,11 +368,17 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
>   	 * While at it, we're supposed to clear out the CMCNT as of this
>   	 * moment, so make sure it's processed properly here.  This will
>   	 * take RCLKx2 at maximum.
> +	 *
> +	 * Similar register access usage for CMCNT is mentioned in R-Car
> +	 * Gen[2/3]/RZ/G1 user's manual, RCLKx2 for cmt0 and RCLKx2 or
> +	 * CPϕx2 (CPEXϕx2)) for cmt1.
>   	 */
> -	for (k = 0; k < 100; k++) {
> -		if (!sh_cmt_read_cmcnt(ch))
> -			break;
> -		udelay(1);
> +	for (j = 0; j < 2; j++) {
> +		for (k = 0; k < 100; k++) {

    Why not simply count to 200 ISO 100?

> +			if (!sh_cmt_read_cmcnt(ch))
> +				break;
> +			udelay(1);
> +		}
>   	}
>   
>   	if (sh_cmt_read_cmcnt(ch)) {

MBR, Seregi
