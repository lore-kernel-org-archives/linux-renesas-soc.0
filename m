Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57335 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932350AbdKBJg1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 05:36:27 -0400
Subject: Re: [PATCH] spi: sh-msiof: Fix DMA transfer size check
To: Simon Horman <horms+renesas@verge.net.au>,
        Mark Brown <broonie@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-spi@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20171102093236.26082-1-horms+renesas@verge.net.au>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <4ffdafd2-e81a-5fc8-54eb-765d768c202d@de.bosch.com>
Date: Thu, 2 Nov 2017 10:36:24 +0100
MIME-Version: 1.0
In-Reply-To: <20171102093236.26082-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02.11.2017 10:32, Simon Horman wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> 
> DMA supports 32-bit words only,
> even if BITLEN1 of SITMDR2 register is 16bit.
> 
> Fixes: b0d0ce8b6b91 ("spi: sh-msiof: Add DMA support")
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Dirk Behme <dirk.behme@de.bosch.com>

> ---
> v2
> * Added Geert's Ack
> 
> Sorry for letting this slip through the cracks, it appears
> to have been on my todo list for 1 year less 5 days.


Thanks for picking it :)

Best regards

Dirk

P.S.: The remaining msiof (DMA) patches are not forgotten, we are sill 
working on them (with low priority, though).


> ---
>   drivers/spi/spi-sh-msiof.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index 2c5ea4c57508..94d15ef0e4e6 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -900,7 +900,7 @@ static int sh_msiof_transfer_one(struct spi_master *master,
>   				break;
>   			copy32 = copy_bswap32;
>   		} else if (bits <= 16) {
> -			if (l & 1)
> +			if (l & 3)
>   				break;
>   			copy32 = copy_wswap32;
>   		} else {
> 
