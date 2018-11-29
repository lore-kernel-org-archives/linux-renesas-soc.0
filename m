Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:10148
        "EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726187AbeK2XJH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 18:09:07 -0500
Subject: Re: [PATCH v6 3/6] m68k: coldfire: Add clk_get_optional() function
To: Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-4-phil.edworthy@renesas.com>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <bcb0278b-a4f5-068b-324f-7be3ca963102@linux-m68k.org>
Date: Thu, 29 Nov 2018 21:54:37 +1000
MIME-Version: 1.0
In-Reply-To: <20181116145937.27660-4-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Phil,

On 17/11/18 12:59 am, Phil Edworthy wrote:
> clk_get_optional() returns NULL if not found instead of -ENOENT,
> otherwise the behaviour is the same as clk_get().
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Acked-by: Greg Ungerer <gerg@@linux-m68k.org>

Looks good. Do you want me to take this in the m68knommu git tree?
Or is the whole series going through some other tree?

Regards
Greg



> ---
>   arch/m68k/coldfire/clk.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
> index 7bc666e482eb..b221cabc7f54 100644
> --- a/arch/m68k/coldfire/clk.c
> +++ b/arch/m68k/coldfire/clk.c
> @@ -87,6 +87,17 @@ struct clk *clk_get(struct device *dev, const char *id)
>   }
>   EXPORT_SYMBOL(clk_get);
>   
> +struct clk *clk_get_optional(struct device *dev, const char *id)
> +{
> +	struct clk *clk = clk_get(dev, id);
> +
> +	if (clk == ERR_PTR(-ENOENT))
> +		clk = NULL;
> +
> +	return clk;
> +}
> +EXPORT_SYMBOL(clk_get_optional);
> +
>   int clk_enable(struct clk *clk)
>   {
>   	unsigned long flags;
> 
