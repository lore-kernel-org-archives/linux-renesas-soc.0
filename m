Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37324 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964811AbcDYVHi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 17:07:38 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	David Airlie <airlied@linux.ie>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-du: add/rename DEFR6 TCON bits
Date: Tue, 26 Apr 2016 00:07:59 +0300
Message-ID: <20054207.ltPEUenxrn@avalon>
In-Reply-To: <CAMuHMdWqskNoX4ryvzzs04LkMf6=tCQYaqn5ufuVdmsnPz8+fA@mail.gmail.com>
References: <2036550.BKBaf2zquB@wasted.cogentembedded.com> <CAMuHMdWqskNoX4ryvzzs04LkMf6=tCQYaqn5ufuVdmsnPz8+fA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 25 Apr 2016 09:25:30 Geert Uytterhoeven wrote:
> On Sat, Apr 23, 2016 at 12:56 AM, Sergei Shtylyov wrote:
> > The  TCNE2 bit  of the DEFR6 register was renamed to TCNE1 in the R-Car
> > gen2 manuals -- which makes more  sense as that bit controls whether DU1,
> > not DU2 is connected to TCON.
> > 
> > While at it, add the TCNE0 bit which controls whether DU0 is connected to
> > TCON.
> > 
> > Based on the large patch by Andrey Gusakov
> > <andrey.gusakov@cogentembedded.com>.
> > 
> > Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> I hard a hard time finding this register, as it's actually called "DEF6R"...
> Care to update /DEFRx/DEFxR/ as well?

Inconsistent information between datasheet versions I'm afraid, and even 
between different registers in a single datasheet. We have DEFR0, DEFR1, and 
then DEFxR. I wonder if it's worth renaming the registers.

> Regardless:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > ---
> > The patch is against David Airlie's 'linux.git' repo's 'drm-next' branch.
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_regs.h |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > Index: linux/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > ===================================================================
> > --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > +++ linux/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> > @@ -195,9 +195,10 @@
> > 
> >  #define DEFR6_ODPM12_DISP      (2 << 8)
> >  #define DEFR6_ODPM12_CDE       (3 << 8)
> >  #define DEFR6_ODPM12_MASK      (3 << 8)
> > 
> > -#define DEFR6_TCNE2            (1 << 6)
> > +#define DEFR6_TCNE1            (1 << 6)
> > +#define DEFR6_TCNE0            (1 << 4)
> > 
> >  #define DEFR6_MLOS1            (1 << 2)
> > 
> > -#define DEFR6_DEFAULT          (DEFR6_CODE | DEFR6_TCNE2)
> > +#define DEFR6_DEFAULT          (DEFR6_CODE | DEFR6_TCNE1)

-- 
Regards,

Laurent Pinchart
