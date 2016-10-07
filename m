Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33990 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751222AbcJGKCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 06:02:11 -0400
Received: by mail-lf0-f48.google.com with SMTP id b81so37057819lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Oct 2016 03:02:10 -0700 (PDT)
Subject: Re: [PATCH v3 03/11] ARM: shmobile: r8a7743: basic SoC support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <15557770.lH5aPepOeZ@wasted.cogentembedded.com>
 <20161007031537.GK13721@verge.net.au> <2345971.ESZSzve5jF@avalon>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <836d9018-e8f4-27ef-bfff-06932184d59f@cogentembedded.com>
Date: Fri, 7 Oct 2016 13:02:07 +0300
MIME-Version: 1.0
In-Reply-To: <2345971.ESZSzve5jF@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 10/7/2016 11:33 AM, Laurent Pinchart wrote:

>>> Add minimal support for the RZ/G1M (R8A7743) SoC.
>>>
>>> Based on the original (and large) patch by Dmitry Shifrin
>>> <dmitry.shifrin@cogentembedded.com>.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Thanks, I have queued this up.
>
> I'd like to see this patch rebased on top of "[PATCH] ARM: shmobile:
> Consolidate R8A779[234] machine definitions".

    R87743 is analogous to R8A7791, not R8A779[234], not sure how it is 
connected to your patch.

MBR, Sergei
