Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32865 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750917AbdLaNkL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 08:40:11 -0500
Received: by mail-wm0-f65.google.com with SMTP id g130so10859949wme.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Dec 2017 05:40:11 -0800 (PST)
Subject: Re: [PATCH 01/33] clk_ops: change round_rate() to return unsigned
 long
To: Mikko Perttunen <cyndis@kapsi.fi>, mturquette@baylibre.com,
        sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@linux-mips.org, linux-rpi-kernel@lists.infradead.org,
        patches@opensource.cirrus.com,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
 <1514596392-22270-2-git-send-email-pure.logic@nexus-software.ie>
 <9f4bef5a-8a71-6f30-5cfb-5e8fe133e3d3@kapsi.fi>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <6d83a5c3-6589-24bc-4ca5-4d1bbca47432@nexus-software.ie>
Date: Sun, 31 Dec 2017 13:40:07 +0000
MIME-Version: 1.0
In-Reply-To: <9f4bef5a-8a71-6f30-5cfb-5e8fe133e3d3@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30/12/17 16:36, Mikko Perttunen wrote:
> FWIW, we had this problem some years ago with the Tegra CPU clock - then 
> it was determined that a simpler solution was to have the determine_rate 
> callback support unsigned long rates - so clock drivers that need to 
> return rates higher than 2^31 can instead implement the determine_rate 
> callback. That is what's currently implemented.
> 
> Mikko

Granted we could work around it but, having both zero and less than zero 
indicate error means you can't support larger than LONG_MAX which is I 
think worth fixing.

---
bod
