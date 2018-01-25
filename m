Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:46549 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751296AbeAYIfU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jan 2018 03:35:20 -0500
Received: by mail-wr0-f194.google.com with SMTP id g21so6694804wrb.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2018 00:35:20 -0800 (PST)
Subject: Re: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document
 r8a774[35] CMT support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513618743-4773-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <SG2PR06MB088625944BCD8F4307315520C0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
 <1acdad3b-c2fd-df1d-f25b-cf80b79a9842@linaro.org>
 <CAMuHMdUX8D6c_ehNJAS8nWprvY60bkoxwTekEEqT5oJcz4QGPA@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <bf1b052d-c8e1-49dc-9e62-13d564d223a4@linaro.org>
Date: Thu, 25 Jan 2018 09:35:17 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUX8D6c_ehNJAS8nWprvY60bkoxwTekEEqT5oJcz4QGPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25/01/2018 09:21, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Thu, Jan 25, 2018 at 9:09 AM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>> On 24/01/2018 17:49, Fabrizio Castro wrote:
>>> I am sorry to bother you, just wondering if you think there are any chances for this patch to applied on top of v4.16?
>>
>> You can take it through the renesas tree.
>>
>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> Thank you!
> 
> Unfortunately it's a bit late to get non-bugfixes in v4.16 through the renesas
> tree and arm-soc.

I thought they were going through the renesas tree, so I discarded them :/

May be Thomas can take them in the tip/timers tree ?

Thomas ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
