Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:29250 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751398AbdJJK1C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 06:27:02 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, kishon@ti.com,
        gregkh@linuxfoundation.org
Cc: sre@kernel.org, lee.jones@linaro.org, heiko@sntech.de,
        yoshihiro.shimoda.uh@renesas.com, krzk@kernel.org,
        b.zolnierkie@samsung.com, maxime.ripard@free-electrons.com,
        wens@csie.org, cw00.choi@samsung.com, chanwoo@kernel.org,
        myungjoo.ham@samsung.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] extcon: Split out extcon header file for consumer and provider device
In-Reply-To: <1507630671-23536-1-git-send-email-cw00.choi@samsung.com>
References: <CGME20171010101758epcas2p3b3f379076f5be5e81edee2bd00354c28@epcas2p3.samsung.com> <1507630671-23536-1-git-send-email-cw00.choi@samsung.com>
Date: Tue, 10 Oct 2017 13:26:44 +0300
Message-ID: <87efqbmh7f.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi,

Chanwoo Choi <cw00.choi@samsung.com> writes:
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

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
balbi
