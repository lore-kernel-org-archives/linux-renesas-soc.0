Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:35638 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbeHPUPP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Aug 2018 16:15:15 -0400
Date: Thu, 16 Aug 2018 19:15:25 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-ID: <2001258321.262999.1534439725743@webmail.strato.com>
In-Reply-To: <20180808075928.31107-2-wsa+renesas@sang-engineering.com>
References: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
 <20180808075928.31107-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/2] i2c: rcar: refactor private flags
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On August 8, 2018 at 9:59 AM Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> 
> 
> Use BIT macro to avoid shift-31-problem, indent a little more and use
> GENMASK to make it easier to add new flags.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 791a4aa34fdd..a9f1880e2eae 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -19,6 +19,7 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
>   */
> +#include <linux/bitops.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dmaengine.h>
> @@ -112,9 +113,9 @@
>  #define ID_ARBLOST	(1 << 3)
>  #define ID_NACK		(1 << 4)
>  /* persistent flags */
> -#define ID_P_NO_RXDMA	(1 << 30) /* HW forbids RXDMA sometimes */
> -#define ID_P_PM_BLOCKED	(1 << 31)
> -#define ID_P_MASK	(ID_P_PM_BLOCKED | ID_P_NO_RXDMA)
> +#define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
> +#define ID_P_PM_BLOCKED		BIT(31)
> +#define ID_P_MASK		GENMASK(31, 30)
>  
>  enum rcar_i2c_type {
>  	I2C_RCAR_GEN1,
> -- 
> 2.11.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
