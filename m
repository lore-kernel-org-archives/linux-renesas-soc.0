Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 6 Oct 2017 11:15:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] phy: rcar-gen3-usb2: check dr_mode for otg mode
Message-ID: <20171006091550.GE7734@verge.net.au>
References: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1504233685-17947-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504233685-17947-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 01, 2017 at 11:41:22AM +0900, Yoshihiro Shimoda wrote:
> The previous code assumed a channel has otg capability if a channel
> has interrupt property. But, it is not good because:
>  - Battery charging feature also needs interrupt property.
>  - Some R-Car Gen3 SoCs (e.g. R-Car D3) don't have OTG capability.
> 
> So, this patch checks whether usb 2.0 host node has dr_mode property or
> not. If it has 'dr_mode = "otg";', this driver enables otg capability.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
