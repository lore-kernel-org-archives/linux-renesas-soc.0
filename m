Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:53410 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdJEIlv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 04:41:51 -0400
Date: Thu, 5 Oct 2017 10:41:47 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, horms@verge.net.au,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm: dts: gr-peach: Fix label indent
Message-ID: <20171005084147.GO4037@w540>
References: <1507131702-6504-1-git-send-email-jacopo+renesas@jmondi.org>
 <cccbcde1-9666-7edd-3cbe-e097e211fb8a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cccbcde1-9666-7edd-3cbe-e097e211fb8a@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon, Sergei

On Wed, Oct 04, 2017 at 07:03:35PM +0300, Sergei Shtylyov wrote:
> On 10/04/2017 06:41 PM, Jacopo Mondi wrote:
>
> >Fix 'leds' label indent as it was wrongly aligned
>
>    It's not a label, it's node name. :-)

You're so right!
As I have other 3 patches to send out for GR-Peach, I will re-phrase
this and re-send it in the forth-coming series, so that Simon doesn't
have to mangle the commit message when picking this up.

Thanks
   j
>
> >Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >---
> >  arch/arm/boot/dts/r7s72100-gr-peach.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
> >index 13d745b..a1c5e88 100644
> >--- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
> >+++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
> >@@ -53,7 +53,7 @@
> >  		};
> >  	};
> >
> >-leds {
> >+	leds {
> >  		status = "okay";
> >  		compatible = "gpio-leds";
> >
>
> MBR, Sergei
