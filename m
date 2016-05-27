Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:36245 "EHLO
	mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932194AbcE0Dki (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 23:40:38 -0400
Received: by mail-vk0-f65.google.com with SMTP id c189so5406961vkb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 May 2016 20:40:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1464166708-18320-5-git-send-email-dirk.behme@de.bosch.com>
References: <1464166708-18320-1-git-send-email-dirk.behme@de.bosch.com>
	<1464166708-18320-5-git-send-email-dirk.behme@de.bosch.com>
Date: Fri, 27 May 2016 12:40:37 +0900
Message-ID: <CANqRtoSAFMnKvjqaH2fB=W260LJqG7v5babhanCJw0Zx_+Okjw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: Use product register framework
From: Magnus Damm <magnus.damm@gmail.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, May 25, 2016 at 5:58 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> Instead of hard coding the product register in the rcar-du, use
> the framework for it to get the SoC version and the revision needed
> for the enabling the workaround.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index e10943b..ee639a6 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -13,6 +13,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/mutex.h>
> +#include <linux/soc/renesas/rcar3-prr.h>
>
>  #include <drm/drmP.h>
>  #include <drm/drm_atomic.h>
> @@ -30,12 +31,6 @@
>  #include "rcar_du_regs.h"
>  #include "rcar_du_vsp.h"
>
> -#define PRODUCT_REG    0xfff00044
> -#define PRODUCT_H3_BIT (0x4f << 8)
> -#define PRODUCT_MASK   (0x7f << 8)
> -#define CUT_ES1                (0x00)
> -#define CUT_ES1_MASK   (0x000000ff)
> -
>  static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
>  {
>         struct rcar_du_device *rcdu = rcrtc->group->dev;
> @@ -167,7 +162,6 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>         u32 div;
>         u32 dpll_reg = 0;
>         struct dpll_info *dpll;
> -       void __iomem *product_reg;
>         bool h3_es1_workaround = false;
>
>         dpll = kzalloc(sizeof(*dpll), GFP_KERNEL);
> @@ -175,11 +169,8 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>                 return;
>
>         /* DU2 DPLL Clock Select bit workaround in R-Car H3(ES1.0) */
> -       product_reg = ioremap(PRODUCT_REG, 0x04);
> -       if (((readl(product_reg) & PRODUCT_MASK) == PRODUCT_H3_BIT)
> -               && ((readl(product_reg) & CUT_ES1_MASK) == CUT_ES1))
> +       if (cpu_is_rcar3_h3() && revision_is_rcar3_es1())
>                 h3_es1_workaround = true;
> -       iounmap(product_reg);

Thanks for your efforts!

I agree that doing ioremap() with a hard coded address and reading out
an unrelated register looks like a short term workaround. Replacing
that with something cleaner makes sense. The question in my mind is
how to make it cleaner.

I can see that in this series you have introduced some specialized
functions to be able to check ES version. This may be slightly
cleaner, but the design comes with some drawbacks. One major drawback
is that specialized functions makes it difficult to move the code
between several architectures. So if we should clean up the code then
we should go all the way and do it in a reusable way.

Over the years many drivers have been initially written on the SH
arch, then moved to 32-bit ARM and recently also be used for ARM v8.
Not sure about the DU driver, it may only be shared between 32-bit ARM
and 64-bit ARM instead of all 3 architectures. I think the SCIF driver
has been used on even more architectures like H8. One major reason why
we have been able to reuse code over several architectures is that
we've focus on using standard functions and stayed away from
architecture-specific extensions. In case a short term workaround is
needed then it should not break the code on other architectures. The
initial short term code above would work on any of the supported SoCs
and it would also compile on a whole bunch of other architectures for
compile testing purpose.

Anyway, please use something standard that can be used on several
architectures without causing breakage. You should also discuss this
with the initial author of the DU driver. He may have a different
opinion than me, but I'm sure he agrees on that the driver should keep
on working on several architectures.

Thanks,

/ magnus
