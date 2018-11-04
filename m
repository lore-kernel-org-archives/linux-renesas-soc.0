Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35305 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeKEGLI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 01:11:08 -0500
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator: Switch eMMC bus to 1V8
To: Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>
Cc: linux-mmc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20181027163410.7417-1-marek.vasut+renesas@gmail.com>
 <20181027163410.7417-2-marek.vasut+renesas@gmail.com>
 <20181028213444.GA1096@kunai>
 <f63a5c27-ea7d-e1f0-9bbb-211f56be8ad9@gmail.com>
 <20181029085721.GC4101@kunai> <20181031124628.buaiuof5ssllalwo@verge.net.au>
 <20181031131409.GB1487@kunai>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <bf989a63-0c88-62d9-1d09-d5cc3176b985@gmail.com>
Date: Sun, 4 Nov 2018 21:38:59 +0100
MIME-Version: 1.0
In-Reply-To: <20181031131409.GB1487@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/31/2018 02:14 PM, Wolfram Sang wrote:
> 
>> But can we discuss this in the context of describing the hardware?
> 
> The SDHI node needs two kinds of pinmux settings, one for normal speeds
> and one for highspeeds. They might differ in supplied voltage, i.e. 3v3
> and 1v8. This eMMC always works with 1v8, so both settings needed by the
> SDHI node are the same currently. That might change if we add new
> features to pinmux nodes like TDSEL/capacity support. My guess is that
> this is not so likely to happen so I suggested using just one node.
> 
> But it has a taste of bike-shedding to it :)

V2 is out, including the deduplication.

-- 
Best regards,
Marek Vasut
