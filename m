Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52374 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751369AbdJFJPZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 05:15:25 -0400
Date: Fri, 6 Oct 2017 11:15:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] phy: rcar-gen3-usb2: split the two meaning of
 "has_otg"
Message-ID: <20171006091521.GD7734@verge.net.au>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504233685-17947-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504233685-17947-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 01, 2017 at 11:41:23AM +0900, Yoshihiro Shimoda wrote:
> The has_otg on previous code has the two meaning:
>  - The channel has dedicated otg pins (ID, VBUS).
>  - The channel can swap the role via sysfs.
> 
> However, some SoCs (e.g. R-Car D3) doesn't have such dedicated pins,
> but the SoCs can swap the role. So, this patch split the two meaning
> of has_otg as "has dedicated otg pins" and adds a new value
> "can_role_swap". For now, the behavior is the same as before.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 61 ++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index e00e99a..4ea9902 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -87,7 +87,8 @@ struct rcar_gen3_chan {
>  	struct regulator *vbus;
>  	struct work_struct work;
>  	bool extcon_host;
> -	bool has_otg;
> +	bool has_otg;	/* has dedicated pins (ID, VBUS) */

Not: has_otg_pins might make for slightly easier reading of the code.

> +	bool can_role_swap;
>  };

...
