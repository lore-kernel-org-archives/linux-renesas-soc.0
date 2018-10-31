Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42670 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbeJaWBa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Oct 2018 18:01:30 -0400
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator: Switch eMMC bus to 1V8
To: Simon Horman <horms@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>
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
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b43d1c03-05c1-d7db-0f4d-712e2d3e608c@gmail.com>
Date: Wed, 31 Oct 2018 14:03:30 +0100
MIME-Version: 1.0
In-Reply-To: <20181031124628.buaiuof5ssllalwo@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/31/2018 01:46 PM, Simon Horman wrote:
> On Mon, Oct 29, 2018 at 08:57:21AM +0000, Wolfram Sang wrote:
>>
>>>> <&sdhi2_pins>;". So, basically the same phandles for both pinctrls. We
>>>> can re-add the second one when we need it.
>>>
>>> I wonder if removing the sdhi2_pins_uhs is what we want to do, given
>>> that we might need to adjust TDSEL or pull resistor configurations for
>>> the HS200/HS400 modes in the future.
>>
>> Well, quoting myself "We can re-add the second one when we need it". It
>> is possible but a tad unlikely. That's my take on it but it is
>> ultimately up to Simon, of course.
> 
> I agree we can add stuff later if we need it.
> But can we discuss this in the context of describing the hardware?

I'm not sure I understand this remark. Anyway, I'll be spinning a V2 of
the patchset, which will be a single patch.

-- 
Best regards,
Marek Vasut
