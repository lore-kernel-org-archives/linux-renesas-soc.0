Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:40220 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751775AbdLWP2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Dec 2017 10:28:46 -0500
Received: by mail-lf0-f54.google.com with SMTP id u84so14369997lff.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Dec 2017 07:28:46 -0800 (PST)
Subject: Re: [PATCH] drm: rcar-du: lvds: fix LVDCR1 for R-Car gen3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
References: <20171221202343.596842084@cogentembedded.com>
 <89065057.2qEGqgNSnG@avalon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <bad0559c-a664-2b93-5457-06d20bf43725@cogentembedded.com>
Date: Sat, 23 Dec 2017 18:28:39 +0300
MIME-Version: 1.0
In-Reply-To: <89065057.2qEGqgNSnG@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/23/2017 04:09 PM, Laurent Pinchart wrote:

> On Thursday, 21 December 2017 22:23:30 EET Sergei Shtylyov wrote:
>> The LVDCR1 register for the R-Car gen3 SoCs was documented as having the
>> layout different from the gen2 SoCs in  the early R-Car gen3 manuals but
>> since v0.52 the LVDCR1 layout is described as being the same as on the gen2
>> SoCs; the old CHn control values are said to be prohibited now (and there
>> seems to be no valid output signal when they are used).
> 
> Could it be that the "Gen3" values are specific to the H3 ES1.x ? I've got the

    I don't know. All I know is that the LVDCR1 description was changed in 
v.52 of the gen3 manual (the 1st version that documented R-Car V3M).

> LVDS output working on a Salvator-X H3 board with the existing code, although
> I'm not sure at the moment whether that was on ES1.x or ES2.0. I can check
> that when I'll get access to the hardware back in a week.
> 
> On which platform have you tested this patch ?

    R-Car V3M (R8A77970), V3M Starter Kit board.

>> Fixes: 6bc2e15cf21c ("drm: rcar-du: lvds: Add R-Car Gen3 support")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
