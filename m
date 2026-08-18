Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668F45198A;
	Tue, 18 Aug 2026 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049604; cv=none; b=qAnoqMGRElzEUtzb2D+hF/I49D5GefwpOD2Tpjt0o6hS5ARqa7biwgjE7QKW9A6B0medFlndZgZgNyzXz40jZFMXpB4wmlzCeO9vRTEUL9Tt3PMq+NMaCxSb5n/vFm5jm9bWVwT13isvPkcVcdnQtxOiyQ/2LOvE1iF5gU4bpNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049604; c=relaxed/simple;
	bh=D7glJbft5EktSdr/VXjaEB+FLfQwGGEmw1MWtG6Okj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcqBznWsuMLCGy/RmDMA1z3glCwfpC5xLM1ahnK7FM2o3aT5/om3Iuce4hW0wN72OCr+P2niSu6myOte0wcHvXMX1ukI/J3UXY1LExizZAb1IypPQNTdFka9gyrvQkWpEViqGLeZk+CqJk4vT0wHSx65cku+vVsQX6+yj8pbjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIWyA6Gk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIWyA6Gk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787049601; x=1818585601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D7glJbft5EktSdr/VXjaEB+FLfQwGGEmw1MWtG6Okj4=;
  b=EIWyA6GkjjrKMRAjM3YDWhJ8c6JTLvo/sWWYV/K3vDoWZFmaYJeI4EDL
   FlL31RxuWwcW+yadJD+voZOcv2GcVPHBAWgS5R/aqPpjXgJutQlXGlO3w
   0tfXavJwcv69G1YrOAg9FyDGFkpbgdKBFP4rlqCFAXHmvo6zoqZpwteHH
   EaT11qcU1qna2zaIUsgQ+E+L51LmL83kybrL5z8m/LBQiHgzFEBPVc14y
   SibHIPJnEZqsIjV58irVy2UmhW5wOmGzYReJ9bFfBQ/fJ28/zfbsquMoQ
   LxOVJBjRTeMtvDVS84xMT1JkLVG4rv7LMK1aKTeF46S+TLAaZ8gVXMUKJ
   A==;
X-CSE-ConnectionGUID: SjuEUv41TkaEEqy3iPaloQ==
X-CSE-MsgGUID: T3WkQZM4RiGTDdJ0LRJRhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98691708"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98691708"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:40:01 -0700
X-CSE-ConnectionGUID: Lg7gs6hVTf6uWDwzRPDEjA==
X-CSE-MsgGUID: S1x9jCIgS8e4y89TbJ/SFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="268698572"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2026 03:39:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwHEZ-00000000eH0-2cK4;
	Tue, 18 Aug 2026 10:39:55 +0000
Date: Tue, 18 Aug 2026 18:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v11] media: vsp1: Add VSPX support
Message-ID: <202608181800.RLg4n4YD-lkp@intel.com>
References: <20250616-b4-vspx-v11-1-69af6398c185@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-b4-vspx-v11-1-69af6398c185@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4d2c3d70799f5eb210003613766bbd113bbebc1a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-vsp1-Add-VSPX-support/20260814-195508
base:   4d2c3d70799f5eb210003613766bbd113bbebc1a
patch link:    https://lore.kernel.org/r/20250616-b4-vspx-v11-1-69af6398c185%40ideasonboard.com
patch subject: [PATCH v11] media: vsp1: Add VSPX support
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260818/202608181800.RLg4n4YD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181800.RLg4n4YD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181800.RLg4n4YD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/dvb-frontends/stb6100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0288.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0297.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0299.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0367.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0900_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv090x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0910.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6110.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6110x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6111.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10021.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10023.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10048.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda1004x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10086.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda18271c2dd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda665x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda8083.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda8261.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda826x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ts2020.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tua6100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ves1820.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ves1x93.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zd1301_demod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10036.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10039.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10353.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/aptina-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/ccs-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/max9271.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-dev-allocator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-entity.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-request.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/b2c2/flexcop-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bt878.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bttv-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bttv-if.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/dst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/dst_ca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-fileops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-streams.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx23885/altera-ci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx25821/cx25821-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx25821/cx25821-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-mpeg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-tvaudio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-video.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-vp3054-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ddbridge/ddbridge-dummy-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-buttress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-cpd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-fw-com.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-fileops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-streams.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_ca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_dvb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_ioc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_uart.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-ts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-tvaudio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-video.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ttpci/budget-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/chips-media/coda/imx-vdoa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/marvell/mcam-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/mdp/mtk_mdp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vpu/mtk_vpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-scaler.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/hfi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/renesas/rcar-fcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/renesas/vsp1/vsp1_drm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/media/platform/renesas/vsp1/vsp1_vspx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/samsung/exynos4-is/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/davinci/vpif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/omap/omap_voutlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/csc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/sc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/vpdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/xilinx/xilinx-vtc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/radio-isa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/radio-tea5777.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/si470x/radio-si470x-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/tea575x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/rc/lirc_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/rc/rc-main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0011.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0012.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0013.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/max2165.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mc44s803.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2060.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2063.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt20xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2131.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2266.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mxl5005s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mxl5007t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/qt1010.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/r820t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda18218.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda18271-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda827x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda8290.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda9887.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5761.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5767.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tuner-simple.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tuner-types.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc2028.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc4000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc5000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-avcore.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-vbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/dvb_usb_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/mxl111sf-demod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/af9005-remote.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dibusb-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dibusb-mc-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-remote.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-urb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-camera.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/go7007/go7007-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/go7007/snd-go7007.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/gspca/autogain_functions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/gspca/gspca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/ttusb-dec/ttusbdecfe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-async.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-cci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-compat-ioctl32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-dv-timings.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-flash-led-class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-fwnode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-h264.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-jpeg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-mc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-mem2mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-vp9.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/fsl_ifc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/jz4780-nemc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/omap-gpmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/renesas-rpc-if.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/ti-aemif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/ti-emif-pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memstick/core/memstick.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/message/fusion/mptbase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/message/fusion/mptscsih.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm80x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm860x-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm860x-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/adp5520.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/altera-sysmgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/arizona-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/arizona-irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/atc260x-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/atmel-smc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/axp20x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cgbc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
