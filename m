Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43055 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbeISOpY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:45:24 -0400
Date: Wed, 19 Sep 2018 11:08:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <greg@kroah.com>, ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix
Message-ID: <20180919090823.qyonqdzlvpkr5qqk@verge.net.au>
References: <20180918085053.lu2k46vqffzj37ah@verge.net.au>
 <CAMuHMdVYPgfXvOzUOOLEwb_uy9Jo=V_Wkcr6mnTbo=YsAk2f0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVYPgfXvOzUOOLEwb_uy9Jo=V_Wkcr6mnTbo=YsAk2f0g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 18, 2018 at 12:07:50PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Sep 18, 2018 at 10:51 AM Simon Horman <horms@verge.net.au> wrote:
> > This is intended as a submission to LTSI-4.14. It is the backport
> > of a fixes for safe DMA buffer handling for the SH-Mobile I2C driver
> > and I2C code. All patches are present in v4.19-rc3.
> >
> > This pull-request is based on
> > "[GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix"
> > tagged as backport/v4.14.61/snapshot-to-v4.18+fixes-flattened,
> > which I have already sent a pull-request for.
> >
> > There are 10 patches.
> >
> > I have performed build testing of this backports on a wide range of
> > defconfigs and I am not aware of any regressions over v4.14.40 (the
> > baseline chosen when this work began).
> >
> >
> > The following changes since commit 4d4605e5c137ed9a53582e573118cbc16b82cbf1:
> >
> >   i2c: rcar: implement STOP and REP_START according to docs (2018-08-28 13:35:06 +0200)
> >
> > are available in the git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18+fixes-v2-flattened
> >
> > for you to fetch changes up to 720043a4efbb3356db116d084c7b877ad41ee51a:
> >
> >   i2c: sh_mobile: fix leak when using DMA bounce buffer (2018-09-17 15:54:30 +0200)
> 
> Thank, this all looks fine to me.
> 
> I subjected this to the same testing I do for each renesas-drivers release.
> I have detected no regressions[*].
> 
> [*] The only regression I'm aware of is a regression in 4.14-stable, which can
>     be fixed by "tick/nohz: Prevent bogus softirq pending warning".
>     (https://lore.kernel.org/patchwork/patch/979451/).

Is that something we want to add to LTSI-4.14?
