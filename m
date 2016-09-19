Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:32814 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932428AbcISRZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 13:25:44 -0400
Received: by mail-lf0-f49.google.com with SMTP id h127so120069351lfh.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2016 10:25:43 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] arm64: dts: r8a7795: salvator: enable on-board
 eMMC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
References: <20160919124921.8172-1-wsa+renesas@sang-engineering.com>
 <20160919124921.8172-6-wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Dirk Behme <dirk.behme@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3abe65a3-0047-f39d-2639-b39b98081c42@cogentembedded.com>
Date: Mon, 19 Sep 2016 20:25:39 +0300
MIME-Version: 1.0
In-Reply-To: <20160919124921.8172-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/19/2016 03:49 PM, Wolfram Sang wrote:

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> index 8964b1ea3cea69..7780d02f716a34 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
[...]
> @@ -246,6 +264,18 @@
>  		power-source = <1800>;
>  	};
>
> +	sdhi2_pins: sd2 {
> +		groups = "sdhi2_data8", "sdhi2_ctrl";
> +		function = "sdhi2";
> +		power-source = <3300>;
> +	};
> +
> +	sdhi2_pins_uhs: sd2 {
> +		groups = "sdhi2_data8", "sdhi2_ctrl";
> +		function = "sdhi2";
> +		power-source = <1800>;
> +	};
> +

    I'm afraid you're just overriding the props in the first "sd2" node with 
this...

[...]

MBR, Sergei
