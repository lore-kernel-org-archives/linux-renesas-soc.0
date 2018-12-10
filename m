Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:56858 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbeLJMc3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:32:29 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77995: draak: Add backlight
Date: Mon, 10 Dec 2018 14:33:08 +0200
Message-ID: <4097394.UXB4c1edBM@avalon>
In-Reply-To: <CAMuHMdUKxTVuroRuwQCWp9OZufJKRSM-dN_ee0zKj9OhNy273Q@mail.gmail.com>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXq7vyo6WF1L8JigX_=HKbBSQdoMJB5hpUmyXrE0O1oTw@mail.gmail.com> <CAMuHMdUKxTVuroRuwQCWp9OZufJKRSM-dN_ee0zKj9OhNy273Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday, 10 December 2018 14:30:22 EET Geert Uytterhoeven wrote:
> On Tue, Dec 4, 2018 at 6:36 PM Geert Uytterhoeven wrote:
> > On Sun, Nov 25, 2018 at 3:40 PM Laurent Pinchart wrote:
> >> Add the backlight device for the LVDS1 output, in preparation for panel
> >> support.
> >> 
> >> Signed-off-by: Laurent Pinchart
> >> <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Oops, seems I missed the backlight node should be moved up, to preserve
> sort order.

I assumed that aliases and chosen should be kept at the top of the file. Maybe 
we don't want to keep the tradition :-)

-- 
Regards,

Laurent Pinchart
