Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:51081 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751437AbdJ2STd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Oct 2017 14:19:33 -0400
Subject: Re: drm/rcar-du: Use common error handling code in
 rcar_du_encoders_init()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
 <87tvyke8g2.fsf@intel.com> <1864580.oVLIQZJ4NS@avalon>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <3b553cd9-f923-7e45-70b8-008d3b78b202@users.sourceforge.net>
Date: Sun, 29 Oct 2017 19:19:22 +0100
MIME-Version: 1.0
In-Reply-To: <1864580.oVLIQZJ4NS@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Just for the record, I've been bitten in the past by applying one of Markus' 
> patches that seemed to make sense, only to discover later that it introduced a 
> security hole.

How do you think about to take another look at the circumstances
under which a questionable commit happened in the referenced case?

A few glitches occur occasionally. They can be fixed by appropriate collaboration.


> I now drop his patches altogether, so could you please keep an eye open
> to make sure none of them touching the rcar-du driver will be applied
> through drm-misc ?

I hope that you can become interested in a more constructive software development
dialogue (also with me) again.

* Can additional ideas be taken into account here?

* Will any other contributor pick related update suggestions up?

Regards,
Markus
