Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCE3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 11:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF3A12070D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 11:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="oAnEhaCF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbfC0LuX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 07:50:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55970 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbfC0LuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 07:50:23 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7A4D825B78D;
        Wed, 27 Mar 2019 22:50:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553687417; bh=uezjKn89qb/Mt2xJCEyB3Ov1twPQW/Xm23Nd/s0Sz4o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oAnEhaCFUIvRHquceCp2CAR/9k4BPL9HU279LChS8uxVWUKvVRTb1V5fy01FfcGBb
         wS//31kwmaI1BfgjXty6Wb/aoHA4IXgoiBRyLegz//GliYU/+alsMUNewdS2BJ7t43
         q67+QEvc515fZ3Qgivn1+FN+XylJY6OkyY5Bko9w=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C11B8940376; Wed, 27 Mar 2019 12:50:15 +0100 (CET)
Date:   Wed, 27 Mar 2019 12:50:15 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH v3 05/10] pinctrl: sh-pfc: Allow compile-testing of all
 drivers
Message-ID: <20190327115015.p4acwec5mjfjvtzh@verge.net.au>
References: <20190320102141.19316-1-geert+renesas@glider.be>
 <20190320102141.19316-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320102141.19316-6-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 20, 2019 at 11:21:36AM +0100, Geert Uytterhoeven wrote:
> Enable compile-testing of all Renesas SuperH and ARM pin control
> drivers, in a similar way as was done before for clock and SoC drivers
> in commits 371dd373c6edd557 ("clk: renesas: Allow compile-testing of all
> (sub)drivers") and 8be381a131c29c47 ("soc: renesas: Rework Kconfig and
> Makefile logic").
> 
> The SuperH pin control drivers need specific include files, hence make
> sure they are always found when compile-testing.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v3:
>   - No changes,
> 
> v2:
>   - Add proper COMPILE_TEST support, instead of just enabling all
>     drivers unconditionally,
>   - Drop RFC state.
> ---
>  drivers/pinctrl/sh-pfc/Kconfig  | 174 ++++++++++++++------------------
>  drivers/pinctrl/sh-pfc/Makefile |  15 +++
>  2 files changed, 90 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
> index 6a9e4334dbfa7ec0..2dd716b016a3f39b 100644
> --- a/drivers/pinctrl/sh-pfc/Kconfig
> +++ b/drivers/pinctrl/sh-pfc/Kconfig
> @@ -3,19 +3,53 @@
>  # Renesas SH and SH Mobile PINCTRL drivers
>  #
>  
> -if ARCH_RENESAS || SUPERH
> -
>  config PINCTRL_SH_PFC
> +	bool "Renesas SoC pin control support" if COMPILE_TEST && !(ARCH_RENESAS || SUPERH)
> +	default y if ARCH_RENESAS || SUPERH
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> -	def_bool y
> +	select PINCTRL_PFC_EMEV2 if ARCH_EMEV2
> +	select PINCTRL_PFC_R8A73A4 if ARCH_R8A73A4
> +	select PINCTRL_PFC_R8A7740 if ARCH_R8A7740
> +	select PINCTRL_PFC_R8A7743 if ARCH_R8A7743
> +	select PINCTRL_PFC_R8A7744 if ARCH_R8A7744
> +	select PINCTRL_PFC_R8A7745 if ARCH_R8A7745
> +	select PINCTRL_PFC_R8A77470 if ARCH_R8A77470
> +	select PINCTRL_PFC_R8A774A1 if ARCH_R8A774A1
> +	select PINCTRL_PFC_R8A774C0 if ARCH_R8A774C0
> +	select PINCTRL_PFC_R8A7778 if ARCH_R8A7778
> +	select PINCTRL_PFC_R8A7779 if ARCH_R8A7779
> +	select PINCTRL_PFC_R8A7790 if ARCH_R8A7790
> +	select PINCTRL_PFC_R8A7791 if ARCH_R8A7791
> +	select PINCTRL_PFC_R8A7792 if ARCH_R8A7792
> +	select PINCTRL_PFC_R8A7793 if ARCH_R8A7793
> +	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
> +	select PINCTRL_PFC_R8A7795 if ARCH_R8A7795
> +	select PINCTRL_PFC_R8A7796 if ARCH_R8A7796
> +	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
> +	select PINCTRL_PFC_R8A77970 if ARCH_R8A77970
> +	select PINCTRL_PFC_R8A77980 if ARCH_R8A77980
> +	select PINCTRL_PFC_R8A77990 if ARCH_R8A77990
> +	select PINCTRL_PFC_R8A77995 if ARCH_R8A77995
> +	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
> +	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
> +	select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
> +	select PINCTRL_PFC_SH73A0 if ARCH_SH73A0
> +	select PINCTRL_PFC_SH7720 if CPU_SUBTYPE_SH7720
> +	select PINCTRL_PFC_SH7722 if CPU_SUBTYPE_SH7722
> +	select PINCTRL_PFC_SH7723 if CPU_SUBTYPE_SH7723
> +	select PINCTRL_PFC_SH7724 if CPU_SUBTYPE_SH7724
> +	select PINCTRL_PFC_SH7734 if CPU_SUBTYPE_SH7734
> +	select PINCTRL_PFC_SH7757 if CPU_SUBTYPE_SH7757
> +	select PINCTRL_PFC_SH7785 if CPU_SUBTYPE_SH7785
> +	select PINCTRL_PFC_SH7786 if CPU_SUBTYPE_SH7786
> +	select PINCTRL_PFC_SHX3 if CPU_SUBTYPE_SHX3
>  	help
> -	  This enables pin control drivers for SH and SH Mobile platforms
> +	  This enables pin control drivers for Renesas SuperH and ARM platforms
>  
>  config PINCTRL_SH_PFC_GPIO
>  	select GPIOLIB
> -	select PINCTRL_SH_PFC
>  	bool
>  	help
>  	  This enables pin control and GPIO drivers for SH/SH Mobile platforms
> @@ -27,183 +61,125 @@ config PINCTRL_SH_FUNC_GPIO
>  	  This enables legacy function GPIOs for SH platforms
>  
>  config PINCTRL_PFC_EMEV2
> -	def_bool y
> -	depends on ARCH_EMEV2
> -	select PINCTRL_SH_PFC
> +	bool "Emma Mobile AV2 pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A73A4
> -	def_bool y
> -	depends on ARCH_R8A73A4
> +	bool "R-Mobile APE6 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_PFC_GPIO
>  
>  config PINCTRL_PFC_R8A7740
> -	def_bool y
> -	depends on ARCH_R8A7740
> +	bool "R-Mobile A1 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_PFC_GPIO
>  
>  config PINCTRL_PFC_R8A7743
> -	def_bool y
> -	depends on ARCH_R8A7743
> -	select PINCTRL_SH_PFC
> +	bool "RZ/G1M pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7744
> -	def_bool y
> -	depends on ARCH_R8A7744
> -	select PINCTRL_SH_PFC
> +	bool "RZ/G1N pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7745
> -        def_bool y
> -        depends on ARCH_R8A7745
> -        select PINCTRL_SH_PFC
> +	bool "RZ/G1E pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A77470
> -        def_bool y
> -        depends on ARCH_R8A77470
> -        select PINCTRL_SH_PFC
> +	bool "RZ/G1C pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A774A1
> -        def_bool y
> -        depends on ARCH_R8A774A1
> -        select PINCTRL_SH_PFC
> +	bool "RZ/G2M pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A774C0
> -        def_bool y
> -        depends on ARCH_R8A774C0
> -        select PINCTRL_SH_PFC
> +	bool "RZ/G2E pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7778
> -	def_bool y
> -	depends on ARCH_R8A7778
> -	select PINCTRL_SH_PFC
> +	bool "R-Car M1A pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7779
> -	def_bool y
> -	depends on ARCH_R8A7779
> -	select PINCTRL_SH_PFC
> +	bool "R-Car H1 pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7790
> -	def_bool y
> -	depends on ARCH_R8A7790
> -	select PINCTRL_SH_PFC
> +	bool "R-Car H2 pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7791
> -	def_bool y
> -	depends on ARCH_R8A7791
> -	select PINCTRL_SH_PFC
> +	bool "R-Car M2-W pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7792
> -	def_bool y
> -	depends on ARCH_R8A7792
> -	select PINCTRL_SH_PFC
> +	bool "R-Car V2H pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7793
> -	def_bool y
> -	depends on ARCH_R8A7793
> -	select PINCTRL_SH_PFC
> +	bool "R-Car M2-N pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7794
> -	def_bool y
> -	depends on ARCH_R8A7794
> -	select PINCTRL_SH_PFC
> +	bool "R-Car E2 pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7795
> -	def_bool y
> -	depends on ARCH_R8A7795
> -	select PINCTRL_SH_PFC
> +	bool "R-Car H3 pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A7796
> -        def_bool y
> -        depends on ARCH_R8A7796
> -        select PINCTRL_SH_PFC
> +	bool "R-Car M3-W pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A77965
> -        def_bool y
> -        depends on ARCH_R8A77965
> -        select PINCTRL_SH_PFC
> +	bool "R-Car M3-N pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A77970
> -	def_bool y
> -	depends on ARCH_R8A77970
> -	select PINCTRL_SH_PFC
> +	bool "R-Car V3M pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A77980
> -	def_bool y
> -	depends on ARCH_R8A77980
> -	select PINCTRL_SH_PFC
> +	bool "R-Car V3H pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A77990
> -        def_bool y
> -        depends on ARCH_R8A77990
> -        select PINCTRL_SH_PFC
> +	bool "R-Car E3 pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A77995
> -        def_bool y
> -        depends on ARCH_R8A77995
> -        select PINCTRL_SH_PFC
> +	bool "R-Car D3 pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_SH7203
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7203
> +	bool "SH7203 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7264
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7264
> +	bool "SH7264 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7269
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7269
> +	bool "SH7269 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH73A0
> -	def_bool y
> -	depends on ARCH_SH73A0
> +	bool "SH-Mobile AG5 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_PFC_GPIO
>  	select REGULATOR
>  
>  config PINCTRL_PFC_SH7720
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7720
> +	bool "SH7720 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7722
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7722
> +	bool "SH7722 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7723
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7723
> +	bool "SH-Mobile R2 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7724
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7724
> +	bool "SH-Mobile R2R pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7734
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7734
> +	bool "SH7734 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7757
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7757
> +	bool "SH7757 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7785
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7785
> +	bool "SH7785 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SH7786
> -	def_bool y
> -	depends on CPU_SUBTYPE_SH7786
> +	bool "SH7786 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
>  
>  config PINCTRL_PFC_SHX3
> -	def_bool y
> -	depends on CPU_SUBTYPE_SHX3
> +	bool "SH-X3 pin control support" if COMPILE_TEST
>  	select PINCTRL_SH_FUNC_GPIO
> -endif
> diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
> index 82ebb2a91ee0f998..8c95abcfcc006371 100644
> --- a/drivers/pinctrl/sh-pfc/Makefile
> +++ b/drivers/pinctrl/sh-pfc/Makefile
> @@ -38,3 +38,18 @@ obj-$(CONFIG_PINCTRL_PFC_SH7757)	+= pfc-sh7757.o
>  obj-$(CONFIG_PINCTRL_PFC_SH7785)	+= pfc-sh7785.o
>  obj-$(CONFIG_PINCTRL_PFC_SH7786)	+= pfc-sh7786.o
>  obj-$(CONFIG_PINCTRL_PFC_SHX3)		+= pfc-shx3.o
> +
> +ifeq ($(CONFIG_COMPILE_TEST),y)
> +CFLAGS_pfc-sh7203.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
> +CFLAGS_pfc-sh7264.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
> +CFLAGS_pfc-sh7269.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
> +CFLAGS_pfc-sh7720.o	+= -I$(srctree)/arch/sh/include/cpu-sh3
> +CFLAGS_pfc-sh7722.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +CFLAGS_pfc-sh7723.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +CFLAGS_pfc-sh7724.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +CFLAGS_pfc-sh7734.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +CFLAGS_pfc-sh7757.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +CFLAGS_pfc-sh7785.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +CFLAGS_pfc-sh7786.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +CFLAGS_pfc-shx3.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
> +endif
> -- 
> 2.17.1
> 
