Subject: Re: [PATCH v2 2/5] v4l: rcar-fcp: Add an API to retrieve the FCP
 device
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170516232007.20980-3-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <9a49c213-1526-4fd4-0e3b-ddf72e3f6c5a@ideasonboard.com>
Date: Mon, 22 May 2017 12:44:05 +0100
MIME-Version: 1.0
In-Reply-To: <20170516232007.20980-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thankyou for the patch:

On 17/05/17 00:20, Laurent Pinchart wrote:
> The new rcar_fcp_get_device() function retrieves the struct device
> related to the FCP device. This is useful to handle DMA mapping through
> the right device.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-fcp.c | 6 ++++++
>  include/media/rcar-fcp.h          | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
> index e9f609edf513..2988031d285d 100644
> --- a/drivers/media/platform/rcar-fcp.c
> +++ b/drivers/media/platform/rcar-fcp.c
> @@ -78,6 +78,12 @@ void rcar_fcp_put(struct rcar_fcp_device *fcp)
>  }
>  EXPORT_SYMBOL_GPL(rcar_fcp_put);
>  
> +struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp)
> +{
> +	return fcp->dev;
> +}
> +EXPORT_SYMBOL_GPL(rcar_fcp_get_device);
> +
>  /**
>   * rcar_fcp_enable - Enable an FCP
>   * @fcp: The FCP instance
> diff --git a/include/media/rcar-fcp.h b/include/media/rcar-fcp.h
> index 8723f05c6321..b60a7b176c37 100644
> --- a/include/media/rcar-fcp.h
> +++ b/include/media/rcar-fcp.h
> @@ -19,6 +19,7 @@ struct rcar_fcp_device;
>  #if IS_ENABLED(CONFIG_VIDEO_RENESAS_FCP)
>  struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np);
>  void rcar_fcp_put(struct rcar_fcp_device *fcp);
> +struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp);
>  int rcar_fcp_enable(struct rcar_fcp_device *fcp);
>  void rcar_fcp_disable(struct rcar_fcp_device *fcp);
>  #else
> @@ -27,6 +28,10 @@ static inline struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
>  	return ERR_PTR(-ENOENT);
>  }
>  static inline void rcar_fcp_put(struct rcar_fcp_device *fcp) { }
> +static inline struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp)
> +{
> +	return NULL;
> +}
>  static inline int rcar_fcp_enable(struct rcar_fcp_device *fcp)
>  {
>  	return 0;
> 
