Return-Path: <SRS0=bPEI=5M=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819DEC43331
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 27 Mar 2020 09:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53A8F20714
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 27 Mar 2020 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585302040;
	bh=YNblC1Te+NnH+tVLZGuNaUudgVmmDKU7LpG7BsOUQ1g=;
	h=Subject:From:Date:To:List-ID:From;
	b=JUhOxZzRKP/s2l385CtMWn9UNyOimB+rnVL00krHFtF2sBmjsOLVEGFEAG6kxGquq
	 YWF/MR5zCmJSRZm+5FIoXStONVQuR6xfZlAkVuk5C+K6h2H0qhns6bBTfsIc3wZ0cY
	 XnRYLy7kRFT3kCh4agz7A8WrqLc7q6ockT82xtOA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgC0Jkk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 05:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgC0Jkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 05:40:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585302039;
        bh=YNblC1Te+NnH+tVLZGuNaUudgVmmDKU7LpG7BsOUQ1g=;
        h=Subject:From:Date:To:From;
        b=xpuHSlhML9ExObzD91HhLKiIcwgYxu/SzFOFOr/FqNhWCladfqopuClD0ibZNQfW0
         +a9I5XFuNFCy1EnEvoo324j1QWiGi5KFkZjkV6Xk86NSzLJnPPeQ5PFbVCaWTt6uaN
         iltN72rsJG4/U99H2YqjcwQph01WiuELlbK3kLEw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158530203957.28357.5689230389771292809.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 27 Mar 2020 09:40:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] dt-bindings: phy: add r8a77961 support (2020-03-27T09:33:52)
  Superseding: [v3] dt-bindings: phy: add r8a77961 support (2020-03-27T05:28:39):
    [v3,1/4] dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema
    [v3,2/4] dt-bindings: phy: renesas: usb2-phy: add r8a77961 support
    [v3,3/4] dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema
    [v3,4/4] dt-bindings: phy: renesas: usb3-phy: add r8a77961 support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
