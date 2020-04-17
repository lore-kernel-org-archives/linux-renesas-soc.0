Return-Path: <SRS0=LKxZ=6B=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D81C2BB1D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 17 Apr 2020 04:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9439B21D94
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 17 Apr 2020 04:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587096038;
	bh=wrA2m/T+azMABV6BgFvobpQ7Vh8iQLOuRS6fXIVLRzI=;
	h=Subject:From:Date:To:List-ID:From;
	b=032zpzDrgl4FM/h9bORk/x5CbNYXSHjrwSp5+HCwNADA9Z6qXGiJCExs6y6Kp3u+b
	 4g5vnt96IQoEWGlbODYwJGS0Rsob5q/FZGf0PVJ7Uuv0YB3Jyz01IBx+0UqLXLg8Qe
	 8skYCgwMoZMLccMO4Fq2Tz5a35joWoHVNMBQKsHQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgDQEAi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 17 Apr 2020 00:00:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:53720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgDQEAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 00:00:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587096037;
        bh=wrA2m/T+azMABV6BgFvobpQ7Vh8iQLOuRS6fXIVLRzI=;
        h=Subject:From:Date:To:From;
        b=ZlieOgZtbkcj6da8eah6Pke2pNu6vh2D0/hpXhW/ZvxVPRiP7ICLN41/RfaZmytHx
         pl0ffepkkCkgBnofO2q9cpk3ZI40tKI3fr1rghSWPiY9ipzJUhAZLPulrsRk2YxuJN
         lHRlmqQLafxGyARiDOvx5KvNSQq1cfn1QgocgUJo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158709603791.26300.681473428186454849.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 17 Apr 2020 04:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: dma: renesas,{rcar,usb}-dmac: convert to json-schema (2020-04-17T03:55:14)
  Superseding: [v1] dt-bindings: dma: renesas,{rcar,usb}-dmac: convert to json-schema (2020-04-10T10:02:01):
    [1/2] dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
    [2/2] dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
