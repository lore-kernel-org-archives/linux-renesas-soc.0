Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:45735 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751310AbeCTTEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 15:04:44 -0400
Received: by mail-lf0-f43.google.com with SMTP id h127-v6so4221035lfg.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 12:04:43 -0700 (PDT)
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Adjust r8a77980 ifdef
To: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org, geert+renesas@glider.be,
        vladimir.barinov@cogentembedded.com, horms+renesas@verge.net.au
References: <152153161677.8310.9675462405281337962.sendpatchset@little-apple>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e381eeea-7986-d980-fc02-354a80f8f58b@cogentembedded.com>
Date: Tue, 20 Mar 2018 22:04:40 +0300
MIME-Version: 1.0
In-Reply-To: <152153161677.8310.9675462405281337962.sendpatchset@little-apple>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 03/20/2018 10:40 AM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Adjust the R8A77980-specific #ifdefs to use CLK instead of ARCH
> to follow same style as other SoCs.

   I guess we should add:

Fixes: ce15783c510a ("clk: renesas: cpg-mssr: add R8A77980 support")

   Hopefully, it would be an immutable SHA1...

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Noticed in renesas-drivers-2018-03-13-v4.16-rc5
>  
>  drivers/clk/renesas/renesas-cpg-mssr.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- 0001/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ work/drivers/clk/renesas/renesas-cpg-mssr.c	2018-03-20 11:57:19.320607110 +0900
> @@ -705,7 +705,7 @@ static const struct of_device_id cpg_mss
>  		.data = &r8a77970_cpg_mssr_info,
>  	},
>  #endif
> -#ifdef CONFIG_ARCH_R8A77980
> +#ifdef CONFIG_CLK_R8A77980

   Oops, sorry about that overlook. :-<

>  	{
>  		.compatible = "renesas,r8a77980-cpg-mssr",
>  		.data = &r8a77980_cpg_mssr_info,

MBR, Sergei
