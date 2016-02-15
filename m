Return-Path: <SRS0+w85p=OO=the-dreams.de=wsa@vergenet.net>
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/2] ARM: shmobile: use Lager as reference for I2C slave and core switch
Date: Mon, 15 Feb 2016 13:57:47 +0100
Message-Id: <1455541069-9439-1-git-send-email-wsa@the-dreams.de>
List-ID: <linux-renesas-soc.vger.kernel.org>

This series provides the necessary preparation to use Lager for testing the
above mentioned features. After this, the rest is done at runtime as described
in the upstream documentation.

This series depends on the i2c-demux-pinctrl driver which is in linux-next
already. Because IIC0/I2C0 is unpopulated and even so, IIC0 is used as default
like before, chances of a regression are extremly unlikely. The only regression
I can think of is someone using:
	a) IIC0 with an external board
	b) the Lager DTS from upstream unmodified
	c) a private .config and forgot to activate the i2c-demux-pinctrl driver

We could point this person to the working shmobile_defconfig, though. However,
I'd think that someone using IIC0 externally will also have a private Lager DTS
and in that case will be made aware by the merge conflict.

Another minor question for me is: Do we need to update multiv7_defconfig, too.
My feeling is no, so I left it out, but may be convinced otherwise.

Magnus: I hope this is what you had in mind for the reference platform idea.

Kind regards,

   Wolfram

Wolfram Sang (2):
  ARM: shmobile: defconfig: enable I2C demultiplexer and slave eeprom
  ARM: shmobile: r8a7790: lager: use demuxer for IIC0/I2C0

 arch/arm/boot/dts/r8a7790-lager.dts | 32 ++++++++++++++++++++++++++++++--
 arch/arm/configs/shmobile_defconfig |  3 +++
 2 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.1.4
