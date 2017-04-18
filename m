Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51107 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756198AbdDRIzf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 04:55:35 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car Gen3 HDMI output support
Date: Tue, 18 Apr 2017 11:56:35 +0300
Message-ID: <4801770.S3YjAIert9@avalon>
In-Reply-To: <CAMuHMdUrTxowdyhFVaiJRkP7Ypyy_w6FYUaQqQ0uNsF1FErZyw@mail.gmail.com>
References: <19852948.3die4YcTFG@avalon> <CAMuHMdUrTxowdyhFVaiJRkP7Ypyy_w6FYUaQqQ0uNsF1FErZyw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday 18 Apr 2017 10:54:43 Geert Uytterhoeven wrote:
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
> > 
> > The following changes since commit 
8d9874ba9561805fa7134c3371f8bf6b0650eb43:
> >   Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm/next/base
> > 
> > (2017-03-03 16:57:48 +0200)
> > 
> > are available in the git repository at:
> >   git://linuxtv.org/pinchartl/media.git tags/drm-du-hdmi-v3-20170306
> 
> Dropped, as I assume all of this has been merged in -next.

It's been in drm-next for a few weeks now, and should end up in v4.12-rc1.

-- 
Regards,

Laurent Pinchart
