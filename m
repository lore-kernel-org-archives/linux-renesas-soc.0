Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44917 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729447AbeIRW2W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 18:28:22 -0400
Received: by mail-lf1-f66.google.com with SMTP id g24-v6so2474268lfb.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Sep 2018 09:54:54 -0700 (PDT)
Subject: Re: [PATCH v3 net-next] ravb: do not write 1 to reserved bits
To: Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20180918102226.8017-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5bddb393-3060-6d74-4cf1-3547cb87924e@cogentembedded.com>
Date: Tue, 18 Sep 2018 19:54:51 +0300
MIME-Version: 1.0
In-Reply-To: <20180918102226.8017-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/18/2018 01:22 PM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> EtherAVB hardware requires 0 to be written to status register bits in
> order to clear them, however, care must be taken not to:
> 
> 1. Clear other bits, by writing zero to them
> 2. Write one to reserved bits
> 
> This patch corrects the ravb driver with respect to the second point above.
> This is done by defining reserved bit masks for the affected registers and,
> after auditing the code, ensure all sites that may write a one to a
> reserved bit use are suitably masked.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 1470fc12282b..9b6bf557a2f5 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -428,6 +428,7 @@ enum EIS_BIT {
>  	EIS_CULF1	= 0x00000080,
>  	EIS_TFFF	= 0x00000100,
>  	EIS_QFS		= 0x00010000,
> +	EIS_RESERVED	= (GENMASK(31, 17) | GENMASK(15, 11)),

   Well, I'm not a big fan of BIT() and GENMASK() -- they still lack a macro
to #define a bit/field value. But if you prefer to use them, OK, let's be so...

[...]

MBR, Sergei
