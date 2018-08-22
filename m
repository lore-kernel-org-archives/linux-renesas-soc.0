Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43536 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbeHVSIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 14:08:25 -0400
Received: by mail-lf1-f67.google.com with SMTP id h64-v6so76091lfi.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 07:43:14 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: renesas: v3msk: add eMMC support
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <1af46bf9-d9e5-8dcf-0ac7-a85e7348a34e@cogentembedded.com>
 <9da672a2-0269-4860-8912-189414b43d4c@cogentembedded.com>
 <20180822113100.edpyplj2kteomr2j@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9f94612a-5035-b006-f6af-6bafb7ff91f3@cogentembedded.com>
Date: Wed, 22 Aug 2018 17:43:11 +0300
MIME-Version: 1.0
In-Reply-To: <20180822113100.edpyplj2kteomr2j@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/22/2018 02:31 PM, Simon Horman wrote:

>> Add the eMMC chip support for the V3M Started Kit board.
>>
>> Based on the original (and large) patches by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> I am, however, curious to know about HS200.
> Is it supported on the v3msk? If so, do you have any plans to enable it?

   As I've already said, the eMMC chip only receives 3.3V on all its voltage inputs.

MBR, Sergei
