Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:43207 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750966AbdJDQDj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 12:03:39 -0400
Received: by mail-lf0-f42.google.com with SMTP id o125so9362815lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Oct 2017 09:03:38 -0700 (PDT)
Subject: Re: [PATCH] arm: dts: gr-peach: Fix label indent
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, horms@verge.net.au
Cc: linux-renesas-soc@vger.kernel.org
References: <1507131702-6504-1-git-send-email-jacopo+renesas@jmondi.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cccbcde1-9666-7edd-3cbe-e097e211fb8a@cogentembedded.com>
Date: Wed, 4 Oct 2017 19:03:35 +0300
MIME-Version: 1.0
In-Reply-To: <1507131702-6504-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/04/2017 06:41 PM, Jacopo Mondi wrote:

> Fix 'leds' label indent as it was wrongly aligned

    It's not a label, it's node name. :-)

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>   arch/arm/boot/dts/r7s72100-gr-peach.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
> index 13d745b..a1c5e88 100644
> --- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
> +++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
> @@ -53,7 +53,7 @@
>   		};
>   	};
> 
> -leds {
> +	leds {
>   		status = "okay";
>   		compatible = "gpio-leds";
> 

MBR, Sergei
