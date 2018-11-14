Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43643 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732450AbeKOBgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Nov 2018 20:36:47 -0500
Received: by mail-wr1-f68.google.com with SMTP id r10so232567wrs.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Nov 2018 07:33:04 -0800 (PST)
Subject: Re: [PATCH] arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20181113152201.24476-1-geert+renesas@glider.be>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cb6b55cc-c91b-b3e2-bc04-d7dfb80cfa98@gmail.com>
Date: Wed, 14 Nov 2018 16:32:05 +0100
MIME-Version: 1.0
In-Reply-To: <20181113152201.24476-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/13/2018 04:22 PM, Geert Uytterhoeven wrote:
> Enable R-Car Gen3 PCIe PHY support, which is needed for PCIe to function
> on the Renesas Condor board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This helps

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9d0b42d96f03156e..77f98a7e860b8850 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -657,6 +657,7 @@ CONFIG_PHY_HISI_INNO_USB2=y
>  CONFIG_PHY_MVEBU_CP110_COMPHY=y
>  CONFIG_PHY_QCOM_QMP=m
>  CONFIG_PHY_QCOM_USB_HS=y
> +CONFIG_PHY_RCAR_GEN3_PCIE=y
>  CONFIG_PHY_RCAR_GEN3_USB2=y
>  CONFIG_PHY_RCAR_GEN3_USB3=m
>  CONFIG_PHY_ROCKCHIP_EMMC=y
> 


-- 
Best regards,
Marek Vasut
