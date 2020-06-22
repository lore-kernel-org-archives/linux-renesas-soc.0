Return-Path: <SRS0=HWyP=AD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1211C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Jun 2020 10:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E624206EB
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Jun 2020 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592822440;
	bh=JyxtpUlhE6EN07TL9807VOleDjxt0K4qCi9qMDprubA=;
	h=Subject:From:Date:To:List-ID:From;
	b=tAm+XMdZE3B4ogsTWvlOFNx7D6M7Ya/ZOeRZPi3Z1Izqg28Bm+00LpR/ZzpinM0RH
	 8BuTCHx7M0xFrKnqLcWQa4ZyWwYCRt/sNGTvaHq42JvIxFBB6omDTyX3brKB7fMnT6
	 5Zky4EZLt2wWd9bWXc2jKXPygxF6NZ7sZh+iWjPc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgFVKkk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 22 Jun 2020 06:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbgFVKkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 06:40:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592822440;
        bh=JyxtpUlhE6EN07TL9807VOleDjxt0K4qCi9qMDprubA=;
        h=Subject:From:Date:To:From;
        b=qzic2ToZzwyNMNSk/CvA0nBcIy7tV00TE0OZt3C50wNCgl48Tn2QEEV8U2984bDCL
         BnfUZBAvzi08JmBYSIgIyIwSUYcPpKpC2umedEUX31MqqPauUDsOKoA7y9Yyiv6Cnb
         lTGfsVa064FktRXgeoZ0eeAOstcI3LNRkbt3cmfo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159282244000.6852.2410901749596100656.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 22 Jun 2020 10:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: usb: renesas,usb-xhci: convert to YAML (2020-06-22T10:37:32)
  Superseding: [v1] dt-bindings: usb: renesas,usb-xhci: convert to YAML (2020-06-15T11:19:49):
    dt-bindings: usb: renesas,usb-xhci: convert to YAML


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
