Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33207 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751400AbcEILN0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 07:13:26 -0400
Received: by mail-lf0-f53.google.com with SMTP id y84so196541832lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 04:13:25 -0700 (PDT)
Subject: Re: [PATCH 05/10] clk: renesas: rcar-gen2: Obtain MD pin value using
 boot-mode-reg
To: Dirk Behme <dirk.behme@de.bosch.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
 <1462778041-19595-6-git-send-email-dirk.behme@de.bosch.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <903d5c12-032f-137a-d44d-d3154096d60a@cogentembedded.com>
Date: Mon, 9 May 2016 14:13:24 +0300
MIME-Version: 1.0
In-Reply-To: <1462778041-19595-6-git-send-email-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 5/9/2016 10:13 AM, Dirk Behme wrote:

> From: Simon Horman <horms+renesas@verge.net.au>
>
> Use new boot mode reg infrastructure to obtain the mode pin
> value for initialising clocks for for R-Car Gen2 SoCs.

    My spell-checker trips over "initialising". Perhaps initializing?

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

[...]

> @@ -421,9 +423,15 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
>  CLK_OF_DECLARE(rcar_gen2_cpg_clks, "renesas,rcar-gen2-cpg-clocks",
>  	       rcar_gen2_cpg_clocks_init);
>
> -void __init rcar_gen2_clocks_init(u32 mode)
> +void __init rcar_gen2_clocks_init(void)
>  {
> -	cpg_mode = mode;
> +	int err;
> +
> +	err = boot_mode_reg_get(&cpg_mode);
> +	if (err) {
> +		pr_err("%s: failed obtain boot mode\n", __func__);

    Failed to obtain?

[...]

MBR, Sergei
