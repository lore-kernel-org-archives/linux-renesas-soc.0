Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35330 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdHOOid (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 10:38:33 -0400
Received: by mail-wm0-f46.google.com with SMTP id m85so10251503wma.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2017 07:38:32 -0700 (PDT)
Date: Tue, 15 Aug 2017 15:38:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V3 1/2] mfd: Add ROHM BD9571MWV-M PMIC DT bindings
Message-ID: <20170815143819.ocdw5ywwa6y6go2g@dell>
References: <20170502121816.10572-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170502121816.10572-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 02 May 2017, Marek Vasut wrote:

> Add DT bindings for the ROHM BD9571MWV-M PMIC. This PMIC has
> the following features:
> - multiple voltage monitors for 1V8, 2V5, 3V3 voltage rail
> - one voltage regulator for DVFS
> - two GPIOs
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-renesas-soc@vger.kernel.org
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> V2: - Drop the compatible = "regulator-fixed" from the binding example,
>       it should not be there.
>     - List the VD09 regulator
> V3: Replace bd9571@30 with pmic@30
> ---
>  .../devicetree/bindings/mfd/bd9571mwv.txt          | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
