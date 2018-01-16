Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39835 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750878AbeAPPmi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 10:42:38 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen3
Date: Tue, 16 Jan 2018 17:42:41 +0200
Message-ID: <35260661.mJIny8zrSv@avalon>
In-Reply-To: <27ae5c72-b774-1af5-ae99-65009c2b6416@cogentembedded.com>
References: <20180112201550.368547609@cogentembedded.com> <3090757.msatNG3mHi@avalon> <27ae5c72-b774-1af5-ae99-65009c2b6416@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Saturday, 13 January 2018 11:25:31 EET Sergei Shtylyov wrote:
> On 1/13/2018 1:15 AM, Laurent Pinchart wrote:
> >>> According to the latest revisions of the R-Car gen3 manual, the LVDS
> >>> mode must be set before the LVDS I/O pins are enabled, not after --  fix 
> >>> the gen3 LVDS startup sequence accordingly...
> >>> 
> >>> While  at it,  also fix the comment  preceding the first LVDCR0 write in
> >>> the R-Car gen2 startup code that still talks about hardcoding the LVDS
> >>> mode 0...
> >> 
> >> How about fixing that in patch 2/2 that touches the Gen2 initialization
> >> sequence ? I think I'd even go as far as squashing both patches, I don't
> >> think there's a need to split them.
> >> 
> >>> Fixes: e947eccbeba4 ("drm: rcar-du: Add support for LVDS mode
> >>> selection")
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >> 
> >> Is this really needed ? Does it fix a problem you've experienced, or is
> >> it theoretical only ? The mode shouldn't matter before the LVDS internal
> >> logic is turned on. Unless there's a real issue I'm not sure we should
> >> make the code more complex.
> > 
> > Furthermore the datasheet states
> > 
> > "3. This refers to settings other than those that are concerned with
> > LVDS-IF startup. These items may be set while waiting for the conditions
> > of step 6 to be met."
> 
> Ah, I hadn't paid much attention to this note. Howeve, it seems quite
> vague to me... and there's no condition in step 6. ;-)

Lots of bits and pieces are lost in translation yes :-)

> > Doesn't this mean that the mode and input selector don't have to be set as
> > the very first step, but can be programmed at any point before starting
> > the LVDS encoder through the PWD bit (on Gen3) or the PLLON bit (on Gen2)
> > ?
> 
> Frankly speaking, I don't know how to interpret that note...

My understanding is that the parameters can be programmed at any time before 
step 6. The fact that the current code works seems to confirm that 
interpretation. We could ask Renesas for a confirmation if you want.

-- 
Regards,

Laurent Pinchart
