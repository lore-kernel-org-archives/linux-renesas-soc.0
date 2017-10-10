Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 10 Oct 2017 14:02:40 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: renesas_usbhs: add support for R-Car D3
Message-ID: <20171010190240.jrjzlfaiebhron6r@rob-hp-laptop>
References: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1507028954-15738-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507028954-15738-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 03, 2017 at 08:09:14PM +0900, Yoshihiro Shimoda wrote:
> This patch adds support for R-Car D3. This SoC needs to release
> the PLL reset by the UGCTRL register. So, since this is not the same
> as other R-Car Gen3 SoCs, this patch adds a new type as
> "USBHS_TYPE_RCAR_GEN3_WITH_PLL".
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/usb/renesas_usbhs.txt      |  1 +
>  drivers/usb/renesas_usbhs/common.c                 | 10 ++++-
>  drivers/usb/renesas_usbhs/rcar3.c                  | 48 ++++++++++++++++++++++
>  drivers/usb/renesas_usbhs/rcar3.h                  |  1 +
>  include/linux/usb/renesas_usbhs.h                  |  5 ++-
>  5 files changed, 62 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
