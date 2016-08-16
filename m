Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36936 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751018AbcHPRLb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 13:11:31 -0400
Received: by mail-wm0-f42.google.com with SMTP id i5so181813712wmg.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2016 10:11:31 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] arm64: dts: r8a7796: Add pinctrl device node
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
References: <1471358833-18248-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1471358833-18248-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Cc: horms@verge.net.au, magnus.damm@gmail.com,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <509f7c6f-1a8d-6198-eb10-099dc79e60b8@cogentembedded.com>
Date: Tue, 16 Aug 2016 20:11:26 +0300
MIME-Version: 1.0
In-Reply-To: <1471358833-18248-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/16/2016 05:47 PM, Ulrich Hecht wrote:

> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds pinctrl device node for R8A7796 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 1edf824..faea5a9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -107,6 +107,11 @@
>  			status = "disabled";
>  		};
>
> +		pfc: pfc@e6060000 {

    The node names should be generic to comply with ePAPR, I'd use 
"pin-controller@...".

[...]

MBR, Sergei
