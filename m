Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33421 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752886AbeCTLbM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 07:31:12 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [Intel-gfx] [PATCH igt 0/8] Non-Intel test suite fixes
Date: Tue, 20 Mar 2018 13:32:17 +0200
Message-ID: <1868096.KLcM8ItYGk@avalon>
In-Reply-To: <CAO3366wA2iUko95gJghTLptZ0HvS6iZzkSKp1NezyH3_kkoEAw@mail.gmail.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20180316085551.GG14155@phenom.ffwll.local> <CAO3366wA2iUko95gJghTLptZ0HvS6iZzkSKp1NezyH3_kkoEAw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Monday, 19 March 2018 18:41:05 EET Ulrich Hecht wrote:
> On Fri, Mar 16, 2018 at 9:55 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Mar 15, 2018 at 03:45:36PM +0100, Ulrich Hecht wrote:
> >> Hi!
> >> 
> >> I have run the tests on a Renesas R-Car M3-W's DU device, and have found
> >> a number of false negatives that mostly stem from use of Intel-specifics
> >> without checking if that makes sense first. So here's a bunch of fixes
> >> for those, hope they are generic enough for upstreaming.
> > 
> > Nice, other people using this! Do you plan to maintain this actively going
> > forward, or is this more a one-off effort?
> 
> For now, this is just an attempt at evaluating if this works for us.
> It has caught a few things that look like legitimate bugs to me,
> though...

That's good news ! (Not that I'm happy that we have bugs, but catching them 
shows that igt is useful for us). I hope this will help convincing management 
that we should keep contributing to igt going forward.

Ulrich, for the record, I agree with all of Daniel's and Ville's comments 
posted so far.

-- 
Regards,

Laurent Pinchart
