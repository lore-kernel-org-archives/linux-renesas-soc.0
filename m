Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1473207949.2307.1.camel@intel.com>
Subject: Re: [Thermal] Need confirmation for the pending thermal soc patches
From: Zhang Rui <rui.zhang@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Eduardo Valentin <edubezval@gmail.com>
Cc: Linux PM list <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dirk Behme <dirk.behme@de.bosch.com>
Date: Wed, 07 Sep 2016 08:25:49 +0800
In-Reply-To: <CAMuHMdVxCyy+ULdnzWTBFuCrP4E77H7JxS25QL_RSeOgtV5bVQ@mail.gmail.com>
References: <1471788540.2188.19.camel@intel.com>
         <20160905131600.GA24253@localhost.localdomain>
         <CAMuHMdVxCyy+ULdnzWTBFuCrP4E77H7JxS25QL_RSeOgtV5bVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 二, 2016-09-06 at 12:13 +0200, Geert Uytterhoeven wrote:
> Hi Eduardo,
> 
> On Mon, Sep 5, 2016 at 3:16 PM, Eduardo Valentin <edubezval@gmail.com
> > wrote:
> > 
> > On Sun, Aug 21, 2016 at 10:09:00PM +0800, Zhang Rui wrote:
> > > 
> > > As Eduardo is quite busy recently, I will take all the thermal
> > > soc
> > > driver changes this time.
> > Thanks for helping me out. I am slowing coming back to upstream
> > activities. I have refreshed my branches, removing the rework and
> > locking patches works out of the integration branches so we do not
> > have
> > merge conflicts or further delays on outstanding patches.
> > 
> > > 
> > > Currently, I have cherry picked all the patches that Eduardo has
> > > already applied in thermal-soc tree and reviewed all the pending
> > Great! This makes things easier for me.
> > 
> > > 
> > > patches in patchwork. Now, there are four patches queued for next
> > > -rc (
> > > https://git.kernel.org/cgit/linux/kernel/git/rzhang/linux.git/log
> > > /?h=fo
> > > r-rc),
> > I checked this branch. Can you please cherry-pick the following
> > patch
> > for rc:
> > https://git.kernel.org/cgit/linux/kernel/git/evalenti/linux-soc-
> > thermal.git/commit/?h=linus&id=4ba16f1256bd13efa2f3179ff1f4ab16a4ad
> > 3c7f

> That patch is indeed missing.
> 
> While preparing today's renesas-drivers release, I noticed it had
> disappeared
> from thermal-soc/next. Then I found your email...
> 
> Thanks for re-applying it!
> 

Applied and queued for next -rc.

thanks,
rui

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu
> x-m68k.org
> 
> In personal conversations with technical people, I call myself a
> hacker. But
> when I'm talking to journalists I just say "programmer" or something
> like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
