Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59356 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751541AbdADBHl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2017 20:07:41 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <simon@horms.net>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/13] arm64: dts: r8a7795: salvator-x: Add DU LVDS output endpoint
Date: Wed, 04 Jan 2017 03:07:14 +0200
Message-ID: <3777454.z0GnxGZg1M@avalon>
In-Reply-To: <1479526093-7014-9-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-9-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Could you please pick this patch up ?

On Saturday 19 Nov 2016 05:28:08 Laurent Pinchart wrote:
> Declaring the endpoint makes LVDS enablement easier by just including
> the corresponding panel's dtsi file.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts index
> b1eab6876f8c..2c30813d0f86 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -191,6 +191,10 @@
>  				remote-endpoint = <&adv7123_in>;
>  			};
>  		};
> +		port@3 {
> +			lvds_connector: endpoint {
> +			};
> +		};
>  	};
>  };

-- 
Regards,

Laurent Pinchart
