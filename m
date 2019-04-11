Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E59C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D125F217D4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfDKHyr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:54:47 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:49750 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfDKHyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 03:54:46 -0400
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3B7sSfV037396;
        Thu, 11 Apr 2019 16:54:28 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp);
 Thu, 11 Apr 2019 16:54:28 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3B7sM9q037359
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Apr 2019 16:54:27 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH v2 00/20] Add more support to the RZ/G1C (r8a77470) SoC
Date:   Thu, 11 Apr 2019 16:54:02 +0900
Message-Id: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear everyone,

This series adds HSCIF,MSIOF,PWM,CAN,VIN,Audio,Audio-DMAC,Ether,VSP,FDP1,LVDS support 
for the RZ/G1C (r8a77470) SoC. It is based on the renesas-drivers-2019-04-02-v5.1-rc3 tag 
of renesas-drivers tree. Currently, I only add patches to the tree and compiled. 
Unfortunately, RZ/G1C board is not available, so I have not tested these patches on this board yet.

cc Biju,
I know it is very difficult. however I still want to ask if you can help me test them?
If possible, I will send the .dts file separately to you.
Because I am known you can be available this board. Thanks!

Cao Van Dong (20):
  ARM: dts: r8a77470: Add HSCIF support
  ARM: dts: r8a77470: Add MSIOF support
  ARM: dts: r8a77470: Add PWM support
  ARM: dts: r8a77470: Add CAN support
  ARM: dts: r8a77470: Add VIN support
  ARM: dts: r8a77470: Add Audio support
  ARM: dts: r8a77470: Add Audio-DMAC support
  ARM: dts: r8a77470: Add Ether support
  ARM: dts: r8a77470: Add VSP support
  ARM: dts: r8a77470: Add FDP1 support
  ARM: dts: r8a77470: Add LVDS support
  ARM: dts: r8a77470: Add audio clocks
  ARM: dts: r8a77470: Add can clocks
  dt-bindings: display: renesas: lvds: Add r8a77470 support
  media: dt-bindings: media: rcar_vin: Document r8a77470 bindings
  ASoC: rsnd: Document r8a77470 bindings
  dt-bindings: pwm: Document r8a77470 bindings
  sh_eth: Document r8a77470 bindings
  spi: sh-msiof: Document r8a77470 bindings
  dt-bindings: can: rcar_can: Document r8a77470 bindings

 .../bindings/display/bridge/renesas,lvds.txt       |   1 +
 .../devicetree/bindings/media/rcar_vin.txt         |   1 +
 .../devicetree/bindings/net/can/rcar_can.txt       |   1 +
 Documentation/devicetree/bindings/net/sh_eth.txt   |   1 +
 .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |   1 +
 .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
 Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 +
 arch/arm/boot/dts/r8a77470.dtsi                    | 608 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
 9 files changed, 616 insertions(+)

-- 
2.7.4

