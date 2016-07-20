Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35221 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753159AbcGTKZy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 06:25:54 -0400
Received: by mail-lf0-f45.google.com with SMTP id f93so34992832lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2016 03:25:53 -0700 (PDT)
Subject: Re: [PATCH] ARM: shmobile: r8a7794: tidyup SDHI register size on DTSI
To: Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
References: <1469002759-2860-1-git-send-email-horms+renesas@verge.net.au>
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <98aa1325-227b-d384-2515-9e65705edfe4@cogentembedded.com>
Date: Wed, 20 Jul 2016 13:25:50 +0300
MIME-Version: 1.0
In-Reply-To: <1469002759-2860-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 7/20/2016 11:19 AM, Simon Horman wrote:

> r8a7794 SDHI ch0 has SD_DMACR which is located in 0x324.
> This patch updates register size
>
> Based on work for the r8a7790 by Kuninori Morimoto.
>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Found by inspection
> Compile tested only
> ---
>  arch/arm/boot/dts/r8a7794.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> index 685f986cf962..9b36f58dff41 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -697,7 +697,7 @@
>
>  	sdhi0: sd@ee100000 {
>  		compatible = "renesas,sdhi-r8a7794";
> -		reg = <0 0xee100000 0 0x200>;
> +		reg = <0 0xee100000 0 0x384>;

    Not 0x328?

MBR, Sergei
