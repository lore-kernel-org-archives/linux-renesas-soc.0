Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 18 Jul 2017 10:23:57 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH V4 2/2] mfd: Add ROHM BD9571MWV-M MFD PMIC driver
Message-ID: <20170718092357.6w6yjjwny54llgqd@dell>
References: <20170717204512.7075-1-marek.vasut+renesas@gmail.com>
 <20170717204512.7075-2-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170717204512.7075-2-marek.vasut+renesas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 17 Jul 2017, Marek Vasut wrote:

> Add the MFD part of the ROHM BD9571MWV-M PMIC driver and MAINTAINERS
> entry. The MFD part only specifies the regmap bits for the PMIC and
> binds the subdevs together.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
> V2: - Change BD9571MWV_AVS_VD09_VID0,1,2,3 to BD9571MWV_AVS_VD09_VID(n)
>     - Change BD9571MWV_AVS_DVFS_VID0,1,2,3 to BD9571MWV_AVS_DVFS_VID(n)
>     - Make the AVS_VD09 range RW, so it can be used by the regulator
>       driver for the VD09 regulator
>     - Report the regmap read return values when attempting to read ID
>       registers fails
> V3: No change
> V4: select REGMAP_IRQ
> ---
>  MAINTAINERS                   |  11 ++
>  drivers/mfd/Kconfig           |  14 +++
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/bd9571mwv.c       | 230 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/bd9571mwv.h | 115 +++++++++++++++++++++
>  5 files changed, 371 insertions(+)
>  create mode 100644 drivers/mfd/bd9571mwv.c
>  create mode 100644 include/linux/mfd/bd9571mwv.h

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
