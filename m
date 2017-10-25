Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:59357 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751403AbdJYGMT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 02:12:19 -0400
Subject: clk: r8a7795: Why to read EXTAL* from DT? (was: Re: [PATCH v6 5/5]
 clk: shmobile: r8a7795: Add new CPG/MSSR driver)
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: <linux-renesas-soc@vger.kernel.org>
References: <1447343686-2038-1-git-send-email-geert+renesas@glider.be>
 <1447343686-2038-6-git-send-email-geert+renesas@glider.be>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <80b63a20-1f04-8dc9-874f-434bf096ef0b@de.bosch.com>
Date: Wed, 25 Oct 2017 08:12:16 +0200
MIME-Version: 1.0
In-Reply-To: <1447343686-2038-6-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

today, I want to learn some history ;)

On 12.11.2015 16:54, Geert Uytterhoeven wrote:
> Add a new R-Car H3 Clock Pulse Generator / Module Standby and Software
> Reset driver, using the new CPG/MSSR driver core.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
...
> diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> new file mode 100644
> index 0000000000000000..57c413635d1af135
> --- /dev/null
> +++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
...
> +static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
> +	/* External Clock Inputs */
> +	DEF_INPUT("extal",  CLK_EXTAL),
> +	DEF_INPUT("extalr", CLK_EXTALR),


Why do we read the extal* frequencies from DT and don't auto detect them 
based on the MD pins?

Yesterday, I spent two hours debugging a clock issue due to a wrong DT 
because the hardware guys populated a different EXTAL oscillator. I 
would have saved this time if it would have been auto detected.

Best regards

Dirk
