Return-Path: <SRS0=lsBT=4X=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FFDC10DCE
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Mar 2020 09:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06E592084E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Mar 2020 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583485244;
	bh=jp4LFe1PiAcjPRxtxGw8/TdE/AS1IBGk5GJReK+ycgA=;
	h=Subject:From:Date:To:List-ID:From;
	b=reOzLPDUJFfki5wbZ1SCUPEraeRmE2ZyygmFoNCVaZM7IG/t3arkAU1A+cIdvhCUW
	 f+Z1vl9djXDwy0mtQVBT8tCYxEhrAIwMO5dy6D33iaBtWGPIcQ8nGLb45yfyhadRi8
	 TZGzBTWoZAfwWthS1qS977zzWT6gDnUvMRf5Ck5E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgCFJAn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 6 Mar 2020 04:00:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:52542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgCFJAn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 04:00:43 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583485243;
        bh=jp4LFe1PiAcjPRxtxGw8/TdE/AS1IBGk5GJReK+ycgA=;
        h=Subject:From:Date:To:From;
        b=Tnw2jw3wFmU/WiQ8N00i7YRlF19d3Rzdt0tFQJ2w46uM/7xAbsqBJlW+wKinE8jAv
         bQh+TSJNYLyT/ThsJjQWZndwCwh2oLRwbTlsoTqRxsD15AImcXLLiH3JeBL4LZeY6W
         fiktRaC2Kg1EtelNLMjHs5hdhWVEcZ3Mcj4OUpN4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158348524318.10844.7200618785838567755.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 06 Mar 2020 09:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] spi: dt-bindings: spi-controller: Slave mode fixes (2020-03-06T08:50:37)
  Superseding: [v2] spi: dt-bindings: spi-controller: Slave mode fixes (2020-03-03T09:45:20):
    [v2,1/2] spi: dt-bindings: spi-controller: Fix #address-cells for slave mode
    [v2,2/2] spi: dt-bindings: spi-controller: Fix spi-[rt]x-bus-width for slave mode


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
