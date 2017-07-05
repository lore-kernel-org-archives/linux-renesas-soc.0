Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33842 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751653AbdGEQNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 12:13:43 -0400
Received: by mail-lf0-f49.google.com with SMTP id t72so27808901lff.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2017 09:13:42 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ARM: shmobile: defconfig: Enable Ethernet AVB
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
References: <afcd181c-c805-8f3c-955f-652d001a03d4@cogentembedded.com>
 <1499270189-29945-1-git-send-email-biju.das@bp.renesas.com>
 <1499270189-29945-3-git-send-email-biju.das@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <12c32eee-8e4d-457e-97d7-625a5c63ad59@cogentembedded.com>
Date: Wed, 5 Jul 2017 19:13:38 +0300
MIME-Version: 1.0
In-Reply-To: <1499270189-29945-3-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 07/05/2017 06:56 PM, Biju Das wrote:

> The iWave RZ/G1M Q7 SOM supports Gigabit Ethernet Phy (Micrel KSZ9031MNX).
> Gigabit Ethernet support is available in Renesas AVB driver.
> To increase hardware support enable the driver in the shmobile_defconfig
> multiplatform configuration.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 3c66a42..d992911 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -83,6 +83,7 @@ CONFIG_NETDEVICES=y
>  # CONFIG_NET_VENDOR_MICREL is not set
>  # CONFIG_NET_VENDOR_NATSEMI is not set
>  CONFIG_SH_ETH=y
> +CONFIG_RAVB=y

    Hm, I would enable it only as a module, given it's not easy to make use of 
AVB on the 32-bit boards.

[...]

MBR Sergei
