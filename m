Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35807 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbdFUJfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 05:35:13 -0400
Received: by mail-lf0-f48.google.com with SMTP id p189so90750159lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2017 02:35:12 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] arm64: dts: renesas: r8a7796: Add HDMI encoder
 instance
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170621093133.5677-5-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <503e58db-0a96-7ed0-bd1b-136f793f563f@cogentembedded.com>
Date: Wed, 21 Jun 2017 12:35:11 +0300
MIME-Version: 1.0
In-Reply-To: <20170621093133.5677-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 6/21/2017 12:31 PM, Laurent Pinchart wrote:

> Add the HDMI encoder to the R8A7796 DT in disabled state.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index ad9cd1c3199f..25e51d20b7ef 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1532,6 +1532,31 @@
>  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
>  		};
>
> +		hdmi0: hdmi0@fead0000 {

    Why not name it just hdmi@fead0000 as required by the DT spec 0.1?

[...]

MBR, Sergei
