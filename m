Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40121 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755345AbeDYQPg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Apr 2018 12:15:36 -0400
Received: by mail-lf0-f67.google.com with SMTP id j16-v6so9074179lfb.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Apr 2018 09:15:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77990: Revise the cache
 controller node
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org
References: <1524644410-12465-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524644410-12465-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <32b91531-20a4-4831-faaf-e03a35238db3@cogentembedded.com>
Date: Wed, 25 Apr 2018 19:15:31 +0300
MIME-Version: 1.0
In-Reply-To: <1524644410-12465-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/25/2018 11:20 AM, Yoshihiro Shimoda wrote:

> The cache controller node should not have unit-addresses and reg
> properties. So, this patch revises them.

   Removes?

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 3a19b9e..ba902a2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -27,9 +27,8 @@
>  			enable-method = "psci";
>  		};
>  
> -		L2_CA53: cache-controller@0 {
> +		L2_CA53: cache-controller-0 {
>  			compatible = "cache";
> -			reg = <0>;
>  			power-domains = <&sysc 21>;
>  			cache-unified;
>  			cache-level = <2>;
> 

MBR, Sergei
