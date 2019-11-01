Return-Path: <SRS0=MG+9=YZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0924ACA9EC9
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Nov 2019 07:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D244D217D9
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Nov 2019 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572592849;
	bh=TkylrX/p8m6th6igFuVQjSK+kJUkcU56pa4liN7IGcY=;
	h=Subject:From:Date:To:List-ID:From;
	b=0EF0RvPbaGI6axjrXHt7qIabpBP4BzpuCDjfq9u9qbZpiK8swtvmJ9w8Yvh2UqvXS
	 lLSXym6UATt+C6uBj73JVQIKPQwhCB+W31OgygiQd0WQ/p3yEsl6IeQLrBGcPVmGQ/
	 li5BaK+zGEM6aOOp7XGuijHc4fduvuHfZYOQfRuw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbfKAHUt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Nov 2019 03:20:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:57668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbfKAHUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 03:20:49 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572592848;
        bh=TkylrX/p8m6th6igFuVQjSK+kJUkcU56pa4liN7IGcY=;
        h=Subject:From:Date:To:From;
        b=TwIO/5Is5BHO4Gr9kZOdO5aWTSvDiEGnUMMFVu1U/KLUVpECXyu3UXzTvh22vfbJk
         Ui46VIv561sGJjv89fv/ayG9U9uCTx1zzj/igPf/oe8F3xhRcTFN3nWnzHNJ1768t2
         ZZ4gbm+P4EUJdd3IsRK89VQcR8QMI+Z0wC5wXEOY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157259284888.10412.7518159650036685816.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 01 Nov 2019 07:20:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling (2019-11-01T07:03:07)
  Superseding: [v2] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling (2019-10-28T06:07:28):
    [v2,1/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s properties
    [v2,2/4] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains and resets properties
    [v2,3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
    [v2,4/4] clk: renesas: rcar-usb2-clock-sel: Add reset_control

Latest series: [v2] dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema (2019-11-01T07:19:23)
  Superseding: [v1] dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema (2019-10-18T08:38:53):
    dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema

Latest series: [v2] dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema (2019-11-01T07:19:31)
  Superseding: [v1] dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema (2019-10-18T08:39:14):
    dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
