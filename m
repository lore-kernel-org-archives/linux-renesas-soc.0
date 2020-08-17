Return-Path: <SRS0=+nxL=B3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CABC433DF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Aug 2020 05:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3901C20578
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Aug 2020 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597640441;
	bh=7rVsO1fCVLr+jZWcC3a5UGlgrCtMtWSpDzbSm+/llRM=;
	h=Subject:From:Date:To:List-ID:From;
	b=Spo3R6nC8WhV/LtbnrtDpYD4b7BwrHiPY2g42/BbTWc/tL9eOfUMsd8/xvq1fy9RX
	 McDhs9TEnIEbAJEKoECl4Et4wnmUn1M1l3j6x7lPtzG9DB0nY+5kuUsGfWZMJutxoT
	 akUk+Yb0YBgXNwHF8iCquZ6ouelQSyW+z2BEpBPk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgHQFAk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Aug 2020 01:00:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:42098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbgHQFAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Aug 2020 01:00:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597640439;
        bh=7rVsO1fCVLr+jZWcC3a5UGlgrCtMtWSpDzbSm+/llRM=;
        h=Subject:From:Date:To:From;
        b=pL+6rZ4kV+X0pF5tGUzoVPgAF499di/ckCoZzDF/JtN4bb+VJEqeCSFMJ7p3MUIIt
         eeKqF2lohaBxtHw6gtO9rcsucX5S/DJ4q3Pfl8ABHqkzAgK3FbjSEjB+0oai4Z2haP
         wEodct7lf/HjsIN4Ail71sBbdShO3S52i+cbuto0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159764043930.2008.9456437635852968776.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 17 Aug 2020 05:00:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] soc: renesas: use menu for Renesas SoC (2020-08-17T04:50:24)
  Superseding: [v1] soc: renesas: use menu for Renesas SoC (2020-08-04T06:12:20):
    soc: renesas: use menu for Renesas SoC

Latest series: [v2] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place (2020-08-17T04:44:55)
  Superseding: [v1] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place (2020-08-04T06:11:04):
    pinctrl: sh-pfc: collect Renesas related CONFIGs in one place


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
