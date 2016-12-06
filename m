Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Fix R-Car Gen3 crash when VSP is disabled
Date: Tue, 06 Dec 2016 16:07:02 +0200
Message-ID: <6891266.RiLSMIFh5n@avalon>
In-Reply-To: <CANqRtoTbjD7aqceT1JaOr3S+g7S68aUu5nWAOrLHU_--NHgcLQ@mail.gmail.com>
References: <20161026033143.6617.5834.sendpatchset@little-apple> <CAMuHMdVfpXHiOw5odMWGX=xKAzEhnEAHGPiGHF19iPF-kMVy4A@mail.gmail.com> <CANqRtoTbjD7aqceT1JaOr3S+g7S68aUu5nWAOrLHU_--NHgcLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Wednesday 26 Oct 2016 18:13:23 Magnus Damm wrote:
> On Wed, Oct 26, 2016 at 4:31 PM, Geert Uytterhoeven wrote:
> > On Wed, Oct 26, 2016 at 5:31 AM, Magnus Damm wrote:
> >> From: Magnus Damm <damm+renesas@opensource.se>
> >> 
> >> For the DU to operate on R-Car Gen3 hardware a combination of DU
> >> and VSP devices are required. Since the DU driver also supports
> >> earlier generations hardware the VSP portion is enabled via Kconfig.
> >> 
> >> The arm64 defconfig is as of v4.9-rc1 having the DU driver enabled
> >> as a module, however this is not enough to support R-Car Gen3. In
> >> the current case of CONFIG_DRM_RCAR_VSP=n then the kernel crashes
> >> when loading the module. This patch is fixing that particular case.
> >> 
> >> In more detail, the crash triggers in drm_atomic_get_plane_state()
> >> when __drm_atomic_helper_set_config() passes NULL as crtc->primary.
> >> 
> >> This patch corrects this issue by failing to load the DU driver on
> >> R-Car Gen3 when VSP is not available.
> >> 
> >> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >> ---
> >> 
> >>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> --- 0001/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> >> +++ work/drivers/gpu/drm/rcar-du/rcar_du_vsp.h  2016-10-26
> >> 00:01:12.920607110 +0900 @@ -70,7 +70,7 @@ void
> >> rcar_du_vsp_disable(struct rcar_du_
> >> 
> >>  void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
> >>  void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
> >>  #else
> >> 
> >> -static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return 0;
> >> };
> >> +static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return
> >> -ENXIO; };

With this patch applied the DU will fail to probe on Gen2 if DRM_RCAR_VSP is 
disabled.

DRM_RCAR_DU should instead depend on VIDEO_RENESAS_VSP1 (with DRM_RCAR_VSP 
always set) on Gen3.

> > -ENODEV sounds more appropriate
> 
> Ok, however -ENXIO is the same error code as the DU driver currently
> returns when dealing with the VSP and not finding DT nodes.
> 
> To avoid dealing with this again I would prefer skipping per-driver
> Kconfig options entirely, for instance something like this:
> 
> [PATCH/RFC] Simplify Gen3 DU and VSP Kconfig bits
> https://www.spinics.net/lists/linux-sh/msg45978.html
> 
> >>  static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
> >>  static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
> >>  static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) {
> >>  };
> > 
> > Alternatively,  DRM_RCAR_DU can force DRM_RCAR_VSP to y if ARCH_R8A7795
> > or ARCH_R8A7796 is enabled.
> 
> The DU driver has symbol dependencies on VSP and FCP driver code
> (V4L2), so we need to take the state of driver support for those
> modules into consideration as well instead of only depending on
> SoC-specific Kconfig symbols.
> 
> On Wed, Oct 26, 2016 at 4:31 PM, Geert Uytterhoeven wrote:
> > On Wed, Oct 26, 2016 at 5:31 AM, Magnus Damm wrote:
> >> The arm64 defconfig is as of v4.9-rc1 having the DU driver enabled
> >> as a module, however this is not enough to support R-Car Gen3. In
> > 
> > Nope, arm64 defconfig on v4.9-rc1:
> > # CONFIG_DRM_RCAR_DU is not set
> 
> Right, you are correct. Sorry for the noise. It seems that I was using
> renesas-drivers-2016-10-18-v4.9-rc1 - not mainline v4.9-rc1.
> 
> Without this fix the driver still crashes, but not due to defconfig in
> v4.9-rc1.

-- 
Regards,

Laurent Pinchart
