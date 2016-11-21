Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37312 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754185AbcKUNOA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 08:14:00 -0500
Received: by mail-wm0-f42.google.com with SMTP id t79so143718887wmt.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2016 05:14:00 -0800 (PST)
Subject: Re: [PATCH 16/18] arm64: dts: h3ulcb: rename SDHI0 pins
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
References: <cover.1479726397.git.horms+renesas@verge.net.au>
 <93373c309a703b57690216db4106a4a534929c15.1479726397.git.horms+renesas@verge.net.au>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <45a251f6-ee0c-5eba-ffd1-3f61a1e7ccc7@cogentembedded.com>
Date: Mon, 21 Nov 2016 16:13:56 +0300
MIME-Version: 1.0
In-Reply-To: <93373c309a703b57690216db4106a4a534929c15.1479726397.git.horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 11/21/2016 03:05 PM, Simon Horman wrote:

> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>
> This changes SDHI0 pin names for H3ULCB board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> index 8d0ac076d8e2..6ffb0517421a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -163,13 +163,13 @@
>  		function = "avb";
>  	};
>
> -	sdhi0_pins_3v3: sd0_3v3 {
> +	sdhi0_pins: sd0 {
>  		groups = "sdhi0_data4", "sdhi0_ctrl";
>  		function = "sdhi0";
>  		power-source = <3300>;
>  	};
>
> -	sdhi0_pins_1v8: sd0_1v8 {
> +	sdhi0_pins_uhs: sd0 {

    I'm afraid the following will just override the props of the node above 
which is not what we ant.

>  		groups = "sdhi0_data4", "sdhi0_ctrl";
>  		function = "sdhi0";
>  		power-source = <1800>;
[...]

MBR, Sergei
