Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:42019 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750861AbeBWJc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 04:32:58 -0500
Received: by mail-lf0-f65.google.com with SMTP id t204so11463559lff.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2018 01:32:57 -0800 (PST)
Subject: Re: [PATCH v4 11/16] ARM: dts: r8a7791: Convert to new LVDS DT
 bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180220231046.32638-12-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3469a2fd-f1d7-cf69-e028-053d6bdd5550@cogentembedded.com>
Date: Fri, 23 Feb 2018 12:32:54 +0300
MIME-Version: 1.0
In-Reply-To: <20180220231046.32638-12-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 2/21/2018 2:10 AM, Laurent Pinchart wrote:

> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v3:
> 
> - Added power-domains and resets properties to LVDS nodes
> 
> Changes since v2:
> 
> - Fixed LVDS compatible string
> 
> Changes since v1:
> 
> - Remove the DU reg-names property
> ---
>   arch/arm/boot/dts/r8a7791-koelsch.dts | 10 ++++++++--
>   arch/arm/boot/dts/r8a7791-porter.dts  | 16 +++++++++++++---
>   arch/arm/boot/dts/r8a7791.dtsi        | 36 +++++++++++++++++++++++++++++------
>   3 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index a50924d12b6f..c42ff25e3aa3 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -337,8 +337,7 @@
>   
>   	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 726>,
>   		 <&x13_clk>, <&x2_clk>;
> -	clock-names = "du.0", "du.1", "lvds.0",
> -		      "dclkin.0", "dclkin.1";
> +	clock-names = "du.0", "du.1", "dclkin.0", "dclkin.1";

    Er, you only deleted the LVDS clock name but not LVDS clock itself?

[...]
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 008a260f86a5..8660f8a329c7 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
[...]

MBR, Sergei
