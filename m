Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43417 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbeISPC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 11:02:29 -0400
Date: Wed, 19 Sep 2018 11:25:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <greg@kroah.com>, ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix
Message-ID: <20180919092524.6yaote2dnnrce7g7@verge.net.au>
References: <20180918085053.lu2k46vqffzj37ah@verge.net.au>
 <CAMuHMdVYPgfXvOzUOOLEwb_uy9Jo=V_Wkcr6mnTbo=YsAk2f0g@mail.gmail.com>
 <20180919090823.qyonqdzlvpkr5qqk@verge.net.au>
 <CAMuHMdWB5XZo+bJFmEmfVk61jwnudeV5FwgcQ7eyXZkEB8_Oig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWB5XZo+bJFmEmfVk61jwnudeV5FwgcQ7eyXZkEB8_Oig@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 11:13:14AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Sep 19, 2018 at 11:08 AM Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Sep 18, 2018 at 12:07:50PM +0200, Geert Uytterhoeven wrote:
> > > [*] The only regression I'm aware of is a regression in 4.14-stable, which can
> > >     be fixed by "tick/nohz: Prevent bogus softirq pending warning".
> > >     (https://lore.kernel.org/patchwork/patch/979451/).
> >
> > Is that something we want to add to LTSI-4.14?
> 
> As that is a fix for a regression introduced in v4.14.62, I think it should
> be fixed in 4.14-stable instead (and hopefully be fixed automatically in
> v4.14.x-ltsi rc2 or final).

Ok, that sounds reasonable to me.

Let me know if you want to revisit this at some point.
