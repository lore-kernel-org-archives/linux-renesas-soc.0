Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.fireflyinternet.com ([109.228.58.192]:54565 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1764415AbdAJOFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 09:05:03 -0500
Date: Tue, 10 Jan 2017 14:04:59 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: DRM range manger test failures
Message-ID: <20170110140459.GG5700@nuc-i3427.alporthouse.com>
References: <CAMuHMdXJVRmOCMVmaS_O28c2x2YinqXCK1-Z3bNzRckWo7YJ3Q@mail.gmail.com>
 <20170110124504.GE5700@nuc-i3427.alporthouse.com>
 <20170110135117.djd5iczshii36vij@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170110135117.djd5iczshii36vij@phenom.ffwll.local>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 10, 2017 at 02:51:17PM +0100, Daniel Vetter wrote:
> On Tue, Jan 10, 2017 at 12:45:04PM +0000, Chris Wilson wrote:
> > On Tue, Jan 10, 2017 at 01:41:54PM +0100, Geert Uytterhoeven wrote:
> > > Hi Chris, Laurent,
> > > 
> > > On R-Car Gen2 (Koelsch) and Gen3 (Salvator-X), the new DRM range
> > > manager selftests fail with:
> > > 
> > >     drm_mm: Testing DRM range manger (struct drm_mm), with
> > > random_seed=0x83a9b910 max_iterations=8192 max_prime=128
> > >     drm_mm: igt_sanitycheck - ok!
> > >     drm_mm: node has wrong color, found 0, expected 1
> > >     drm_mm: default insert failed, size 1 step 1
> > > 
> > > I have no idea what this means.
> > 
> > The existing code has bugs. We got as far as applying the testcases to
> > demonstrate the bugs, the actual fix is still queued.
> 
> Hm, I thought I merged them all. What's missing?

The actual fix required some coordination between drm-misc and i915
trees, so was delayed. (Only because I wanted to remove repetition of
the bug from i915 first.)
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
