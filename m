Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:43100 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757810AbdEVNXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 09:23:43 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] drm: rcar-du: Map memory through the VSP device
Date: Mon, 22 May 2017 16:23:58 +0300
Message-ID: <1878179.RM5CVv0lR3@avalon>
In-Reply-To: <CAMuHMdUxVTrQiROtq_aEaQDsPUVt697FBFTPrO_KKfeQAa+CXg@mail.gmail.com>
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com> <b6e8a637-94af-80f0-c438-816648c2d8fa@ideasonboard.com> <CAMuHMdUxVTrQiROtq_aEaQDsPUVt697FBFTPrO_KKfeQAa+CXg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Geert and Kieran,

On Monday 22 May 2017 15:00:27 Geert Uytterhoeven wrote:
> On Mon, May 22, 2017 at 2:52 PM, Kieran Bingham wrote:
> > My only distaste there is having to then add the [i-1] index to the
> > sg_tables.
> > 
> > I have just experimented with:
> > 
> > fail:
> >         for (; i-- != 0;) {
> >                 struct sg_table *sgt = &rstate->sg_tables[i];
> >                 ...
> >         }
> > 
> > This performs the correct loops, with the correct indexes, but does the
> > decrement in the condition offend coding styles ?
> > 
> > If that's disliked even more I'll just apply your suggestion.
> 
> You can still use "i-- > 0", which looks a little bit better IMHO.

I'm fine with that option too.

-- 
Regards,

Laurent Pinchart
