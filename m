Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:43775 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752938AbeASVYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 16:24:02 -0500
Date: Fri, 19 Jan 2018 15:23:58 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
Message-ID: <20180119212358.jdhabsemxosoffa2@rob-hp-laptop>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXYJmh8ssSRt8u75fTv5gyrpcoPKAuCT=BaF1Eu27CaiQ@mail.gmail.com>
 <2018729.fSqyra5bAZ@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2018729.fSqyra5bAZ@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 12, 2018 at 12:44:45PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Friday, 12 January 2018 11:49:28 EET Geert Uytterhoeven wrote:
> > On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > > The internal LVDS encoders now have their own DT bindings, representing
> > > them as part of the DU is deprecated.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > FWIW, you're not really deprecating the LVDS part, but removing it
> > completely. Do you want to keep a reference instead?
> 
> I don't think we should keep a reference as it would only confuse DT authors. 
> The information is kept in the git history. I can rewrite the commit message, 
> but I consider this as deprecating the legacy bindings.

We've done it both ways. I'm fine with just deleting.

Rob
