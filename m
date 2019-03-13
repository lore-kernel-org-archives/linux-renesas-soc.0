Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D76C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DB7A20449
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="oqplqbX+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfCMK6h (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 06:58:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34896 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbfCMK6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 06:58:37 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8D77B25BEEE;
        Wed, 13 Mar 2019 21:58:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552474714; bh=8oUgxfLDMHj3Yigc6InXn3aXIWUkkacwRWx55/x5kKQ=;
        h=From:To:Cc:Subject:Date:From;
        b=oqplqbX+9Shi+smoJZ1mc291QSPm1VAg8iAM4lZOqNO+6h1eMCuBG4m1JKBg6gB8i
         FGENKDzXQ2R/sbguva05MgQrCDA3hlRZKjYgLRqSOEFk7ZIZwdT0gOOzZfmb/vIxWJ
         avJVnI4NhZXuiq9ZRllId+jTRi7pK7kxA/KC7vzk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CE9A7940C8F; Wed, 13 Mar 2019 11:58:32 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: renesas: ebisu: support S2RAM
Date:   Wed, 13 Mar 2019 11:58:14 +0100
Message-Id: <20190313105816.8592-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

this short series supports S2RAM on R-Car E3 (r8a77990) / Ebisu by:

* Upporting description of  BD9571 PMIC in DT from BSP v3.9.2
* Adding DDR0 backpo power configuration to that description

Simon Horman (1):
  arm64: dts: renesas: ebisu: Add PMIC DDR0 Backup Power config

Takeshi Kihara (1):
  arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

Tested using the following procedure with patches applied
on renesas-devel-20190308-v5.0 and kernel compiled using
renesas_defconfig.

1. Add no_console_suspend to kernel command line
2. Boot system
3. # echo on > /sys/bus/i2c/drivers/bd9571mwv/8-0030/bd9571mwv-regulator.0.auto/backup_mode
4. Toggle SW23 to off position
   System suspends with following displayed on console

   [   91.486537] PM: suspend entry (deep)
   [   91.490281] PM: Syncing filesystems ... done.
   [   91.500460] Freezing user space processes ... (elapsed 0.001 seconds)
   done.
   [   91.509392] OOM killer disabled.
   [   91.512679] Freezing remaining freezable tasks ... (elapsed 0.001
   seconds) done.
   [   91.531235] ravb e6800000.ethernet eth0: Link is Down
   [   91.670747] Disabling non-boot CPUs ...
   [   91.676106] CPU1: shutdown
   [   91.678932] psci: CPU1 killed.

5. Toggle SW23 to on position
   System resumes with the following output to the console

   INFO:    ARM GICv2 driver initialized
   NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA53) Rev.2.0.1
   NOTICE:  BL2: PRR is R-Car E3 Ver.1.0
   NOTICE:  BL2: PLL1 nonSSCG Clock select
   NOTICE:  BL2: Board is Ebisu-4D Rev.1.0
   NOTICE:  BL2: Boot device is HyperFlash(80MHz)
   NOTICE:  BL2: LCM state is CM
   NOTICE:  BL2: DDR1856(rev.0.11)
   NOTICE:  BL2: [WARM_BOOT]
   NOTICE:  BL2: DRAM Split is OFF
   NOTICE:  BL2: QoS is default setting(rev.0.05)
   NOTICE:  BL2: DRAM refresh interval 3.9 usec
   NOTICE:  BL2: CH0: 400000000 - 47fffffff, 2 GiB
   NOTICE:  BL2: FDT at 0xe63145d8
   NOTICE:  BL2: v2.0(release):v2.0-986-gc48d02bade88-dirty
   NOTICE:  BL2: Built : 09:27:42, Mar 11 2019
   NOTICE:  BL2: Normal boot
   INFO:    BL2: Doing platform setup
   [   91.683834] Enabling non-boot CPUs ...
   [   91.688141] Detected VIPT I-cache on CPU1
   [   91.688231] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
   [   91.689094]  cache: parent cpu1 should not be sleeping
   [   91.705420] CPU1 is up
   [   91.840419] usb usb2: root hub lost power or was reset
   [   91.845755] usb usb1: root hub lost power or was reset
   [   91.973264] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=169)
   [   92.064085] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
   [   92.070904] OOM killer enabled.
   [   92.074096] Restarting tasks ...
   [   92.074158] [drm] No driver support for vblank timestamp query.
   [   92.085011] done.
   [   92.089628] PM: suspend exit
   [   92.096382] thc63lvd1024 lvds-decoder: Linked as a consumer to regulator.2
   [   92.103645] thc63lvd1024 lvds-decoder: Dropping the link to regulator.2
   [   97.553658] ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off

-- 
2.11.0

