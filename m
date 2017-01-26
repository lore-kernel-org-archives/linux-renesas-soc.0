Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34381 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753200AbdAZJtn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 04:49:43 -0500
Received: by mail-lf0-f53.google.com with SMTP id v186so142763852lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 01:49:42 -0800 (PST)
Subject: Re: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9acf3e80-2e9b-10e0-2491-5157cc714f6c@cogentembedded.com>
Date: Thu, 26 Jan 2017 12:49:41 +0300
MIME-Version: 1.0
In-Reply-To: <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

    s/r7s1000/r7s72100/ in the subject.

On 1/25/2017 9:09 PM, Jacopo Mondi wrote:

> Add pincontroller node compatible with the new Renesas RZ/A1
> pincontroller driver.

    Pin controller.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index 3dd427d..764006d 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -171,6 +171,18 @@
>  		};
>  	};
>
> +	pinctrl: pinctrl@fcfe3000 {

    I'd call the node "pin-controller@...".

MBR, Sergei
