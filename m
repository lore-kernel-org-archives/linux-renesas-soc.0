Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43191 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756501AbeDZOwQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 10:52:16 -0400
Received: by mail-lf0-f65.google.com with SMTP id g12-v6so15094021lfb.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Apr 2018 07:52:16 -0700 (PDT)
Date: Thu, 26 Apr 2018 16:52:13 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 07/10] ARM: dts: kzm9d: Drop unnecessary address
 properties from gpio_keys node
Message-ID: <20180426145213.GD3315@bigcity.dyn.berto.se>
References: <20180426102951.8683-1-horms+renesas@verge.net.au>
 <20180426102951.8683-8-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180426102951.8683-8-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Thanks for your work.

On 2018-04-26 12:29:48 +0200, Simon Horman wrote:
> The gpio_keys node does not have an address and thus does not need
> address-cells or address size-properties.
> 
> This is flagged by dtc as follows:
>  # make dtbs W=1
>  arch/arm/boot/dts/r8a7794-silk.dtb: Warning (avoid_unnecessary_addr_size): /soc/video@e6ef0000/port: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

This warning don't seem to match with the change nor the rest of the 
commit message :-)

With that addressed and for the whole series:

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/boot/dts/emev2-kzm9d.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
> index c238407133bf..0af44b7eadb9 100644
> --- a/arch/arm/boot/dts/emev2-kzm9d.dts
> +++ b/arch/arm/boot/dts/emev2-kzm9d.dts
> @@ -34,9 +34,6 @@
>  
>  	gpio_keys {
>  		compatible = "gpio-keys";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
>  		one {
>  			debounce-interval = <50>;
>  			wakeup-source;
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
