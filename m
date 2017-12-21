Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:38915 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753018AbdLUMDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:03:20 -0500
Received: by mail-lf0-f67.google.com with SMTP id m20so14499045lfi.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 04:03:19 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add GPIO extender
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e0db75cf-3ade-3cb5-9162-403cf737120a@cogentembedded.com>
Date: Thu, 21 Dec 2017 15:03:16 +0300
MIME-Version: 1.0
In-Reply-To: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/21/2017 02:54 PM, Wolfram Sang wrote:

> We need to configure its GPIOs later.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
>   arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index a298df74ca6c03..1f52be050e2b13 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -338,6 +338,11 @@
>   &i2c4 {
>   	status = "okay";
>   
> +	pca9654: gpio@20 {
> +		compatible = "onsemi,pca9654";

    The registered vendor prefix is "onnn", not "onsemi". The GPIO driver no 
longer recognizes "onsemi,pca9654", I've fixed it.

[...]

MBR, Sergei
