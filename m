Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 23 Feb 2016 15:39:24 -0600
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: horms@verge.net.au, magnus.damm@gmail.com, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC v2 2/9] phy: rcar-gen3-usb2: Add vbus-supply to
 handle VBUS on/off
Message-ID: <20160223213924.GA20264@rob-hp-laptop>
References: <1456135088-7976-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1456135088-7976-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456135088-7976-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 22, 2016 at 06:58:01PM +0900, Yoshihiro Shimoda wrote:
> To handle the VBUS on/off by a regulator driver, this patch adds
> regulator APIs calling in the driver and description about vbus-supply
> in the rcar-gen3-phy-usb2.txt.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/phy/phy-rcar-gen3-usb2.c                   | 28 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
