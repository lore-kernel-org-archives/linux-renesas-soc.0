Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53449 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbeKMR5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 12:57:48 -0500
Received: by mail-wm1-f68.google.com with SMTP id f10-v6so10846563wme.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Nov 2018 00:00:52 -0800 (PST)
Date: Tue, 13 Nov 2018 08:00:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Dien Pham <dien.pham.ry@renesas.com>
Subject: Re: [PATCH] mfd: bd9571mwv: add volatile register to make DVFS work
Message-ID: <20181113080048.GG29388@dell>
References: <20181003135841.4984-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181003135841.4984-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, 03 Oct 2018, Wolfram Sang wrote:

> From: Dien Pham <dien.pham.ry@renesas.com>
> 
> Because BD9571MWV_DVFS_MONIVDAC is not defined in the volatile table,
> the physical register value is not updated by regmap and DVFS doesn't
> work as expected. Fix it!
> 
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> [wsa: rebase, add 'Fixes', reword commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Fixes: d3ea21272094 ("mfd: Add ROHM BD9571MWV-M MFD PMIC driver")
> ---
> 
> Grabbed from the BSP and confirmed by the datasheet. The register is RO
> and reflecting states depending on other registers.
> 
>  drivers/mfd/bd9571mwv.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
