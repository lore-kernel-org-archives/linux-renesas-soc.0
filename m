Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34870 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754576AbeALKoq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 05:44:46 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS support in the DU bindings
Date: Fri, 12 Jan 2018 12:44:45 +0200
Message-ID: <2018729.fSqyra5bAZ@avalon>
In-Reply-To: <CAMuHMdXYJmh8ssSRt8u75fTv5gyrpcoPKAuCT=BaF1Eu27CaiQ@mail.gmail.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXYJmh8ssSRt8u75fTv5gyrpcoPKAuCT=BaF1Eu27CaiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday, 12 January 2018 11:49:28 EET Geert Uytterhoeven wrote:
> On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > The internal LVDS encoders now have their own DT bindings, representing
> > them as part of the DU is deprecated.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> FWIW, you're not really deprecating the LVDS part, but removing it
> completely. Do you want to keep a reference instead?

I don't think we should keep a reference as it would only confuse DT authors. 
The information is kept in the git history. I can rewrite the commit message, 
but I consider this as deprecating the legacy bindings.

-- 
Regards,

Laurent Pinchart
