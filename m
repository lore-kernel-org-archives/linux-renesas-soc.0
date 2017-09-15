Subject: Re: [PULL REQUEST] vsp-du: Updates for the R-Car VSP1/DU drivers [No
 it's not]
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, geert@glider.be
References: <1505494928-5616-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <3f3898ee-6f93-50b2-a2f3-9fd1e2f171c3@ideasonboard.com>
Date: Fri, 15 Sep 2017 18:05:47 +0100
MIME-Version: 1.0
In-Reply-To: <1505494928-5616-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Please excuse my copy/paste error, and ignore this one :D
A very much similar pull request immediately follows.

It's been a *long* week, and I should step away from the office :D

--
Kieran

On 15/09/17 18:02, Kieran Bingham wrote:
> The following changes since commit ac74d019be78a24c610f9fb1f007bb46dbcf6fba:
> 
>   Merge remote-tracking branch 'airlied-drm/drm-next' into vsp1/next (2017-09-15 14:40:32 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp-du/du-suspend-resume/v1
> 
> for you to fetch changes up to 29952c78e7fa4533f18bbf629dd01a95abdfd61f:
> 
>   drm: rcar-du: Remove unused CRTC suspend/resume functions (2017-09-15 14:45:31 +0100)
> 
> ----------------------------------------------------------------
> VSP1 and DU Suspend Resume v1
> 
> Support DU suspend and resume, with a bug fix in VSP1 and (re-)implementation
> in rcar-du of the suspend handlers
> 
> ----------------------------------------------------------------
> Kieran Bingham (3):
>       media: vsp1: Prevent resuming DRM pipelines
>       drm: rcar-du: Add suspend resume helpers
>       drm: rcar-du: Remove unused CRTC suspend/resume functions
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 35 ----------------------------------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 18 ++++++++++++++---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
>  drivers/media/platform/vsp1/vsp1_drv.c |  8 +++++++-
>  4 files changed, 23 insertions(+), 39 deletions(-)
> 
