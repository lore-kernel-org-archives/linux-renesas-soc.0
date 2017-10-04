Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 4 Oct 2017 11:48:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: balbi@kernel.org, kishon@ti.com, sre@kernel.org,
        gregkh@linuxfoundation.org, heiko@sntech.de,
        yoshihiro.shimoda.uh@renesas.com, krzk@kernel.org,
        b.zolnierkie@samsung.com, maxime.ripard@free-electrons.com,
        wens@csie.org, chanwoo@kernel.org, myungjoo.ham@samsung.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] extcon: Split out extcon header file for consumer and
 provider device
Message-ID: <20171004104850.aeedla2bkns36iw7@dell>
References: <CGME20170929000148epcas2p200e56186b067ec626a033c7ae2d4bbdb@epcas2p2.samsung.com>
 <1506643305-4581-1-git-send-email-cw00.choi@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1506643305-4581-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 29 Sep 2017, Chanwoo Choi wrote:

> The extcon has two type of extcon devices as following.
> - 'extcon provider deivce' adds new extcon device and detect the
>    state/properties of external connector. Also, it notifies the
>    state/properties to the extcon consumer device.
> - 'extcon consumer device' gets the change state/properties
>    from extcon provider device.
> Prior to that, include/linux/extcon.h contains all exported API for
> both provider and consumer device driver. To clarify the meaning of
> header file and to remove the wrong use-case on consumer device,
> this patch separates into extcon.h and extcon-provider.h.
> 
> [Description for include/linux/{extcon.h|extcon-provider.h}]
> - extcon.h includes the extcon API and data structure for extcon consumer
>   device driver. This header file contains the following APIs:
>   : Register/unregister the notifier to catch the change of extcon device
>   : Get the extcon device instance
>   : Get the extcon device name
>   : Get the state of each external connector
>   : Get the property value of each external connector
>   : Get the property capability of each external connector
> 
> - extcon-provider.h includes the extcon API and data structure for extcon
>   provider device driver. This header file contains the following APIs:
>   : Include 'include/linux/extcon.h'
>   : Allocate the memory for extcon device instance
>   : Register/unregister extcon device
>   : Set the state of each external connector
>   : Set the property value of each external connector
>   : Set the property capability of each external connector
> 
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/extcon/extcon-adc-jack.c              |   2 +-
>  drivers/extcon/extcon-arizona.c               |   2 +-
>  drivers/extcon/extcon-axp288.c                |   2 +-
>  drivers/extcon/extcon-gpio.c                  |   2 +-
>  drivers/extcon/extcon-intel-cht-wc.c          |   2 +-
>  drivers/extcon/extcon-intel-int3496.c         |   2 +-
>  drivers/extcon/extcon-max14577.c              |   2 +-
>  drivers/extcon/extcon-max3355.c               |   2 +-
>  drivers/extcon/extcon-max77693.c              |   2 +-
>  drivers/extcon/extcon-max77843.c              |   2 +-
>  drivers/extcon/extcon-max8997.c               |   2 +-
>  drivers/extcon/extcon-qcom-spmi-misc.c        |   2 +-
>  drivers/extcon/extcon-rt8973a.c               |   2 +-
>  drivers/extcon/extcon-sm5502.c                |   2 +-
>  drivers/extcon/extcon-usb-gpio.c              |   2 +-
>  drivers/extcon/extcon-usbc-cros-ec.c          |   2 +-
>  drivers/extcon/extcon.h                       |   2 +-
>  drivers/phy/allwinner/phy-sun4i-usb.c         |   2 +-
>  drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c     |   2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c      |   2 +-
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c |   2 +-
>  drivers/power/supply/qcom_smbb.c              |   2 +-
>  drivers/usb/gadget/udc/renesas_usb3.c         |   2 +-
>  drivers/usb/phy/phy-tahvo.c                   |   2 +-
>  drivers/usb/renesas_usbhs/common.h            |   2 +-
>  include/linux/extcon-provider.h               | 142 ++++++++++++++++++++++++++
>  include/linux/extcon.h                        | 109 +-------------------

>  include/linux/mfd/palmas.h                    |   2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
