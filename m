Return-Path: <SRS0=hv6C=CZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12BEC433E2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Sep 2020 22:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B40F6206B7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Sep 2020 22:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600296030;
	bh=rm03nDzOVGUqoNZZF1lugRVzyZ/IUGPMEANvfjnPhng=;
	h=Subject:From:Date:To:List-ID:From;
	b=P3OiXuM1Tk/bG7DPRUsFxhI+lD6icU6cZ8/OFAbl7Afhva4MTS9EBqfJlrvuB4KBm
	 YQKCqLhg4BObtLYEJy0FTBSJV5e2HlkjsEGWHVlR3fiTvNJolrVnc3nbFtYIJau/Dq
	 lPFdmFfPZnO8kftIqrcKzlF0s89zKKCseTLvBJEM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgIPWka (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 18:40:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbgIPWka (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 18:40:30 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600291249;
        bh=rm03nDzOVGUqoNZZF1lugRVzyZ/IUGPMEANvfjnPhng=;
        h=Subject:From:Date:To:From;
        b=Tz5xzt16gEXqZG5Ps2lhGb7DNGMP3sRok3K0+PP/ho2xu+Lghp5mTjQLhcM+4Haib
         yMZZvV3pVVeRn3H86CZJI9XFe6znh6QPkZ1gg+fyDlWy6wkiNyb3jfKO4050uSv12l
         OQFrqHiEI2ELyiil4N97rHvi1IE15KoBMjaylFDE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160029124934.11097.2811587105916917773.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 16 Sep 2020 21:20:49 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] ARM: dts: / gpio: Add dtschema for NXP PCA953x and correct dts (2020-09-16T15:57:15)
  Superseding: [v2] ARM: dts: / gpio: Add dtschema for NXP PCA953x and correct dts (2020-09-10T17:57:18):
    [v2,01/15] dt-bindings: gpio: convert bindings for NXP PCA953x family to dtschema
    [v2,02/15] dt-bindings: gpio: convert bindings for Maxim MAX732x family to dtschema
    [v2,03/15] arm64: dts: mediatek: fix tca6416 reset GPIOs in pumpkin
    [v2,04/15] arm64: dts: mediatek: align GPIO hog names with dtschema
    [v2,05/15] arm64: dts: renesas: align GPIO hog names with dtschema
    [v2,06/15] arm64: dts: ti: align GPIO hog names with dtschema
    [v2,07/15] arm64: dts: xilinx: align GPIO hog names with dtschema
    [v2,08/15] ARM: dts: am335x: lxm: fix PCA9539 GPIO expander properties
    [v2,09/15] ARM: dts: am335x: t335: align GPIO hog names with dtschema
    [v2,10/15] ARM: dts: am3874: iceboard: fix GPIO expander reset GPIOs
    [v2,11/15] ARM: dts: aspeed: fix PCA95xx GPIO expander properties on Portwell
    [v2,12/15] ARM: dts: aspeed: align GPIO hog names with dtschema
    [v2,13/15] ARM: dts: dove: fix PCA95xx GPIO expander properties on A510
    [v2,14/15] ARM: dts: armada: align GPIO hog names with dtschema
    [v2,15/15] ARM: dts: imx6q: align GPIO hog names with dtschema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
