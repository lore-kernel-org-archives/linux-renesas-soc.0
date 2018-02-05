Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750943AbeBEGuo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 01:50:44 -0500
Date: Mon, 5 Feb 2018 14:50:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Sean Paul <seanpaul@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        CK Hu <ck.hu@mediatek.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Sinclair Yeh <syeh@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Archit Taneja <architt@codeaurora.org>,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH 5/5] drm: Don't pass clip to
 drm_atomic_helper_check_plane_state()
Message-ID: <20180205065022.GJ31354@dragon>
References: <20180123170857.13818-1-ville.syrjala@linux.intel.com>
 <20180123170857.13818-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180123170857.13818-5-ville.syrjala@linux.intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 23, 2018 at 07:08:57PM +0200, Ville Syrjala wrote:
> From: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> 
> Move the plane clip rectangle handling into
> drm_atomic_helper_check_plane_state(). Drivers no longer
> have to worry about such mundane details.
> 
> v2: Convert armada, rcar, and sun4i as well
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Gustavo Padovan <gustavo@padovan.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St�bner" <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Sinclair Yeh <syeh@vmware.com>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Archit Taneja <architt@codeaurora.org> #msm
> ---
...
>  drivers/gpu/drm/zte/zx_plane.c              | 13 +------------

Acked-by: Shawn Guo <shawnguo@kernel.org>
