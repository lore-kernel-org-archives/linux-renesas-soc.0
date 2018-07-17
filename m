Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56971 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731228AbeGQMqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 08:46:43 -0400
Date: Tue, 17 Jul 2018 14:14:17 +0200
From: Simon Horman <horms@verge.net.au>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/shmobile: Replace drm_dev_unref with drm_dev_put
Message-ID: <20180717121417.hftjdn5cubcn4wen@verge.net.au>
References: <20180717084518.17930-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180717084518.17930-1-tzimmermann@suse.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 17, 2018 at 10:45:18AM +0200, Thomas Zimmermann wrote:
> This patch unifies the naming of DRM functions for reference counting
> of struct drm_device. The resulting code is more aligned with the rest
> of the Linux kernel interfaces.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
