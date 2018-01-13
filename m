Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:37359 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965440AbeAMJZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jan 2018 04:25:34 -0500
Received: by mail-lf0-f48.google.com with SMTP id f3so8365836lfe.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jan 2018 01:25:33 -0800 (PST)
Subject: Re: [PATCH 1/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
References: <20180112201550.368547609@cogentembedded.com>
 <2286420.LkWkKn4WW8@avalon> <3090757.msatNG3mHi@avalon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <27ae5c72-b774-1af5-ae99-65009c2b6416@cogentembedded.com>
Date: Sat, 13 Jan 2018 12:25:31 +0300
MIME-Version: 1.0
In-Reply-To: <3090757.msatNG3mHi@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 1/13/2018 1:15 AM, Laurent Pinchart wrote:

>>> According to the latest revisions of the R-Car gen3 manual, the LVDS mode
>>> must be set before the LVDS I/O pins are enabled, not after --  fix  the
>>> gen3 LVDS startup sequence accordingly...
>>>
>>> While  at it,  also fix the comment  preceding the first LVDCR0 write in
>>> the R-Car gen2 startup code that still talks about hardcoding the LVDS
>>> mode 0...
>>
>> How about fixing that in patch 2/2 that touches the Gen2 initialization
>> sequence ? I think I'd even go as far as squashing both patches, I don't
>> think there's a need to split them.
>>
>>> Fixes: e947eccbeba4 ("drm: rcar-du: Add support for LVDS mode selection")
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Is this really needed ? Does it fix a problem you've experienced, or is it
>> theoretical only ? The mode shouldn't matter before the LVDS internal logic
>> is turned on. Unless there's a real issue I'm not sure we should make the
>> code more complex.
> 
> Furthermore the datasheet states
> 
> "3. This refers to settings other than those that are concerned with LVDS-IF
> startup. These items may be set while waiting for the conditions of step 6 to
> be met."

    Ah, I hadn't paid much attention to this note. Howeve, it seems quite 
vague to me... and there's no condition in step 6. ;-)

> Doesn't this mean that the mode and input selector don't have to be set as the
> very first step, but can be programmed at any point before starting the LVDS
> encoder through the PWD bit (on Gen3) or the PLLON bit (on Gen2) ?

    Frankly speaking, I don't know how to interpret that note...

[...]

MBR, Sergei
