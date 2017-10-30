Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52452 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752103AbdJ3NSx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 09:18:53 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
Date: Mon, 30 Oct 2017 15:18:49 +0200
Message-ID: <3740235.TmfEf9FE4t@avalon>
In-Reply-To: <87d155gdyw.fsf@intel.com>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net> <1864580.oVLIQZJ4NS@avalon> <87d155gdyw.fsf@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jani,

On Monday, 30 October 2017 11:52:07 EET Jani Nikula wrote:
> On Sun, 29 Oct 2017, Laurent Pinchart wrote:
> > On Friday, 27 October 2017 21:45:17 EET Jani Nikula wrote:
> >> On Tue, 24 Oct 2017, SF Markus Elfring wrote:
> >>> Add a jump target so that a bit of exception handling can be better
> >>> reused at the end of this function.
> >>> 
> >>> This issue was detected by using the Coccinelle software.
> >> 
> >> Please also look into the GCC software, which will detect that your
> >> patch does not compile.
> > 
> > Just for the record, I've been bitten in the past by applying one of
> > Markus' patches that seemed to make sense, only to discover later that it
> > introduced a security hole. I now drop his patches altogether, so could
> > you please keep an eye open to make sure none of them touching the
> > rcar-du driver will be applied through drm-misc ?
> 
> Ack. You're the maintainer, and we need to respect that.
> 
> In general, I'll pick up any patches that are good, but the current
> track record is that Markus' patches need extra scrutiny, and many of
> the patches contain subjective changes that lead to debate that is not
> constructive. There's no return on investment here.

That's how I see it too. If there's an important fix I'll look into it, but 
patches that have little value are just a waste of bandwidth.

-- 
Regards,

Laurent Pinchart
