Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:50539 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751405AbeCUIhr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Mar 2018 04:37:47 -0400
Received: by mail-wm0-f42.google.com with SMTP id f19so8132761wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Mar 2018 01:37:46 -0700 (PDT)
Date: Wed, 21 Mar 2018 09:37:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [Intel-gfx] [PATCH igt 0/8] Non-Intel test suite fixes
Message-ID: <20180321083742.GC14155@phenom.ffwll.local>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180316085551.GG14155@phenom.ffwll.local>
 <CAO3366wA2iUko95gJghTLptZ0HvS6iZzkSKp1NezyH3_kkoEAw@mail.gmail.com>
 <1868096.KLcM8ItYGk@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1868096.KLcM8ItYGk@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 20, 2018 at 01:32:17PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Monday, 19 March 2018 18:41:05 EET Ulrich Hecht wrote:
> > On Fri, Mar 16, 2018 at 9:55 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Mar 15, 2018 at 03:45:36PM +0100, Ulrich Hecht wrote:
> > >> Hi!
> > >> 
> > >> I have run the tests on a Renesas R-Car M3-W's DU device, and have found
> > >> a number of false negatives that mostly stem from use of Intel-specifics
> > >> without checking if that makes sense first. So here's a bunch of fixes
> > >> for those, hope they are generic enough for upstreaming.
> > > 
> > > Nice, other people using this! Do you plan to maintain this actively going
> > > forward, or is this more a one-off effort?
> > 
> > For now, this is just an attempt at evaluating if this works for us.
> > It has caught a few things that look like legitimate bugs to me,
> > though...
> 
> That's good news ! (Not that I'm happy that we have bugs, but catching them 
> shows that igt is useful for us). I hope this will help convincing management 
> that we should keep contributing to igt going forward.

Yeah I'm really hoping other vendors could join the fun, and long-term
we'd have a real kms validation suite. There's always going to be a need
for vendor-specific tests (and we're happy to merge them, see e.g. vc4),
but having a test suite that tries to be generic as much as possible, for
an uapi that tries to be generic too, seems like a really good idea.

Very much welcome on board!

Aside: If there's anything we can do to help convince your management that
this is good idea (like the rename from intel-gpu-tools to igt gpu tests
we've done), please bring it up.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
