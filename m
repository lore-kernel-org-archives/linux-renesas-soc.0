Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 17 Oct 2017 15:27:52 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] phy: rcar-gen3-usb2: add binding for r8a77995
Message-ID: <20171017202752.q7r4qfg22xjfyung@rob-hp-laptop>
References: <1507790088-26010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507790088-26010-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507790088-26010-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 12, 2017 at 03:34:48PM +0900, Yoshihiro Shimoda wrote:
> This patch adds binding for r8a77995 (R-Car D3). Since r8a77995 doesn't
> have dedicated pins (ID, VBUS), this will match against the generic
> fallback on R-Car D3.
> 
> For now, this driver doesn't support usb role swap for r8a77995.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
