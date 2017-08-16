Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34394 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751780AbdHPLAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 07:00:41 -0400
Received: by mail-lf0-f46.google.com with SMTP id g25so14833346lfh.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 04:00:40 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: r8a7745: add PFC support
To: Simon Horman <horms@verge.net.au>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <20170415202036.987901107@cogentembedded.com>
 <CAMuHMdUPda7Mjo_P8p1V5a20XOAYM6GFf8Jqf0KLUuO7zAODeA@mail.gmail.com>
 <TY1PR06MB07025D9CE628A3D4CED37AA9B78D0@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <b3bcd091-4f96-c37a-54ec-c8ee5b0fd916@cogentembedded.com>
 <20170815160049.GC26748@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <521e62cc-46d4-b067-59b2-cc085fd88e84@cogentembedded.com>
Date: Wed, 16 Aug 2017 14:00:37 +0300
MIME-Version: 1.0
In-Reply-To: <20170815160049.GC26748@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/15/2017 07:00 PM, Simon Horman wrote:

>>>>> Define the generic R8A7745 part of the PFC device node.
>>>>>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> It looks like the dependencies for this patch are met now [1].
>>>
>>> Are you happy to accept this patch? (and presumably the others in the series for the sk-rzg1e board).
>>>
>>> We plan to add GPIO support for r8a7745, but need this patch in place first.
>>>
>>>
>>> [1] https://patchwork.kernel.org/patch/9705249/
>>
>>     Actually, R8A774x PFC support has hit the Linus' tree in the meanwhile.
>> Simon, please merge the .dts patches.
>>
>>> Kind regards, Chris
> 
> Thanks, I have applied the series for v4.14.

    Are you going to finally push the devel branch? I'm not seeing changes 
since the Monday tags.

MBR, Sergei
