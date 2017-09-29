Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="UTF-8"
Message-id: <59CDD25E.9050202@samsung.com>
Date: Fri, 29 Sep 2017 13:55:58 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "kishon@ti.com" <kishon@ti.com>, "sre@kernel.org" <sre@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Cc: "heiko@sntech.de" <heiko@sntech.de>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
        "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
        "wens@csie.org" <wens@csie.org>,
        "chanwoo@kernel.org" <chanwoo@kernel.org>,
        "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org"
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] extcon: Split out extcon header file for consumer and
 provider device
In-reply-to: <TY1PR06MB0992097F0FBBE04CD282EEE7D87E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <CGME20170929000148epcas2p200e56186b067ec626a033c7ae2d4bbdb@epcas2p2.samsung.com>
        <1506643305-4581-1-git-send-email-cw00.choi@samsung.com>
        <TY1PR06MB0992097F0FBBE04CD282EEE7D87E0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 2017년 09월 29일 11:03, Yoshihiro Shimoda wrote:
> Hi,
> 
>> From: Chanwoo Choi
>> Sent: Friday, September 29, 2017 9:02 AM
>>
> < snip >
>>  drivers/phy/renesas/phy-rcar-gen3-usb2.c      |   2 +-
> < snip >
>>  drivers/usb/gadget/udc/renesas_usb3.c         |   2 +-
> 
> These two drivers need the modification.
> But...
> 
> < snip >
>> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
>> index 8c5fc12ad778..a78764bc23eb 100644
>> --- a/drivers/usb/renesas_usbhs/common.h
>> +++ b/drivers/usb/renesas_usbhs/common.h
>> @@ -17,7 +17,7 @@
>>  #ifndef RENESAS_USB_DRIVER_H
>>  #define RENESAS_USB_DRIVER_H
>>
>> -#include <linux/extcon.h>
>> +#include <linux/extcon-provider.h>
> 
> Since this driver doesn't use any extcon-provider APIs for now,
> we doesn't need the modification, IIUC.

I don't modify 'drivers/usb/renesas_usbhs/common.h'
on v2 patch. Thanks for your comment.

> 
> Best regards,
> Yoshihiro Shimoda
> 
> 
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
