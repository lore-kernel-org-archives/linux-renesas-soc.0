Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:37848 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757438AbdKQQLV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 11:11:21 -0500
Received: by mail-lf0-f67.google.com with SMTP id y2so2327272lfj.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2017 08:11:21 -0800 (PST)
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: add GPIO support
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <20171113213149.295833059@cogentembedded.com>
 <CAMuHMdX9n6U8vP0NWRW0hFZqLQbMKvcf4U1HZkP4nJdaS4-qNg@mail.gmail.com>
 <20171117141950.r6vzq6ndapopfidr@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e64bc97b-28b2-a8b5-cde7-804f1a3e24f7@cogentembedded.com>
Date: Fri, 17 Nov 2017 19:11:18 +0300
MIME-Version: 1.0
In-Reply-To: <20171117141950.r6vzq6ndapopfidr@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/17/2017 05:19 PM, Simon Horman wrote:

>>> Describe all 6 GPIO controllers in the R8A77970 device tree.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, applied.

    It doesn't build w/o PFC support (and I thought I mde it clearin the cover 
letter), so please either merge R8A77970 PFC patch or pull this one out!

MBR, Segei
