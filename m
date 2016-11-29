Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:36339 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751586AbcK2JyI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:54:08 -0500
Received: by mail-wj0-f194.google.com with SMTP id jb2so17383193wjb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2016 01:54:08 -0800 (PST)
Date: Tue, 29 Nov 2016 10:54:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/13] drm: bridge: Add LVDS encoder driver
Message-ID: <20161129095409.36di7nm3wnxns4qp@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480410283-28698-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 11:04:36AM +0200, Laurent Pinchart wrote:
> The LVDS encoder driver is a DRM bridge driver that supports the
> parallel to LVDS encoders that don't require any configuration. The
> driver thus doesn't interact with the device, but creates an LVDS
> connector for the panel and exposes its size and timing based on
> information retrieved from DT.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Since it's 100% dummy, why put LVDS into the name? This little thing here
could be our generic "wrap drm_panel and attach it to a chain" helper. So
what about calling this _The_ drm_panel_bridge, and also linking it into
docs to feature it a bit more prominently.

I came up with this because I spotted some refactoring belows for building
this helper, until I realized that this driver _is_ the helper I think we
want ;-) Only thing missing is an exported function to instantiate a
bridge with just a drm_panel as the parameter. And putting it into the
drm_kms_helper.ko module.

> +static enum drm_connector_status
> +lvds_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	return connector_status_connected;
> +}

We have piles of this exact dummy callback all over, maybe make it the
default and rip them all out?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
