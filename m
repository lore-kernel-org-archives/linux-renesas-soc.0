Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 10 Jun 2016 18:41:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
	David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Inki Dae <inki.dae@samsung.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@freescale.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	Vincent Abriou <vincent.abriou@st.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 06/20] drm: i915: Rely on the default ->best_encoder()
 behavior where appropriate
Message-ID: <20160610164152.GO3363@phenom.ffwll.local>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-7-git-send-email-boris.brezillon@free-electrons.com>
 <20160610152412.GL3363@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160610152412.GL3363@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 10, 2016 at 05:24:12PM +0200, Daniel Vetter wrote:
> On Tue, Jun 07, 2016 at 01:48:01PM +0200, Boris Brezillon wrote:
> > For all outputs except dp_mst, we have a 1:1 relationship between
> > connectors and encoders and the driver is relying on the atomic helpers:
> > we can drop the custom ->best_encoder() implementation and let the core
> > call drm_atomic_helper_best_encoder() for us.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> You can also drop the best_encoder from intel_dp_mst, we only need the
> atomic_best_encoder. The best_encoder there was needed to help out the
> fbdev emulation. Care to respin?

Boris pointed out on irc that this won't work for the fbdev stuff since
that has a WARN_ON if theres more than 1 possible encoder. Applied this
one here instead.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
