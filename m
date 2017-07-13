Subject: Re: [PATCH v2 00/14] Renesas R-Car VSP: Add H3 ES2.0 support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20170626181226.29575-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieranbingham@gmail.com>
Message-ID: <09a49f67-506a-13b7-57c8-d236edf2bebf@gmail.com>
Date: Thu, 13 Jul 2017 12:46:16 +0100
MIME-Version: 1.0
In-Reply-To: <20170626181226.29575-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thankyou for these patches, bringing life to the outputs of my ES2.0 target board.

I have tested them on my board, and including the VSP unit test suite, and
kmscube utilities.

Feel free to add a Tested-by: Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> to all of the patches if you desire,
and I'm working through the individual reviews.

Oh - and now I've just said that - I did some extra testing with both HDMI and
VGA output connected and ran
   kmstest --flip --sync

Could you try this and see if you get any issues?

I'll run

This series conflicts with my current developments, therefore I will rebase my
work on top of this series. I don't need an immutable branch, but please do let
me know if this series changes :-)

--
Regards

Kieran.

On 26/06/17 19:12, Laurent Pinchart wrote:
> Hello,
> 
> This patch series implements support for the R-Car H3 ES2.0 SoC in the VSP
> and DU drivers.
>  
> Compared to the H3 ES1.1, the H3 ES2.0 has a new VSP2-DL instance that
> includes two blending units, a BRU and a BRS. The BRS is similar to the BRU
> but has two inputs only, and is used to service a second DU channel from the
> same VSP through a second LIF instances connected to WPF.1.
> 
> The patch series starts with a small fixes and cleanups in patches 01/14 to
> 05/14. Patch 06/14 prepares the VSP driver for multiple DU channels support by
> extending the DU-VSP API with an additional argument. Patches 07/14 to 10/14
> gradually build H3 ES2.0 support on top of that by implementing all needed
> features in the VSP driver.
> 
> So far the VSP driver always used headerless display lists when operating in
> connection with the DU. This mode of operation is only available on WPF.0, so
> support for regular display lists with headers when operating with the DU is
> added in patch 11/14.
> 
> The remaining patches finally implement H3 ES2.0 support in the DU driver,
> with support for VSP sharing implemented in patch 12/14, for H3 ES2.0 PLL in
> patch 13/14 (by restricting the ES1.x workaround to ES1.x SoCs) and for RGB
> output routing in patch 14/14.
> 
> Compared to v1, the series has gone under considerable changes. Testing
> locally on H3 ES2.0 uncovered multiple issues in the previous partially tested
> version, which have been fixed in additional patches. The following changes
> can be noted in particular.
> 
> - New small cleanups in patches 02/14 to 05/14
> - Pass the pipe index to vsp1_du_atomic_update() explicitly
> - Rebase on top of the VSP-DU flicker fixes, resulting in a major rework of
>   "v4l: vsp1: Add support for header display lists in continuous mode"
> - New patches 09/14, 10/14 and 12/14 to support the previously untested VGA
>   output
> 
> The series is based on top of Dave's latest drm-next branch as it depends on
> patches merged by Dave for v4.13. It depends, for testing, on
> 
> - the sh-pfc-for-v4.13 branch from Geert's renesas-drivers tree
> - the "[PATCH v2 0/2] R-Car H3 ES2.0 Salvator-X: Enable DU support in DT"
>   patch series
> 
> For convenience, a branch merging this series with all dependencies is
> available from
> 
> 	git://linuxtv.org/pinchartl/media.git drm/next/h3-es2/merged
> 
> with the DT and driver series split in two branches respectively tagged
> drm-h3-es2-dt-20170626 and drm-h3-es2-vsp-du-20170626.
> 
> The patches have been tested on the Lager, Salvator-X H3 ES1.x, Salvator-X
> M3-W and Salvator-XS boards. All outputs have been tested using modetest
> without any noticeable regression.
> 
> Laurent Pinchart (14):
>   v4l: vsp1: Fill display list headers without holding dlm spinlock
>   v4l: vsp1: Don't recycle active list at display start
>   v4l: vsp1: Don't set WPF sink pointer
>   v4l: vsp1: Store source and sink pointers as vsp1_entity
>   v4l: vsp1: Don't create links for DRM pipeline
>   v4l: vsp1: Add pipe index argument to the VSP-DU API
>   v4l: vsp1: Add support for the BRS entity
>   v4l: vsp1: Add support for new VSP2-BS, VSP2-DL and VSP2-D instances
>   v4l: vsp1: Add support for multiple LIF instances
>   v4l: vsp1: Add support for multiple DRM pipelines
>   v4l: vsp1: Add support for header display lists in continuous mode
>   drm: rcar-du: Support multiple sources from the same VSP
>   drm: rcar-du: Restrict DPLL duty cycle workaround to H3 ES1.x
>   drm: rcar-du: Configure DPAD0 routing through last group on Gen3
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  39 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |   3 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.c   |  21 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  91 ++++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  37 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h     |  10 +-
>  drivers/media/platform/vsp1/vsp1.h        |   7 +-
>  drivers/media/platform/vsp1/vsp1_bru.c    |  45 +++--
>  drivers/media/platform/vsp1/vsp1_bru.h    |   4 +-
>  drivers/media/platform/vsp1/vsp1_dl.c     | 205 +++++++++++++---------
>  drivers/media/platform/vsp1/vsp1_dl.h     |   1 -
>  drivers/media/platform/vsp1/vsp1_drm.c    | 283 +++++++++++++++---------------
>  drivers/media/platform/vsp1/vsp1_drm.h    |  38 ++--
>  drivers/media/platform/vsp1/vsp1_drv.c    | 115 ++++++++----
>  drivers/media/platform/vsp1/vsp1_entity.c |  40 +++--
>  drivers/media/platform/vsp1/vsp1_entity.h |   5 +-
>  drivers/media/platform/vsp1/vsp1_lif.c    |   5 +-
>  drivers/media/platform/vsp1/vsp1_lif.h    |   2 +-
>  drivers/media/platform/vsp1/vsp1_pipe.c   |   7 +-
>  drivers/media/platform/vsp1/vsp1_regs.h   |  46 +++--
>  drivers/media/platform/vsp1/vsp1_video.c  |  63 ++++---
>  drivers/media/platform/vsp1/vsp1_wpf.c    |   4 +-
>  include/media/vsp1.h                      |  10 +-
>  23 files changed, 676 insertions(+), 405 deletions(-)
> 
