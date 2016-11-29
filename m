Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 29 Nov 2016 10:10:58 +0000
From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
CC: <linux-kernel@vger.kernel.org>, <chanwoo@kernel.org>,
        <myungjoo.ham@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Roger Quadros <rogerq@ti.com>,
        <patches@opensource.wolfsonmicro.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] extcon: Split out the extcon APIs for extcon provider
 driver
Message-ID: <20161129101058.GG1867@localhost.localdomain>
References: <1480413743-13037-1-git-send-email-cw00.choi@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1480413743-13037-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 07:02:23PM +0900, Chanwoo Choi wrote:
> This patchs split out the extcon APIs of extcon provider driver in order to
> prevent the direct access of struct extcon_dev by extcon consumer driver.
> The extcon consumer driver don't need to handle the extcon provider APIs.
> 
> The extcon subsystem has two type of extcon drivers as following:
> - extcon provider driver
> : Detect the external connector and identify the state/property of
>   each external connector. And it send the notification to synchronize
>   the information between provider and consumer driver.
> - extcon consumer driver
> : Receive the notifcation from extcon provider driver. When receving the noti,
>   it can get the both state and property of specific external connector.
> 
> Cc: Myungjoo Ham <myungjoo.ham@samsung.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Chris Zhong <zyw@rock-chips.com>
> Cc: Roger Quadros <rogerq@ti.com>
> Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Cc: patches@opensource.wolfsonmicro.com
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/extcon/devres.c                |   2 +-
>  drivers/extcon/extcon-adc-jack.c       |   2 +-
>  drivers/extcon/extcon-arizona.c        |   2 +-

For the Arizona bit:

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
