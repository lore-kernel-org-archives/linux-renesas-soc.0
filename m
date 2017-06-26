Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35218 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751390AbdFZJU4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 05:20:56 -0400
Received: by mail-lf0-f53.google.com with SMTP id b207so8436358lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2017 02:20:55 -0700 (PDT)
Date: Mon, 26 Jun 2017 11:20:47 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL for renesas-drivers] ADV748x v5 device-tree.
Message-ID: <20170626092047.GI30481@bigcity.dyn.berto.se>
References: <1497471834-917-1-git-send-email-kbingham@kernel.org>
 <1497471834-917-2-git-send-email-kbingham@kernel.org>
 <CAMuHMdUNaZVCnYjnoDXZEyNa3Y8ukUjqnx6nBgeOK+0qmJT0CA@mail.gmail.com>
 <0c7174d2-36d0-89a5-eb85-947c800bd229@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c7174d2-36d0-89a5-eb85-947c800bd229@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran and Geert,

On 2017-06-16 11:30:23 +0100, Kieran Bingham wrote:
> Hi Geert, Niklas,
> 
> On 16/06/17 09:57, Geert Uytterhoeven wrote:
> > Hi Kieran,
> > 
> > On Wed, Jun 14, 2017 at 10:23 PM, Kieran Bingham <kbingham@kernel.org> wrote:
> >> Please consider this pull request for the next renesas-drivers release.
> >>
> >> This DT update is based on Simon's horms/next branch, but is also dependant
> >> upon Niklas' VIN driver DT nodes being integrated.
> > 
> > That means "make dtbs" doesn't work in this branch?
> > I think you need to sync with Niklas, so you can build your branch on
> > top of his.
> 
> Yes, that's why I tried to make that clear in the PR. sorry - as stupid as it
> was to send as is, - it is dependant upon Niklas' non-mainlined patches, and I
> had to post a pull request for my report for yesterday.
> 
> Sorry for the red-tape induced noise :(
> 
> Niklas has now made his updated DT branch available to me, so I expect to have
> sent an update before your next renesas-drivers anyway - Although Niklas, your
> rcar-vin-dt branch contains an unrelated [LOCAL] patch to defconfig. So I still
> can't base my dt patch on your dt-branch.

I never intended the rcar-vin-dt branch to be submitted for 
renesas-drivers (at lest not until the DT bindings where Acked). So I 
intentionally  left the [LOCAL] patch in that branch, but I agree the 
naming is confusing in regard to that...

> 
> How should we handle this going forwards?.

If we want to include the DT changes in renesas-driver I be happy to 
remove the [LOCAL] patch and pay more attention to details for that 
branch and include it in my for-renesas-branch.

Geert what do you think? Do you think it's a good idea for me and Kieran 
to start including the DT updates for VIN in our submissions for 
renesas-drivers? If so I would like to request a quick sanity check of 
my rcar-vin-dt as I'm not sure I fully got the hang of the new DT file 
structure and I don't want to break things :-)

> 
> I can't really base my DT branch on Niklas' as he is in concurrent active
> development.
> 
> Should I pass my DT patch on to you Niklas and consider you 'upstream' for that
> patch? (at least in regards to renesas-drivers)

If you like I have no problem to carry that patch in my rcar-vin-dt 
branch. Let me know what you wish me to do.

> 
> Then we can keep those related changes in one branch. If and when updates happen
> on my patch I can just submit them to you to update on your branch. Then we have
> a single unified place for the inherently co-dependant DT patches for VIN and
> ADV748x.
> 
> If the VIN patches make it upstream before ADV748x bindings are reviewed and
> accepted, then I can take this patch back, as at that point I can base on your
> upstreamed versions.
> 
> --
> Kieran
> 
> 
> 
> > 
> >> The following changes since commit ab4321dedd764fb6d8fad3463a93b491aabe669d:
> >>
> >>   Merge branches 'arm64-dt-for-v4.13', 'drivers-for-v4.13' and 'soc-for-v4.13' into next (2017-06-14 11:05:24 +0200)
> >>
> >> are available in the git repository at:
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/dt
> >>
> >> for you to fetch changes up to eb130d9433e9cd5b6b0f33715df18697460012ee:
> >>
> >>   arm64: dts: renesas: salvator-x: Add ADV7482 support (2017-06-14 15:46:42 +0100)
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> > 

-- 
Regards,
Niklas S�derlund
