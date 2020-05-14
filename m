Return-Path: <SRS0=IUT2=64=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACDDC433E0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 May 2020 15:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA0120657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 May 2020 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589470841;
	bh=4HxGsJkCYOG+ItCzxGsROfK4fY04H/qf4U62bK+6TNw=;
	h=Subject:From:Date:To:List-ID:From;
	b=yWhGBwJ/MO5+cLcUPBquoI2H9uL9UKdTENt4MyVp2FVuciMQbtjCcGC/qX2zz+XYv
	 cxRTGCHFhsDxWlQBw1bhDh1l0ZK7jqlViV3B8H6GlDaTPlgpsJjpFchjkiXVLcNZLv
	 EsVQ+z2puM1yXiYC4/6boXerbcu14785ZvnfBRYI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgENPkk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 May 2020 11:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:56734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgENPkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 11:40:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589470840;
        bh=4HxGsJkCYOG+ItCzxGsROfK4fY04H/qf4U62bK+6TNw=;
        h=Subject:From:Date:To:From;
        b=2LvEOXe7YLlmY0yWgjSZZeVU3mYyXvJUI73f6Uv9f/v/+9lRwZ7wcaav978zDIUjm
         1b5Mut/2dy/2CBlOuE4KsLDXPrMsSv5NteNkCSObItqTJ0+rBH1u3Y+cw2mwQwIDU7
         L9hPw7bLSLMxQvNPX33UaHpT6JwAGQrTF0wkSgLE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158947084024.31432.16655221474782028221.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 14 May 2020 15:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] thermal: rcar_thermal: Clean up rcar_thermal_update_temp() (2020-05-14T15:25:05)
  Superseding: [v1] thermal: rcar_thermal: Clean up rcar_thermal_update_temp() (2020-04-15T17:23:49):
    thermal: rcar_thermal: Clean up rcar_thermal_update_temp()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
