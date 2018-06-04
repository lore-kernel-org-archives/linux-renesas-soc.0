Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:45544 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751727AbeFDFrD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 01:47:03 -0400
Received: by mail-wr0-f195.google.com with SMTP id o12-v6so10729044wrm.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jun 2018 22:47:03 -0700 (PDT)
Date: Mon, 4 Jun 2018 06:47:00 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V2] mfd: dt: Add bindings for DA9063L
Message-ID: <20180604054700.GE17993@dell>
References: <20180523122140.6275-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180523122140.6275-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 23 May 2018, Marek Vasut wrote:

> Add device tree bindings for the Dialog DA9063L. This is a
> variant of the DA9063 chip with smaller package, with less
> LDO regulators and without RTC block. The other properties
> of the chip are the same, including the content of the chip
> ID register.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Steve Twiss <stwiss.opensource@diasemi.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Merge the DA9063/DA9063L regulator lists and mark DA9063-only
>     regulators in that single list
> ---
>  Documentation/devicetree/bindings/mfd/da9063.txt | 32 +++++++++++++-----------
>  1 file changed, 17 insertions(+), 15 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
