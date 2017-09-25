Subject: Re: [PATCH 0/3] R-Car DU: Clip planes to screen boundaries
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <022f8b4c-b52e-0ad1-ddb7-cb98b214551f@ideasonboard.com>
Date: Mon, 25 Sep 2017 18:27:09 +0100
MIME-Version: 1.0
In-Reply-To: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thankyou for the patches,

On 16/08/17 00:03, Laurent Pinchart wrote:
> Hello,
> 
> This patch series fixes support for planes that cross the screen boundaries.
> The KMS API supports such a configuration, but the DU and VSP hardware
> doesn't. This leads to different kind of dispay artifacts or hangs.
> 
> The series starts with a bit of refactoring to share existing code and make it
> easier to share new code (1/3). Patch 2/3 then reject planes that are fully
> off-screen as they don't work properly and we have currently no use case for
> them. Finally, patch 3/3 clips planes to screen boundaries to fix the main
> issue.
> 
> The patches are based on top of Dave's latest master branch.

Series tested and verified on Salvator-X ES1.0 using the KMS Test suite,
including suspend/resume, in combination with the "v4l: vsp1: Start and stop DRM
pipeline independently of planes" patch.

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Laurent Pinchart (3):
>   drm: rcar-du: Share plane atomic check code between Gen2 and Gen3
>   drm: rcar-du: Reject planes located fully off-screen
>   drm: rcar-du: Clip planes to screen boundaries
> 
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 109 ++++++++++++++++++++++++--------
>  drivers/gpu/drm/rcar-du/rcar_du_plane.h |   8 +++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   |  43 ++++---------
>  3 files changed, 105 insertions(+), 55 deletions(-)
> 
