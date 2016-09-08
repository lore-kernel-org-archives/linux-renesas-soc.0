Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <sakari.ailus@retiisi.org.uk>
Date: Thu, 8 Sep 2016 10:04:55 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v3 01/10] v4l: ioctl: Clear the v4l2_pix_format_mplane
 reserved field
Message-ID: <20160908070454.GD3236@valkosipuli.retiisi.org.uk>
References: <1473287110-780-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1473287110-780-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473287110-780-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 08, 2016 at 01:25:01AM +0300, Laurent Pinchart wrote:
> The S_FMT and TRY_FMT handlers in multiplane mode attempt at clearing
> the reserved fields of the v4l2_format structure after the pix_mp
> member. However, the reserved fields are inside pix_mp, not after it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran@bingham.xyz>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
