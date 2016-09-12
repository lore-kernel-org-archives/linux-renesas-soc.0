Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41851 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757715AbcILKa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 06:30:29 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Hiep Cao Minh <cm-hiep@jinso.co.jp>,
        Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?utf-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@sang-engineering.com>
Subject: Re: GEN2: Initialization of VSP1 failed at upstream v4.8-rc2
Date: Mon, 12 Sep 2016 13:31:07 +0300
Message-ID: <14183308.lEBcY4YWhy@avalon>
In-Reply-To: <CAMuHMdWouXw1Cen8wyoHFHEYQpOvwOg3gLGpA2VtDUerk1iqbg@mail.gmail.com>
References: <57A46D20.7040106@jinso.co.jp> <57D66DEC.4090607@jinso.co.jp> <CAMuHMdWouXw1Cen8wyoHFHEYQpOvwOg3gLGpA2VtDUerk1iqbg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Monday 12 Sep 2016 11:06:02 Geert Uytterhoeven wrote:
> On Mon, Sep 12, 2016 at 10:57 AM, Hiep Cao Minh <cm-hiep@jinso.co.jp> wrote:
> > As you know the information about Initialization of VSP1 failed at
> > upstream v4.8-rc2 from the report of "The failure summary report of GEN2
> > for Linux v4.8-rc2".
> > 
> > "[    5.237049] vsp1: probe of fe920000.vsp1 failed with error -38
> > [    5.254664] vsp1: probe of fe928000.vsp1 failed with error -38
> > [    5.272277] vsp1: probe of fe930000.vsp1 failed with error -38
> > [    5.289891] vsp1: probe of fe938000.vsp1 failed with error -38"
> > 
> > I have found the patch that causing of this issue:
> > "94fcdf8 [media] v4l: vsp1: Add FCP support"
> > 
> > In this patch,
> > 
> > "@@ -528,7 +533,7 @@ static int vsp1_pm_runtime_resume(struct device *dev)
> >                         return ret;
> >         }
> > 
> > -       return 0;
> > +       return rcar_fcp_enable(vsp1->fcp);
> >  }"
> > 
> > vsp1_pm_runtime_resume() function should be returned "0" if it success.
> > I tried to debug this place, and I realize that the rcar_fcp_enable()
> > function returned "-38" during Initialization.
> > That's why the error message occurs.
> > We know that the rcar_fcp_enable() function also returns 0 on success or a
> > negative error code if an error occurs.
> > So, I am thinking of something just before it happens.
> 
> Please see commits d0cd1e773fee06ed "[media] rcar-fcp: Make sure
> rcar_fcp_enable() returns 0 on success" in renesas-drivers and
> ba75faf43dc60744 in media-next.
> 
> But we indeed need this fix in v4.8, not v4.9.

Mauro, you've queued

commit ba75faf43dc60744608ffa1412fdeceff2126cbc
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Tue Aug 9 12:36:41 2016 -0300

    [media] rcar-fcp: Make sure rcar_fcp_enable() returns 0 on success

to the media tree master branch, but it fixes a v4.8 regression. Could you 
please apply it to the fixes branch and push it upstream for v4.8 ?

-- 
Regards,

Laurent Pinchart
