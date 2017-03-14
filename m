Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38858 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbdCNIE3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 04:04:29 -0400
Subject: Re: [RESEND PATCH v3 2/2] phy: Group vendor specific phy drivers
To: Vivek Gautam <vivek.gautam@codeaurora.org>, kishon@ti.com
Cc: "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-id: <8f1ec0f2-e824-12a3-f7e3-ec02eb3b307f@samsung.com>
Date: Tue, 14 Mar 2017 17:04:25 +0900
MIME-version: 1.0
In-reply-to: <1489472570-26434-1-git-send-email-vivek.gautam@codeaurora.org>
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7bit
References: <1489472080-23711-2-git-send-email-vivek.gautam@codeaurora.org>
 <CGME20170314062341epcas1p4ac40ea145b811f29e42df57bed5121a0@epcas1p4.samsung.com>
 <1489472570-26434-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/14/2017 03:22 PM, Vivek Gautam wrote:
> Adding vendor specific directories in phy to group
> phy drivers under their respective vendor umbrella.
> 
> Also updated the MAINTAINERS file to reflect the correct
> directory structure for phy drivers.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

[..snip..]

> ---
