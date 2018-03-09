Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car V3M
 Eagle
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com,
        geert@linux-m68k.org, niklas.soderlund@ragnatech.se,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1520522643-11756-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520522643-11756-4-git-send-email-jacopo+renesas@jmondi.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fd5245a5-5a65-f5f4-6d25-fc5b70060fbe@cogentembedded.com>
Date: Fri, 9 Mar 2018 11:43:32 +0300
MIME-Version: 1.0
In-Reply-To: <1520522643-11756-4-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 3/8/2018 6:24 PM, Jacopo Mondi wrote:

> The R-Car V3M Eagle board includes a transparent LVDS decoder, connected
> to the on-chip LVDS encoder output on one side and to HDMI encoder
> ADV7511w on the other one.
> 
> As the decoder does not need any configuration it has been so-far
> omitted from DTS. Now that a driver for transparent LVDS decoder is
> available, describe it in DT as well.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>   arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 31 ++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index c0fd144..0d62b40 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -42,6 +42,33 @@
>   			};
>   		};
>   	};
> +
> +	lvds_decoder {

    Hyphens are preferred to underscored in the node names.

> +		compatible = "thine,thc63lvd1024";
[...]

MBR, Sergei
