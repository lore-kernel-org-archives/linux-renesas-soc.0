Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33291 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965017AbeEITSt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 15:18:49 -0400
Received: by mail-lf0-f48.google.com with SMTP id m18-v6so52564458lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 May 2018 12:18:49 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add resets property CAN-FD
 node
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
References: <20180509175409.10507-1-horms+renesas@verge.net.au>
 <CAMuHMdXWHXtO1-0FucCsPTE22U_k+vdqCrDHgBFrM4+yEgXYcQ@mail.gmail.com>
 <20180509191435.vm2zfuuixbyd3drm@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2889c7ff-1748-e435-c03c-cb36cf930b1d@cogentembedded.com>
Date: Wed, 9 May 2018 22:18:47 +0300
MIME-Version: 1.0
In-Reply-To: <20180509191435.vm2zfuuixbyd3drm@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5/9/2018 10:14 PM, Simon Horman wrote:

>>> Add resets property to CAN-FD node to describe it in the reset topology of
>>> on-SoC devices.  This allows to reset the CAN-FD device using the Reset
>>> Controller API.
>>>
>>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, applied.

    You're too quick (and I'm on holiday today). Need "to| before "CAN-FD" in 
the subject. ;-)

MBR, Sergei
