Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 2 Jun 2016 23:40:04 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	David Airlie <airlied@linux.ie>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO CORE, NET..."
	<virtualization@lists.linux-foundation.org>,
	Thierry Re ding <thierry.reding@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Inki Dae <inki.dae@samsung.com>,
	linux-mediatek@lists.infradead.org, Stefan Agner <stefan@agner.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vincent Abriou <vincent.abriou@st.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Mark Yao <mark.yao@rock-chips.com>,
	Alison Wang <alison.wang@freescale.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVERS FOR RENESAS"
	<linux-renesas-soc@vger.kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	freedreno@lists.freedesktop.org,
	Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/20] drm/atomic: Fix remaining places where
 !funcs->best_encoder is valid
Message-ID: <20160602224004.GA1819@nuc-i3427.alporthouse.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464877907-27723-2-git-send-email-boris.brezillon@free-electrons.com>
 <8671722.LHaiaBNqfE@avalon>
 <CAKMK7uHyqNbA8Scw2fE0geAyNt0a0XVtzf81nwWjEhbZ-gAvKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHyqNbA8Scw2fE0geAyNt0a0XVtzf81nwWjEhbZ-gAvKw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 02, 2016 at 11:57:02PM +0200, Daniel Vetter wrote:
> drm_encoder_find is an idr lookup. That should be plenty fast,
> especially for modeset code. Usually what's too expensive even for
> modeset code is linear list walks. But Chris just submitted patches to
> convert most of them into simple lookups.

For the idr_find, I'm tempted to replace the mutex with a rwlock. It
helps pathological cases, but in reality there are more crucial
locks around the hw that limit concurrency. ;-)
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
