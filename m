Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:39156 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751782AbdLJMUM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Dec 2017 07:20:12 -0500
Received: by mail-lf0-f67.google.com with SMTP id l81so16235130lfl.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Dec 2017 04:20:11 -0800 (PST)
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
 <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <86b47029-6474-31c9-b48a-9f5215b73378@cogentembedded.com>
Date: Sun, 10 Dec 2017 15:20:08 +0300
MIME-Version: 1.0
In-Reply-To: <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2017 05:17 PM, Thomas Petazzoni wrote:

> This commit adds the sh_eth_cpu_data structure that describes the
> SH7786 variant of the IP.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   drivers/net/ethernet/renesas/sh_eth.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 0074c5998481..a3c48b2a713c 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -710,6 +710,30 @@ static struct sh_eth_cpu_data sh7724_data = {
>   	.rpadir_value	= 0x00020000, /* NET_IP_ALIGN assumed to be 2 */
>   };
>   
> +static struct sh_eth_cpu_data sh7786_data = {
> +	.set_duplex	= sh_eth_set_duplex,

    Hm, no bitrate switching?
    (ECMR.OLB is said to be unused indeed in the manual...)

> +
> +	.register_type	= SH_ETH_REG_FAST_SH4,

    SH_ETH_REG_FAST_RCAR.

> +
> +	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD,
> +	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP,

    Good enough (though magic packet interrupt should work too)...

> +	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ADEIP | EESIPR_ECIIP |
> +			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
> +			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
> +			  EESIPR_RMAFIP | EESIPR_RRFIP |
> +			  EESIPR_RTLFIP | EESIPR_RTSFIP |
> +			  EESIPR_PREIP | EESIPR_CERFIP,
> +
> +	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_RTO,
> +	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
> +			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,

    I think you also need:

	.fdr_value	= 0x00000f0f,

like on R-Car gen1 SoCs...

[...]

    The reset looks good...

MBR, Sergei
