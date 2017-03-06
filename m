Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33058 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbdCFJaW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 04:30:22 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car Gen3 HDMI output support
Date: Mon, 06 Mar 2017 11:30:56 +0200
Message-ID: <1584890.59kujkjTrY@avalon>
In-Reply-To: <CAMuHMdXj924E4n+ZzgZ0cn8b_YLWcYRvmd57Gw_B4n=adQTyjA@mail.gmail.com>
References: <19852948.3die4YcTFG@avalon> <CAMuHMdXj924E4n+ZzgZ0cn8b_YLWcYRvmd57Gw_B4n=adQTyjA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 06 Mar 2017 09:12:45 Geert Uytterhoeven wrote:
> On Mon, Mar 6, 2017 at 1:32 AM, Laurent Pinchart wrote:
> > Please find two pull requests below for renesas-drivers (in a single
> > e-mail, lucky you :-)).
> > 
> > The first tag contains driver changes only and is based on a merge of
> > drm-next and drm-misc-next. The 5 patches from Maarten Lankhorst should
> > be merged in drm-misc-next tomorrow (if all goes according to the plan).
> > I'll rebase my tree on top of that, but that will only affect branches,
> > not tags. More patches should also be merged in drm-misc-next in the next
> > couple of days, I'll then send a pull request for the rest to Dave
> > Airlie. In a few weeks I hope all of this to be in mainline.
> > 
> > The second tag contains DT changes only and is based on Simon's latest
> > devel branch. Nothing special there, it should just not make it to
> > mainline before the driver changes get accepted.
> 
> Thank you, looks good!
> 
> I believe these supersede the previous two pull requests for
>   1. git://linuxtv.org/pinchartl/media.git drm/du/hdmi
>       (rebased as topic/drm-du-hdmi-2017-01-10-rebased2),
>   2. git://linuxtv.org/pinchartl/media.git drm/next/du.
> Is that correct?

Yes, that's correct.

-- 
Regards,

Laurent Pinchart
