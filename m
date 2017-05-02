Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39151 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbdEBKFc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 06:05:32 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car Gen3 HDMI output support
Date: Tue, 02 May 2017 13:06:47 +0300
Message-ID: <3509082.7kXcTHXJsv@avalon>
In-Reply-To: <CAMuHMdXSRN-kb0cSvi99omSYW6JA2YgvANJaLY6ysGbZpPAU2A@mail.gmail.com>
References: <19852948.3die4YcTFG@avalon> <CAMuHMdXSRN-kb0cSvi99omSYW6JA2YgvANJaLY6ysGbZpPAU2A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday 02 May 2017 11:24:11 Geert Uytterhoeven wrote:
> On Mon, Mar 6, 2017 at 1:32 AM, Laurent Pinchart wrote:
> > Please find two pull requests below for renesas-drivers (in a single
> > e-mail, lucky you :-)).
> > 
> > The second tag contains DT changes only and is based on Simon's latest
> > devel branch. Nothing special there, it should just not make it to
> > mainline before the driver changes get accepted.
> > 
> > The following changes since commit 
2537532db23bdd9ecd2c1c956ac430a9a08738a8:
> >   Merge branch 'arm64-dt-for-v4.12' into devel (2017-03-02 16:02:44 +0100)
> > 
> > are available in the git repository at:
> >   git://linuxtv.org/pinchartl/media.git tags/drm-next-dt-v3-20170306
> > 
> > for you to fetch changes up to 111e8637fa9ad8261c25d437255c16f8e4e57116:
> >   ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels
> > 
> > (2017-03-06 02:12:00 +0200)
> 
> Dropped, too many conflicts ("Simon's latest devel branch", from 8 weeks
> ago).

I thought the whole purpose of providing separate branches for DT integration 
was to allow you to resolve the conflicts ?

-- 
Regards,

Laurent Pinchart
