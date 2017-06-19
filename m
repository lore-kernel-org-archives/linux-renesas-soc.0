Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44628 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753565AbdFSIPD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 04:15:03 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car H3 ES2.0 display support
Date: Mon, 19 Jun 2017 11:15:36 +0300
Message-ID: <2212883.mR9x81Zv3F@avalon>
In-Reply-To: <CAMuHMdXREBCD9w8rkW6vXxh-Ro4waLN08Q1ePiS4uYoOMbGBGQ@mail.gmail.com>
References: <8149481.gNmlvl7hsu@avalon> <CAMuHMdXREBCD9w8rkW6vXxh-Ro4waLN08Q1ePiS4uYoOMbGBGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday 16 Jun 2017 10:03:57 Geert Uytterhoeven wrote:
> On Thu, Jun 15, 2017 at 8:54 PM, Laurent Pinchart wrote:
> > The following changes implement display support for the R-Car H3 ES2.0.
> > They have been split in three distinct branches:
>
> Thanks for your branches!
> 
> > - tags/drm-h3-es2-dt-20170615 contains the DT changes and is based on top
> > of topic/r8a7795es2-integration
> 
> When merging this into next-20170616, there are lots of conflicts.
> Most are due to your tag being based on a one-month old version of
> renesas-devel.
> 
> As the relevant DT changes in topic/r8a7795es2-integration have been applied
> to renesas-devel, you could rebase on top of the latter.

Do you mean renesas-devel-20170616-v4.12-rc5 ? I don't want to pull the whole 
renesas-drivers tree as a base for my development branches, I'd prefer keeping 
the out-of-mainline dependencies as small as possible.

> > - tags/drm-h3-es2-pinctrl-20170615 contains the pinctrl changes for the DU
> > and is based on top of sh-pfc-for-v4.13-tag1
> 
> Merges cleanly into next-20170616.
> 
> > - tags/drm-h3-es2-vsp-20170615 contains the VSP changes and is based on
> > top of v4.12-rc1
> 
> When merging this into next-20170616, there are two conflicts, in
> drivers/media/platform/vsp1/vsp1_dl.c and include/media/vsp1.h.

-- 
Regards,

Laurent Pinchart
