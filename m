Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46562 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730521AbeGSQ1w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 12:27:52 -0400
Received: by mail-lj1-f196.google.com with SMTP id 203-v6so8171073ljj.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 08:44:06 -0700 (PDT)
Subject: Re: [PATCH/RFC 02/02] ravb: Clean up duplex handling
To: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200107566.13504.725250500519176904.sendpatchset@little-apple>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8dc5f9e6-2572-4223-42d3-3928a69f989b@cogentembedded.com>
Date: Thu, 19 Jul 2018 18:44:03 +0300
MIME-Version: 1.0
In-Reply-To: <153200107566.13504.725250500519176904.sendpatchset@little-apple>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/19/2018 02:51 PM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Since only full-duplex operation is supported by the
> hardware, remove duplex handling code and keep the
> register setting of ECMR.DM fixed at 1.
> 
> This updates the driver implementation to follow the
> data sheet text "This bit should always be set to 1."
> 
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

   Sounds like a fix, please provide a Fixes: tag (I think we're fixing
the initial driver commit here). 

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
> 
>  Written on top of renesas-drivers-2018-07-17-v4.18-rc5

   Next time please base atop of DaveM's net.git repo.

[...]
> --- 0003/drivers/net/ethernet/renesas/ravb_main.c
> +++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-07-19 19:44:14.370607110 +0900
[...]
> @@ -1131,13 +1114,6 @@ static int ravb_set_link_ksettings(struc
>  	if (error)
>  		goto error_exit;
>  
> -	if (cmd->base.duplex == DUPLEX_FULL)
> -		priv->duplex = 1;
> -	else
> -		priv->duplex = 0;
> -
> -	ravb_set_duplex(ndev);
> -

   This fragment no longer exists in net.git...

[...]

MBR, Sergei
