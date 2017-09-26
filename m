Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54671 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965798AbdIZNBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 09:01:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC 09/13] v4l: rcar-fcp: Configure the number of outstanding read transactions
Date: Tue, 26 Sep 2017 16:01:08 +0300
Message-ID: <3351146.sONqpoGtve@avalon>
In-Reply-To: <CAMuHMdXQ8J1cfGMnyAwhkxNQKCvR95gHESzxZswKrwoKMG_U9g@mail.gmail.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com> <20170926100605.2313-12-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXQ8J1cfGMnyAwhkxNQKCvR95gHESzxZswKrwoKMG_U9g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 26 September 2017 14:50:46 EEST Geert Uytterhoeven wrote:
> On Tue, Sep 26, 2017 at 12:06 PM, Laurent Pinchart wrote:
> > The FCPV has a selectable number of outstanding read transactions.
> > According to the documentation the value must be set based on the type
> > of the VSP the FCPV is connected to. Set the register accordingly at
> > probe time.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > @@ -228,12 +236,29 @@ static int rcar_fcp_setup(struct rcar_fcp_device
> > *fcp)
> >         dev_dbg(fcp->dev, "%s %s device found\n", models[fcp->type],
> >                 versions[i].name);
> > 
> > +       /* Set the processing mode (needed for FCPV only). */
> > +       switch (fcp->type) {
> > +       case RCAR_FCPV:
> > +               /* 64 outstanding read transactions */
> > +               rcar_fcp_write(fcp, FCP_CFG0, 0);
> > +               break;
> > +
> > +       case RCAR_FCPVI:
> > +               /* 16 outstanding read transactions */
> > +               rcar_fcp_write(fcp, FCP_CFG0, FCP_CFG0_FCPVSEL);
> > +               break;
> > +
> > +       default:
> > +               break;
> > +       }
> > +
> >         return 0;
> >  }
> >  
> >  static const struct of_device_id rcar_fcp_of_match[] = {
> >         { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
> >         { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
> > +       { .compatible = "renesas,fcpvi", .data = (void *)RCAR_FCPVI },
> >         { },
> 
> As you use "renesas,fcpv" as a fallback value, you may want to insert
> the new and more specific "renesas,fvpci" handling above it, for clarity.

Good point, I'll do that.

> I believe it will return the RCAR_FCPVI match data anyway, based on
> a higher match score for the more specific compatible value?

I don't think this is related to a match score, but to the fact the compatible 
strings from DT are tried in the left to right direction.

-- 
Regards,

Laurent Pinchart
