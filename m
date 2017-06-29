Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm: rcar-du: use of_graph_get_remote_endpoint()
Date: Thu, 29 Jun 2017 14:26:56 +0300
Message-ID: <2319141.h6UJ5H9hiK@avalon>
In-Reply-To: <CAMuHMdUF-y38M3R4=fhb547aiF=+qwOpjipAXaThkQiTMQz7fg@mail.gmail.com>
References: <87mv8tez69.wl%kuninori.morimoto.gx@renesas.com> <2246315.6ZutvAkGUK@avalon> <CAMuHMdUF-y38M3R4=fhb547aiF=+qwOpjipAXaThkQiTMQz7fg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday 29 Jun 2017 13:22:14 Geert Uytterhoeven wrote:
> On Thu, Jun 29, 2017 at 12:44 PM, Laurent Pinchart wrote:
> > On Wednesday 28 Jun 2017 00:32:17 Kuninori Morimoto wrote:
> >> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >> 
> >> Now, we can use of_graph_get_remote_endpoint(). Let's use it.
> >> 
> >> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> >> ---
> >> based on 4c9c3d595f1bad021cc126d20879df4016801736
> >> ("of_graph: add of_graph_get_remote_endpoint()")
> > 
> > This commit isn't upstream yet. I've taken the patch in my tree and will
> 
> FTR, it is in linux-next, but the function has been moved from
> drivers/of/base.c to drivers/of/property.c.

Yes, I've seen the patch in linux-next.

> > rebase it on top of v4.13-rc1 before submitting it for v4.14.
> 
> Note that a simple rebase won't make it disappear, due to the move.
> So you'll have to drop it explicitly.

I'm not sure to follow you. This is a driver patch, depending on a function 
that will make it to v4.13-rc1. At this time it thus doesn't compile against 
mainline. I'll rebase it on top of v4.13-rc1, the dependency will be there, 
and I'll submit it for v4.14.

-- 
Regards,

Laurent Pinchart

