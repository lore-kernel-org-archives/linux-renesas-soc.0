Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39088 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752446AbdGMXID (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 19:08:03 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix comments to comply with the kernel coding style
Date: Fri, 14 Jul 2017 02:08:06 +0300
Message-ID: <5122189.VoqZUFnf2n@avalon>
In-Reply-To: <20170713123815.5bdayu2kkzp7tnl5@phenom.ffwll.local>
References: <20170712170042.14084-1-laurent.pinchart+renesas@ideasonboard.com> <20170713123815.5bdayu2kkzp7tnl5@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Thursday 13 Jul 2017 14:38:15 Daniel Vetter wrote:
> On Wed, Jul 12, 2017 at 08:00:42PM +0300, Laurent Pinchart wrote:
> > To avoid mixing comment styles when new comments complying with the
> > kernel coding style are introduced, fix all multiline comments in one
> > go.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Afaik the entirety of davem's -net is commented like this, this is
> checkpatch being a bit over the top. And drm is often commented like this
> too.

I have a slight preference for the "-net" style, but given that both 
checkpatch and Linus complain about it, and that I receive patches with the 
"correct" coding style, I'd rather not mix the two in the driver.

-- 
Regards,

Laurent Pinchart
