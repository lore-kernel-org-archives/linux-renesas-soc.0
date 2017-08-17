Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:52546 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdHQIVZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 04:21:25 -0400
Subject: Re: Status of r8a7795 SDHI support?
To: Wolfram Sang <wsa@the-dreams.de>
CC: <linux-renesas-soc@vger.kernel.org>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
Date: Thu, 17 Aug 2017 10:21:23 +0200
MIME-Version: 1.0
In-Reply-To: <20170817072921.GB1423@katana>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 17.08.2017 09:29, Wolfram Sang wrote:
> 
>> What's the status of SDHI support in mainline and/or renesas-drivers
>> (renesas-drivers-2017-08-16-v4.13-rc5)?
> 
> I use it daily here, even with SDR104 enabled.


On ES2.0? I wonder how if not even the pinmux is there ;)


>> sdhci-pltfm: SDHCI platform and OF driver helper
> 
> Wrong driver? We have SDHI not SDHCI.


Changing the config a little I have

--cut --
CONFIG_MMC=y
# CONFIG_MMC_DEBUG is not set
# CONFIG_PWRSEQ_EMMC is not set
# CONFIG_PWRSEQ_SIMPLE is not set
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_SDIO_UART is not set
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_ARMMMCI is not set
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_SDHI=y
CONFIG_MMC_SDHI_SYS_DMAC=y
CONFIG_MMC_SDHI_INTERNAL_DMAC=y
-- cut --

now.

As SDHCI is disabled, now, I don't get anything SD/MMC related in the 
boot log any more. Not even an error message. Hmm ...

The device tree has [1].

Best regards

Dirk

[1]

&sdhi0 {
	pinctrl-0 = <&sdhi0_pins>;
	pinctrl-1 = <&sdhi0_pins_uhs>;
	pinctrl-names = "default";

	vmmc-supply = <&reg_3p3v>;
	non-removable; /* Workaround due to CD on CPLD */
	bus-width = <4>;
	no-1-8-v;
	status = "okay";
};

&sdhi3 {
	/* used for on-board 8bit eMMC */
	pinctrl-0 = <&sdhi3_pins>;
	pinctrl-1 = <&sdhi3_pins_uhs>;
	pinctrl-names = "default", "state_uhs";

	vmmc-supply = <&reg_3p3v>;
	vqmmc-supply = <&reg_1p8v>;
	mmc-hs400-1_8v;
	bus-width = <8>;
	non-removable;
	status = "okay";
};
