Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:44301 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965451AbeAMJRI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jan 2018 04:17:08 -0500
Received: by mail-lf0-f65.google.com with SMTP id w23so8324430lfd.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jan 2018 01:17:07 -0800 (PST)
Subject: Re: [PATCH 1/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
References: <20180112201550.368547609@cogentembedded.com>
 <2286420.LkWkKn4WW8@avalon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8e6da648-d1ba-bf91-1516-02263bd04bf5@cogentembedded.com>
Date: Sat, 13 Jan 2018 12:17:04 +0300
MIME-Version: 1.0
In-Reply-To: <2286420.LkWkKn4WW8@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 1/13/2018 12:51 AM, Laurent Pinchart wrote:

> On Friday, 12 January 2018 22:12:04 EET Sergei Shtylyov wrote:
>> According to the latest revisions of the R-Car gen3 manual, the LVDS mode
>> must be set before the LVDS I/O pins are enabled, not after --  fix  the
>> gen3 LVDS startup sequence accordingly...
>>
>> While  at it,  also fix the comment  preceding the first LVDCR0 write in
>> the R-Car gen2 startup code that still talks about hardcoding the LVDS
>> mode 0...
> 
> How about fixing that in patch 2/2 that touches the Gen2 initialization
> sequence ? I think I'd even go as far as squashing both patches, I don't think
> there's a need to split them.

    No. Fixing both issues with 1 patch was intentional because they both were 
introduced by the same commit (see Fixes:).

>> Fixes: e947eccbeba4 ("drm: rcar-du: Add support for LVDS mode selection")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Is this really needed ? Does it fix a problem you've experienced, or is it
> theoretical only ?

    No, just another check against the manual - there were some patches in the 
history of this file that did the same thing (sync to the manual). See e.g.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=85e8f8d175caa6a39f4c4e11dd4d0ab038f43324

> The mode shouldn't matter before the LVDS internal logic is
> turned on. Unless there's a real issue I'm not sure we should make the code
> more complex.

    Up to you, of course...

[...]

MBR,Sergei
